# Honours
This github page contains coding used for my Honours project <br />
All code is written in R , and any notations, jargons used need to refer to the original thesis PDF

# Grid_and_Functions.Rdata Description:  <br />
Please load the Rdata file before running the other R scripts due to some functions used as described below

## Grid: <br />
pre computed μ grid and ν grid are given in variables: <br />
`mu.grid` and `nu.grid` give the combinations of μ and ν to be calculated for parameter of interest <br />

## Calculated Parameter of Interest on The Above μ and ν Grid: <br />
`logZ` to obtain log of normalization constant Z <br />
`lambda` to obtain parameter λ <br />
`logLambda` to obtain log of parameter λ <br />
<!---
`compvar` to obtain variance of X <br />
`compvarlogfactorialy` to obtain variance of log(X!) <br />
`compmeanlogfactorialy` to obtain mean of log(X!) <br />
`compmeanylogfactorialy` to obtain mean of X log(X!) <br />
--->
## Functions and Variable definitions:
 `exact` is for obtaining log(λ) from the original `mpcmp` package <br />
 `interp` is for doing interpolation for log(λ) <br />
 `extrap.mu` is for doing extrapolating μ, but interpolating ν for log(λ) <br />
 `extrap.nu` is for doing extrapolating ν, but interpolating μ for log(λ) <br />
 `extrap.both` is for doing extrapolating both μ and ν for log(λ) <br />
 `interp_extrap` is for doing either interpolation or extrapolation for both μ and/or ν depending on its values and position in the grid for log(λ) <br />

 `exact2` is for obtaining log(Z) from the original `mpcmp` package using μ as input <br />
 `exact3` is for obtaining log(Z) from the original `mpcmp` package using log(λ) as input <br />
 `interp2` is for doing interpolation for log(Z) <br />
 `extrap.mu2` is for doing extrapolating μ, but interpolating ν for log(Z) <br />
 `extrap.nu2` is for doing extrapolating ν, but interpolating μ for log(Z) <br />
 `extrap.both2` is for doing extrapolating both μ and ν for log(Z) <br />
 `interp_extrap2` is for doing either interpolation or extrapolation for both μ and/or ν depending on its values and position in the grid for log(Z) <br />


 `get_logLambda_v23Feb` is Method 1 for obtaining log(λ) <br />
 `vec_get_logLambda` is Method 2 for obtaining log(λ) and the vectorised version of `get_logLambda_Vect` <br />
 `get_logLambda_v4Mar` is Method 3 for obtaining log(λ) <br />
 `get_logLambda_v3Mar` is Method 4 for obtaining log(λ) <br />

 `get_logZ_v23Feb` is Method 1 for obtaining log(Z) <br />
 `vec_get_logZ` is Method 2 for obtaining log(Z) and the vectorised version of `get_logZ_Vect`  <br />
 `get_logZ_v4Mar` is Method 3 for obtaining log(Z) <br />
 `get_logZ_v3Mar` is Method 4 for obtaining log(Z) <br />

 `dcomp.fast` is Method a) for obtaining pmf <br />
 `dcomp.fast2` is Method b) for obtaining pmf <br />
 `dcomp.fast4` is Method c) for obtaining pmf <br />
 `dcomp.fast5` is Method d) for obtaining pmf <br />

# CD4_and_Warpbreaks.R Description:
R file to show underdispersion and overdispersion case for Chapter 1

# interp_extrap_justification.R Description:
R file to show tables / plots created for Chapter 2

# Time_comparison.R Description:
R file to create plots for Chapter 3 and Chapter 4 of the original thesis PDF

# Accuracy_comparison.R Description:
R file to create tables for Chapter 3 (also shown in Appendix) of the original thesis PDF

# Bayesian MH-MCMC Application.R Description:
R file to simulate Bayesian framework MH-MCMC for Chapter 4 of the original thesis PDF
