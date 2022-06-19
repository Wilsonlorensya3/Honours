# Honours
Coding used for Honours project <br />
All code is written in R , and any notations, jargons used are referred to the original thesis PDF


# Grid_and_Functions.Rdata Description:

## Grid: <br />
pre computed $\mu$ grid and nu grid are given in variable <br />
`mu.grid` and `nu.grid` give the combinations of mu and nu to be calculated for parameter of interest <br />

## Calculated Parameter of Interest on The Above mu and nu Grid: <br />
`logZ` to obtain log of normalization constant Z <br />
`lambda` to obtain parameter lambda <br />
`logLambda` to obtain log of parameter lambda <br />
<!---
`compvar` to obtain variance of X <br />
`compvarlogfactorialy` to obtain variance of log(X!) <br />
`compmeanlogfactorialy` to obtain mean of log(X!) <br />
`compmeanylogfactorialy` to obtain mean of X log(X!) <br />
--->
## Functions and Variable definitions:
 `exact` is for obtaining logLambda from the original `mpcmp` package <br />
 `interp` is for doing interpolation for logLambda <br />
 `extrap.mu` is for doing extrapolating mu, but interpolating nu for logLambda <br />
 `extrap.nu` is for doing extrapolating nu, but interpolating mu for logLambda <br />
 `extrap.both` is for doing extrapolating both mu and nu for logLambda <br />
 `interp_extrap` is for doing either interpolation or extrapolation for both mu and/or nu depending on its values and position in the grid for logLambda <br />

 `exact2` is for obtaining logZ from the original `mpcmp` package using mu as input <br />
 `exact3` is for obtaining logZ from the original `mpcmp` package using logLambda as input <br />
 `interp2` is for doing interpolation for logZ <br />
 `extrap.mu2` is for doing extrapolating mu, but interpolating nu for logZ <br />
 `extrap.nu2` is for doing extrapolating nu, but interpolating mu for logZ <br />
 `extrap.both2` is for doing extrapolating both mu and nu for logZ <br />
 `interp_extrap2` is for doing either interpolation or extrapolation for both mu and/or nu depending on its values and position in the grid for logZ <br />


 `get_logLambda_v23Feb` is Method 1 for obtaining log lambda <br />
 `get_logZ_v23Feb` is Method 1 for obtaining log Z <br />
 `vec_get_logLambda` is Method 2 for obtaining log lambda  <br />
 `vec_get_logZ` is Method 2 for obtaining log Z  <br />
 `get_logLambda_v4Mar` is Method 3 for obtaining log lambda <br />
 `get_logZ_v4Mar` is Method 3 for obtaining log Z <br />
 `get_logLambda_v3Mar` is Method 4 for obtaining log lambda <br />
 `get_logZ_v3Mar` is Method 4 for obtaining log Z # DOUBLE CHECK <br />


 `dcomp.fast` is Method a) for obtaining pmf <br />
 `dcomp.fast2` is Method b) for obtaining pmf <br />
 `dcomp.fast4` is Method c) for obtaining pmf <br />
 `dcomp.fast5` is Method d) for obtaining pmf <br />

# CD4_and_Warpbreaks.R Description:
R file to show underdispersion and overdispersion case for Chapter 1

# Time_comparison.R Description:
R file to create plots for Chapter 3 and Chapter 4 of the original thesis PDF

# Bayesian MH-MCMC Application.R Description:
R file to simulate Bayesian framework MH-MCMC for Chapter 4 of the original thesis PDF
