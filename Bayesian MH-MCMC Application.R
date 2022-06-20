# Load Libraries ----------------------------------------------------------

# load the grid and functions to be used
load("Grid_and_Functions.RData")
library(mpcmp)
library(mvtnorm)
require(foreign)
require(ggplot2)
require(MASS)
library(bayestestR)

# Fit the model and get the parameters ------------------------------------


## Fit full model using glm: Activate dataset of interest by uncommenting below:
  # Underdispersed takeoverbids # nu = 1.75
  # data(takeoverbids)
  # fit.original <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght
  #                         + bidprem + insthold + size + sizesq + regulatn, data = takeoverbids)
  # y = takeoverbids$numbids
  
  # Underdispersed Cottonbolls # nu = 4.85
  # data(cottonbolls)
  # fit.original <- glm.cmp(nc~ 1+stages:def+stages:def2, data= cottonbolls)
  # y = cottonbolls$nc
  
  # Overdispersed Class Attendance # nu = 0.02
  # data(attendance)
  # fit.original <- glm.cmp(daysabs~ gender+math+prog,data=attendance)
  # y = attendance$daysabs
  
  # Overdispersed Fish Dataset # nu = 0.027
  data(fish)
  fit.original <- glm.cmp(species ~ 1 + log(area) + latitude, data = fish)
  y = fish$species
  
  # Overdispersed Sitophilus Dataset # nu = 0.39
  # data(sitophilus)
  # fit.original <- glm.cmp(formula = ninsect ~ extract,  data = sitophilus)
  # y = sitophilus$ninsect

# look at the glm summary
  summary(fit.original)

# x matrix for the problem
  x.matrix = fit.original$x

# attributes of the fitted model:
  # fitted betas
  Beta.hat = fit.original$coefficients
  
  #fitted dispersion
  nu.hat = fit.original$nu
  
  # variance matrix for proposal distribution
  Sigma_B = fit.original$variance_beta
  
  # prior mean and variance for Beta
  p = dim(x.matrix)[2]
  mu0 = rep(0,p)
  Sigma0 = diag(p)*10^5
  
  # define maximum sum - can define here before the parameter, or inside the
  # loop simulation below , or totally comment out for adaptive summax
  # summax0 = max(100,ceiling(max(means0 + 20 * sqrt(means0/nu0)))) 


# simulate MH-MCMC for fast dcomp -----------------------------------------

# to simulate using Method c), use dcomp.fast4
# to simulate using Method d), use dcomp.fast5

K = 10000 # number of MCMC samples
max_i = 10 # maximum iteration
time_keeper2 = matrix(0,max_i,3)

for(i in 1:max_i){
# initial value for Beta
Beta0 = Beta.hat # this is our MLE

# initial value for nu
nu0 = nu.hat # this is our MLE 

# initial values for priors
means0 = exp(x.matrix%*%Beta0)
loglike_0 = sum(dcomp.fast5(y, means0, nu0, log.p=T)) #+ dmvnorm(Beta0, mu0, Sigma0, log=T)
summax0 = max(100,ceiling(max(means0 + 20 * sqrt(means0/nu0)))) # 100 or maximum of expression given

## use fast dcomp
Betas = matrix(, nrow = K, ncol = p)
nus = matrix(,nrow=K, ncol = 1)
colnames(Betas) =  names(Beta.hat)
colnames(nus) = "dispersion"
ptm <- proc.time()
for(k in 1:K){
  
  if(k%%100==0) {
    cat(paste0("iteration: ", k, "\n"))
  }
  
  # use normal sample proposals
  Beta1 = rmvnorm(1, Beta0, Sigma_B)
  means1 = exp(x.matrix%*%t(Beta1))
  loglike_1 = sum(dcomp.fast5(y, means1, nu0, log.p = T, summax=summax0)) #+ dmvnorm(Beta1, mu0, Sigma0, log=T)
  # remove comment above for normal prior, otherwise flat prior
  loglikediff = loglike_1 - loglike_0
  logprob = log(runif(1))
  if(logprob < loglikediff){
    Beta0 = Beta1
    loglike_0 = loglike_1
    means0 = means1
  }
  Betas[k,] = Beta0
  
  # use exponential sample proposals
  nu1 = rexp(1, 1/nu0) 
  # can also use normal sample proposals too, but need to comment out
  # '+ log(nu.ratio) + nu.ratio - 1/nu.ratio' in loglikediff below
  # lognu1 = rnorm(1,0,1)
  # nu1 = exp(lognu1)
  loglike_1 = sum(dcomp.fast5(y, means0, nu1, log.p = T, summax=summax0))
  nu.ratio = nu1/nu0
  loglikediff = loglike_1 - loglike_0 + log(nu.ratio) + nu.ratio - 1/nu.ratio
  logprob = log(runif(1))
  if(logprob < loglikediff){
    nu0 = nu1
    loglike_0 = loglike_1
  }
  nus[k,] = nu0
}

# time taken for the MH-MCMC simulations
time.fast = proc.time() - ptm
time_keeper2[i,1]=time.fast[1]
time_keeper2[i,2]=time.fast[2]
time_keeper2[i,3]=time.fast[3]
}
# look how it performs
# time spent for max_i iterations
time_keeper2 
# standard deviation of time spent for max_i iterations
c(sd(time_keeper2[,1]),sd(time_keeper2[,2]),sd(time_keeper2[,3]))
# mean of the time spent for max_i iterations
colMeans(time_keeper2)
# roughly look at nu distribution.
summary(nus)



