# Chapter 2 ------------------------------------------------------

# Section 2.1
load("Grid_and_Functions.RData")

plotcolors <- colorRampPalette(c("red","blue","green"))(length.nu.grid)
legendtitlenu <- c(nu.grid)
plotcolors2 <- colorRampPalette(c("red","blue","green"))(length.mu.grid)
legendtitlemu <- round(c(mu.grid),2)

par(mfrow = c(2, 2))

# Linear - plotting mu vs logZ for different nu values
plot(mu.grid,logZ[1:length.mu.grid,1],type="b",pch=19,xlim=c(0,max(mu.grid)),ylim=c(0,max(logZ)),xlab=expression(paste(mu)),ylab="log(Z)") # y limit can try 1000 or max(logZ)
title(main = expression(paste(mu, " vs log(Z) for different ", nu, " values")))
for(ii in 2:length.nu.grid){
  points(mu.grid,logZ[1:length.mu.grid,ii],col=plotcolors[ii],type="b",pch=19)
  # legend("topleft",lty =1.5, col=c("black",plotcolors), legend=legendtitlenu, ncol=4,cex = 0.8)
} 

# Linear -plotting nu vs logZ for different mu values
plot(nu.grid,logZ[1,1:length.nu.grid],type="b",pch=19,xlim=c(0,max(nu.grid)),ylim=c(0,max(logZ)),xlab=expression(paste(nu)),ylab="log(Z)") # x and y limit can try different number
title(main = expression(paste(nu, " vs log(Z) for different ", mu, " values")))
for(iik in 2:length.mu.grid){
  points(nu.grid,logZ[iik,1:length.nu.grid],col=plotcolors2[iik],type="b",pch=19)
  #legend("topleft",lty =1, col=c("black",plotcolors2), legend=legendtitlemu, ncol=6,cex=0.5)
} 

# Linear -plotting log(mu) vs log(Lambda) for different nu values - NOTE THAT THIS ONE USE LOG(MU)
plot(log(mu.grid),logLambda[1:length.mu.grid,1],type="b",pch=19,xlim=c(0,max(log(mu.grid))),ylim=c(0,max(logLambda)),xlab=expression(paste("log(",mu,")")),ylab=expression(paste("log(",lambda,")"))) # y limit can try 1000 or max(logLambda)
title(main = expression(paste("log(",mu,")", " vs log(",lambda,") for different ", nu, " values"))) 
for(iim in 2:length.nu.grid){
  points(log(mu.grid),logLambda[1:length.mu.grid,iim],col=plotcolors[iim],type="b",pch=19)
  # legend("topleft",lty =1, col=c("black",plotcolors), legend=legendtitlenu, ncol=3,cex=0.8)
}

# Linear -plotting nu vs log(Lambda) for different mu values
plot(nu.grid,logLambda[1,1:length.nu.grid],type="b",pch=19,xlim=c(0,max(nu.grid)),ylim=c(0,max(logLambda)),xlab=expression(paste(nu)),ylab=expression(paste("log(",lambda,")"))) # x and y limit can try different number
title(main = expression(paste(nu," vs log(",lambda,") for different ", mu, " values"))) 

for(iil in 2:length.mu.grid){
  points(nu.grid,logLambda[iil,1:length.nu.grid],col=plotcolors2[iil],type="b",pch=19)
  #legend("topleft",lty =1, col=c("black",plotcolors2), legend=legendtitlemu, ncol=6,cex=0.5)
} 

# contour plots / plot surfaces?!
contour(log(mu.grid),nu.grid,logLambda, xlab=expression(paste("log(",mu,")")),ylab=expression(paste(nu)),main= expression(paste("Contour Plot for ","log(",mu,")"," vs ", nu, " for log(",lambda,")")))
contour(mu.grid,nu.grid,logZ, xlab=expression(paste("",mu,"")),ylab=expression(paste(nu)),main= expression(paste("Contour Plot for ","",mu," vs ",nu," for log(Z",") ")))


# Section 2.1 end - proofing bounds for nu log(mu) < log(lambda) < nu log (mu+1)
# suppose mu = 1:100, nu = 100
testttt5=100*log(1:100) # nu * log(mu)
testttt6=100*log(2:101) # nu * log(mu+1)
testttt7=exact(1:100,100) # log(lambda)
plot(log(1:100),testttt7,xlab=expression(paste("log(",mu,")")),ylab="Corresponding Functions",main=expression(paste("Bounds of log(",lambda,") ","for ",mu,"=1:100,",nu,"=100")),pch=20)
lines(log(1:100),testttt5,col="blue")
lines(log(1:100),testttt6,col="red")
legend("topleft",c(expression(paste("log(",lambda,")")),expression(paste(nu,"log(",mu,")")),expression(paste(nu,"log(",mu,"+1)"))),fill = c("black","blue","red"))


# suppose mu = 10, nu = 1:100
testttt8= log(10)*(1:100)
testttt9= log(11)*(1:100)
testttt10=exact(10,1:100) # log(lambda)
plot(1:100,testttt10,ylab="Corresponding Functions",xlab=expression(paste(nu)),main=expression(paste("Bounds of log(",lambda,") ","for ",nu,"=1:100,",mu,"=10")),pch=20)
lines(1:100,testttt8,col="blue")
lines(1:100,testttt9,col="red")
legend("topleft",c(expression(paste("log(",lambda,")")),expression(paste(nu,"log(",mu,")")),expression(paste(nu,"log(",mu,"+1)"))),fill = c("black","blue","red"))


# Section 2.4
# non-convergence of mpcmp
exact(100,150)
extrap.both(100,150)
exact(100,150+1)
extrap.both(100,150+1)