library(rmgarch)
data(dji30ret)
Data <- dji30ret[, 1:3, drop = FALSE]
uspec <- ugarchspec(mean.model = list(armaOrder = c(0,0), include.mean = FALSE), variance.model = list(garchOrder = c(1,1), model = "sGARCH"), distribution.model = "std")
cspec <- cgarchspec(uspec = multispec( replicate(3, uspec) ), VAR = FALSE, robust = FALSE, lag = 1, lag.max = NULL,                  lag.criterion = c("AIC", "HQ", "SC", "FPE"), external.regressors = NULL, robust.control = list(gamma = 0.25, delta = 0.01, nc = 10, ns = 500), dccOrder = c(1, 1), asymmetric = FALSE, distribution.model = list(copula =  "mvt", method = "ML", time.varying = TRUE, transformation = "parametric"), start.pars = list(), fixed.pars = list())
cfit <- cgarchfit(cspec, data =Data, spd.control = list(lower = 0.1, upper = 0.9, type = "pwm", kernel = "epanech"),fit.control = list(eval.se = TRUE, trace = TRUE, stationarity = TRUE),solver = "solnp", solver.control = list(), out.sample = 0, parallel = FALSE, parallel.control = list(pkg = c("multicore", "snowfall"), cores = 2), fit = NULL, VAR.fit = NULL) 