# simulate the MH-MCMC for original dcomp ---------------------------------
## use original dcomp
K = 10000 # number of MCMC samples
max_i = 10 # maximum iteration 
time_keeper = matrix(0,max_i,3)
for(i in 1:max_i){
# initial value for Beta
Beta0 = Beta.hat

# initial value for nu
nu0 = nu.hat

means0 = exp(x.matrix%*%Beta0)
loglike_0 = sum(dcomp(y, means0, nu0, log.p=T)) #+ dmvnorm(Beta0, mu0, Sigma0, log=T)
# remove comment above for normal prior, otherwise flat prior
summax0 = max(100,ceiling(max(means0 + 20 * sqrt(means0/nu0)))) # 100 or maximum of expression given

# use direct dcomp
Betas = matrix(, nrow = K, ncol = p)
nus = matrix(,nrow=K, ncol = 1)
colnames(Betas) =  names(Beta.hat)
colnames(nus) = "dispersion"
ptm <- proc.time()
for(k in 1:K){

  if(k%%100==0) {
    cat(paste0("iteration: ", k, "\n"))
  }

  Beta1 = rmvnorm(1, Beta0, Sigma_B)
  means1 = exp(x.matrix%*%t(Beta1))
  loglike_1 = sum(dcomp(y, means1, nu0, log.p = T,summax=summax0)) #+ dmvnorm(Beta1, mu0, Sigma0, log=T)
  # remove comment above for normal prior, otherwise flat prior
  loglikediff = loglike_1 - loglike_0
  logprob = log(runif(1))
  if(logprob < loglikediff){
    Beta0 = Beta1
    loglike_0 = loglike_1
    means0 = means1
  }
  Betas[k,] = Beta0
  
  # use exponential sample proposals
  nu1 = rexp(1, 1/nu0)
  # can also use normal sample proposals too, but need to comment out
  # '+ log(nu.ratio) + nu.ratio - 1/nu.ratio' in loglikediff below
  # lognu1 = rnorm(1,0,1)
  # nu1 = exp(lognu1)
  loglike_1 = sum(dcomp(y, means0, nu1, log.p = T,summax=summax0))
  nu.ratio = nu1/nu0
  loglikediff = loglike_1 - loglike_0 + log(nu.ratio) + nu.ratio - 1/nu.ratio
  logprob = log(runif(1))
  if(logprob < loglikediff){
    nu0 = nu1
    loglike_0 = loglike_1
  }
  nus[k,] = nu0
}

# time taken for the MHMCMC simulations
time.exact = proc.time() - ptm
time_keeper[i,1]=time.exact[1]
time_keeper[i,2]=time.exact[2]
time_keeper[i,3]=time.exact[3]
}
# look how it performs
# time spent for max_i iterations
time_keeper
# standard deviation of time spent for max_i iterations
c(sd(time_keeper[,1]),sd(time_keeper[,2]),sd(time_keeper[,3]))
# mean of the time spent for max_i iterations
colMeans(time_keeper)
# roughly look at nu distribution.
summary(nus)


# compare the time.fast and time.exact for comparing 
# speed original dcomp and fast dcomp
# time.fast
# time.exact


# Posterior density plots of thinned samples -------------------------------------------------------------------------

# this code below will give posterior distribution with 95% credible interval
# of the MH-MCMC samples generated from the previous part either using 
# fast dcomp or original dcomp. Note that here we do thinning every 10 samples

# you may modify it based on the dimension of the plots you need to fit 
par(mfrow=c(2,2)) # adjust the size depending on the size you want to plot in

#for betas
  post_means = matrix(0,dim(Betas)[2],1)
  for (i in 1:dim(Betas)[2]){
    plot(density(Betas[10*(1:1000),i]),main=colnames(Betas)[i]) 
    post_means[i,1] = mean(Betas[,i])
    
    # give blue straightline for posterior mean
    abline(v=post_means[i,1],col="blue")
    text(x=post_means[i,1],y=max(density(Betas[10*(1:1000),i])$y)/2,labels= round(post_means[i,1],2)) 
    
    # give red dotted line for 95% credible interval
    Cred_int=ci(Betas[,i],method="ETI") # can change use the "HDI"
    abline(v=c(Cred_int[2],Cred_int[3]),col=c("red","red"),lty = c(2,2),lwd=c(1,1))
    text(x=Cred_int[2],y=max(density(Betas[10*(1:1000),i])$y)*2/3,labels = round(as.numeric(as.character(Cred_int[2])),2))
    text(x=Cred_int[3],y=max(density(Betas[10*(1:1000),i])$y)*2/3,labels = round(as.numeric(as.character(Cred_int[3])),2))
  }
  title("Posterior Density Plots for Each Explanatory Variable, Thinned Every 10 Observation", line = -1, outer = TRUE)
  

# for nu
  plot(density(nus[10*(1:1000)]),main =expression(paste("Posterior Density Plot Thinned every 10 Observation for ",nu)))# 
  # give blue straightline for posterior mean
  abline(v=mean(nus),col="blue")
  text(x=mean(nus),y=max(density(nus[10*(1:1000)])$y)/2,labels=round(mean(nus),2))
  # give red dotted line for 95% credible interval
  Cred_int_nus = ci(nus,method="ETI") # can change use the "HDI"
  abline(v=c(Cred_int_nus[2],Cred_int_nus[3]),col=c("red","red"),lty = c(2,2),lwd=c(1,1))
  text(x=Cred_int_nus[2],y=max(density(nus[10*(1:1000)])$y)*2/3,labels = round(as.numeric(as.character(Cred_int_nus[2])),2))
  text(x=Cred_int_nus[3],y=max(density(nus[10*(1:1000)])$y)*2/3,labels = round(as.numeric(as.character(Cred_int_nus[3])),2))

# Notes: if posterior nus distribution contains 1, then using Poisson may be okay 
