mat <- read.csv(file="I:/New Project/Stocks/short file.csv",head=TRUE,sep=",")

 # library(tseries)

p1 = mat[,1]
p2 = mat[,2]
p3 = mat[,3]
p4 = mat[,4]
p5 = mat[,5]
p6 = mat[,6]
p7 = mat[,7]
p8 = mat[,8]
p9 = mat[,9]
p10 = mat[,10]
p11 = mat[,11]
p12 = mat[,12]
p13 = mat[,13]
p14 = mat[,14]
p15 = mat[,15]
p16 = mat[,16]
p17 = mat[,17]
p18 = mat[,18]


print("1")
p = cbind(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,
p11,p12,p13,p14,p15,p16,p17,p18)
print("2")
y = p
y[,1] = y[,1]-mean(y[,1])
y[,2] = y[,2]-mean(y[,2])
y[,3] = y[,3]-mean(y[,3])
y[,4] = y[,4]-mean(y[,4])
y[,5] = y[,5]-mean(y[,5])
y[,6] = y[,6]-mean(y[,6])
y[,7] = y[,7]-mean(y[,7])
y[,8] = y[,8]-mean(y[,8])
y[,9] = y[,9]-mean(y[,9])
y[,10] = y[,10]-mean(y[,10])
y[,11] = y[,11]-mean(y[,11])
y[,12] = y[,12]-mean(y[,12])
y[,13] = y[,13]-mean(y[,13])
y[,14] = y[,14]-mean(y[,14])
y[,15] = y[,15]-mean(y[,15])
y[,16] = y[,16]-mean(y[,16])
y[,17] = y[,17]-mean(y[,17])
y[,18] = y[,18]-mean(y[,18])


print("3")


T = length(y[,1])
print("4")
library(ccgarch)
library(fGarch)

f1 = garchFit(~ garch(1,1), data=y[,1],include.mean=FALSE)
f1 = f1@fit$coef
f2 = garchFit(~ garch(1,1), data=y[,2],include.mean=FALSE)
f2 = f2@fit$coef
f3 = garchFit(~ garch(1,1), data=y[,3],include.mean=FALSE)
f3 = f3@fit$coef
f4 = garchFit(~ garch(1,1), data=y[,4],include.mean=FALSE)
f4 = f4@fit$coef
f5 = garchFit(~ garch(1,1), data=y[,5],include.mean=FALSE)
f5 = f5@fit$coef
f6 = garchFit(~ garch(1,1), data=y[,6],include.mean=FALSE)
f6 = f6@fit$coef
f7 = garchFit(~ garch(1,1), data=y[,7],include.mean=FALSE)
f7 = f7@fit$coef
f8 = garchFit(~ garch(1,1), data=y[,8],include.mean=FALSE)
f8 = f8@fit$coef
f9 = garchFit(~ garch(1,1), data=y[,9],include.mean=FALSE)
f9 = f9@fit$coef
f10 = garchFit(~ garch(1,1), data=y[,10],include.mean=FALSE)
f10 = f10@fit$coef
f11 = garchFit(~ garch(1,1), data=y[,11],include.mean=FALSE)
f11 = f11@fit$coef
f12 = garchFit(~ garch(1,1), data=y[,12],include.mean=FALSE)
f12 = f12@fit$coef
f13 = garchFit(~ garch(1,1), data=y[,13],include.mean=FALSE)
f13 = f13@fit$coef
f14 = garchFit(~ garch(1,1), data=y[,14],include.mean=FALSE)
f14 = f14@fit$coef
f15 = garchFit(~ garch(1,1), data=y[,15],include.mean=FALSE)
f15 = f15@fit$coef
f16 = garchFit(~ garch(1,1), data=y[,16],include.mean=FALSE)
f16 = f16@fit$coef
f17 = garchFit(~ garch(1,1), data=y[,17],include.mean=FALSE)
f17 = f17@fit$coef
f18 = garchFit(~ garch(1,1), data=y[,18],include.mean=FALSE)
f18 = f18@fit$coef

print("5")

a = c(f1[1],f2[1],f3[1],f4[1],f5[1],f6[1],
      f7[1],f8[1],f9[1],f10[1],f11[1],f12[1],
	f13[1],f14[1],f15[1],f16[1],f17[1],f18[1])
A = diag(c(f1[1],f2[1],f3[1],f4[1],f5[1],f6[1],
      f7[1],f8[1],f9[1],f10[1],f11[1],f12[1],
	f13[1],f14[1],f15[1],f16[1],f17[1],f18[1]))
B = diag(c(f1[1],f2[1],f3[1],f4[1],f5[1],f6[1],
      f7[1],f8[1],f9[1],f10[1],f11[1],f12[1],
	f13[1],f14[1],f15[1],f16[1],f17[1],f18[1]))
print("6")
dccpara = c(0.1,0.8)
dccresults = dcc.estimation(inia=a, iniA=A, iniB=B, ini.dcc=dccpara,dvar=y,
model="diagonal")

dccresults$out
A=dccresults$DCC
B=dccresults$h
write.table(A,file="I:/New Project/Stocks/dcc_stocks_shortfilefinal.csv",sep = ",",col.names = NA,qmethod = "double")
write.table(B,file="I:/New Project/Stocks/varianceshortfilefinal.csv",sep = ",",col.names = NA,qmethod = "double")



