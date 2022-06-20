# testing accuracies for Table in Chapter 3 for logLambda
load("Grid_and_Functions.RData")
# log Lambda test - testing about 200 points ------------------------------------------------------
interp_Accuracy_exact = exact(seq(1.5,99.5,by=0.5),seq(1.5,99.5,by=0.5),summax = 1000)
interp_Accuracy_getlogLambda =interp(seq(1.5,99.5,by=0.5),seq(1.5,99.5,by=0.5))

mean(interp_Accuracy_exact/interp_Accuracy_getlogLambda-1)

extrap.nu_Accuracy_exact = exact(seq(13,23,by=0.05),seq(120,130,by=0.05),summax = 1000)
extrap.nu_Accuracy_getlogLambda = extrap.nu(seq(13,23,by=0.05),seq(120,130,by=0.05))

mean(extrap.nu_Accuracy_exact/extrap.nu_Accuracy_getlogLambda-1)

extrap.mu_Accuracy_exact = exact(seq(256,266,by=0.05),seq(13,23,by=0.05),summax = 1000)
extrap.mu_Accuracy_getlogLambda =extrap.mu(seq(256,266,by=0.05),seq(13,23,by=0.05))

mean(extrap.mu_Accuracy_exact/extrap.mu_Accuracy_getlogLambda-1)

extrap.both_Accuracy_exact = exact(seq(256,266,by=0.05),seq(113,123,by=0.05),summax = 1000)
extrap.both_Accuracy_getlogLambda =extrap.both(seq(256,266,by=0.05),seq(113,123,by=0.05)) 

mean(extrap.both_Accuracy_exact/extrap.both_Accuracy_getlogLambda-1)

# log Z test - testing about 200 points ------------------------------------------------------
interp_Accuracy_exact_logZ  = exact2(seq(1.5,99.5,by=0.5),seq(1.5,99.5,by=0.5),summax = 1000)
interp_Accuracy_getlogZ =interp2(seq(1.5,99.5,by=0.5),seq(1.5,99.5,by=0.5))

mean(interp_Accuracy_exact_logZ/interp_Accuracy_getlogZ-1)

extrap.nu_Accuracy_exact_logZ  = exact2(seq(13,23,by=0.05),seq(120,130,by=0.05),summax = 1000)
extrap.nu_Accuracy_getlogZ = extrap.nu2(seq(13,23,by=0.05),seq(120,130,by=0.05))

mean(extrap.nu_Accuracy_exact_logZ/extrap.nu_Accuracy_getlogZ-1)

extrap.mu_Accuracy_exact_logZ  = exact2(seq(256,266,by=0.05),seq(13,23,by=0.05),summax = 1000)
extrap.mu_Accuracy_getlogZ =extrap.mu2(seq(256,266,by=0.05),seq(13,23,by=0.05))

mean(extrap.mu_Accuracy_exact_logZ/extrap.mu_Accuracy_getlogZ-1)

extrap.both_Accuracy_exact_logZ  = exact2(seq(256,266,by=0.05),seq(113,123,by=0.05),summax = 1000)
extrap.both_Accuracy_getlogZ =extrap.both2(seq(256,266,by=0.05),seq(113,123,by=0.05)) 

mean(extrap.both_Accuracy_exact_logZ/extrap.both_Accuracy_getlogZ-1)

# dcomp test ------------------------------------------------------
mean(mpcmp:::dcomp(1:100,60,10)/dcomp.fast(1:100,60,10)-1)
sum(dcomp.fast(1:100,60,10))
mean(mpcmp:::dcomp(1:100,60,10)/dcomp.fast2(1:100,60,10)-1)
sum(dcomp.fast2(1:100,60,10))

mean(mpcmp:::dcomp(40:80,60,20)/dcomp.fast(40:80,60,20)-1)
sum(dcomp.fast(40:80,60,20))
mean(mpcmp:::dcomp(40:80,60,20)/dcomp.fast2(40:80,60,20)-1)
sum(dcomp.fast2(40:80,60,20))

mean(mpcmp:::dcomp(1:100,60,2)/dcomp.fast(1:100,60,2)-1)
sum(dcomp.fast(1:100,60,2))
mean(mpcmp:::dcomp(1:100,60,2)/dcomp.fast2(1:100,60,2)-1)
sum(dcomp.fast2(1:100,60,2))
