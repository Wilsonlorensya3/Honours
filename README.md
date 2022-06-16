# Honours
Coding used for Honours project
All code is written in R 


.Rdata description:

Note:
save the grid and functions with name convention: Grid_and_Functions.RData

Grids:
pre computed mu grid and nu grid are given in variable
`mu.grid` and `nu.grid` give the combinations of mu and nu to be calculated for parameter of interest

calculated parameter of interest on the above mu and nu grid:
`logZ` to obtain log of normalization constant Z
`lambda` to obtain parameter lambda
`logLambda` to obtain log of parameter lambda
`compvar` to obtain ....
`compvarlogfactorialy` to obtain ...
`compmeanlogfactorialy` to obtain ...
`compmeanylogfactorialy` to obtain

Functions and Variable definitions:
 `exact` is for doing obtaining logLambda from the original `mpcmp` package
 `interp` is for doing interpolation for logLambda
 `extrap.mu` is for doing extrapolating mu, but interpolating nu for logLambda
 `extrap.nu` is for doing extrapolating nu, but interpolating mu for logLambda
 `extrap.both` is for doing extrapolating both mu and nu for logLambda
 `interp_extrap` is for doing either interpolation or extrapolation for both mu and/or nu depending on its values and position in the grid for logLambda

 `exact2` is for doing obtaining logZ from the original `mpcmp` package using mu as input
 `exact3` is for doing obtaining logZ from the original `mpcmp` package using logLambda as input
 `interp2` is for doing interpolation for logZ
 `extrap.mu2` is for doing extrapolating mu, but interpolating nu for logZ
 `extrap.nu2` is for doing extrapolating nu, but interpolating mu for logZ
 `extrap.both2` is for doing extrapolating both mu and nu for logZ
 `interp_extrap2` is for doing either interpolation or extrapolation for both mu and/or nu depending on its values and position in the grid for logZ


 `get_logLambda_v23Feb` is Method 1 for obtaining log lambda
 `get_logZ_v23Feb` is Method 1 for obtaining log Z
 `vec_get_logLambda` is Method 2 for obtaining log lambda # DOUBLE CHECK
 `vec_get_logZ` is Method 2 for obtaining log Z # DOUBLE CHECK
 `get_logLambda_v4Mar` is Method 3 for obtaining log lambda
 `get_logZ_v4Mar` is Method 3 for obtaining log Z
 `get_logLambda_v3Mar` is Method 4 for obtaining log lambda
 `get_logZ_v3Mar` is Method 4 for obtaining log Z # DOUBLE CHECK



 `dcomp.fast` is Method a) for obtaining pmf
 `dcomp.fast2` is Method b) for obtaining pmf
 `dcomp.fast4` is Method c) for obtaining pmf
 `dcomp.fast5` is Method d) for obtaining pmf
