library(cpm)
#generate a sequence containing a single change point
x <- c(rnorm(100,0,1),rnorm(100,1,1))
#use a Student CPM
cpm <- makeChangePointModel(cpmType="Student", ARL0=500)
for (i in 1:length(x)) {
#process each observation in turn
cpm <- processObservation(cpm,x[i])cpmReset 5
if (changeDetected(cpm)) {
print(sprintf("change detected at observation %s",i))
break
}
}