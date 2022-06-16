# Chapter 1
# preliminary results using well-known dataset

# Underdispersed CD4 ------------------------------------------------------


a = read.csv("cd4.csv")


# show the underdispersion per group too!

glm_a = glm(oneyear~baseline, data=a,family= quasipoisson(link="identity"))
glm_a2= glm(oneyear~baseline, data=a,family= quasipoisson(link="log"))

summary(glm_a)
# remember that dispersion here is 0.167 - still underdispersed 
summary(glm_a2)
# remember that dispersion here is 0.173 - still underdispersed 


# Overdispersed Warpbreaks ------------------------------------------------


b = warpbreaks

# conditional mean and conditional variance per group 
mean(b[b$tension =="L",1])
var(b[b$tension =="L",1])
mean(b[b$tension =="M",1])
var(b[b$tension =="M",1])
mean(b[b$tension =="H",1])
var(b[b$tension =="H",1])

# using wool and tension and its interactions using quasipoisson log link
glm_b4= glm(breaks~wool*tension,data=b,family=quasipoisson(link="log"))
summary(glm_b4)
# remember that dispersion here is 3.76 - still overdispersed 

# using wool and tension and its interactions using negative binomial log link
library(MASS)
glm_b4b= glm.nb(breaks~wool*tension,data=b,link="log")
summary(glm_b4b)




