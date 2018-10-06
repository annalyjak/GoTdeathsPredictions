#wskazniki

TP = 664
FP = 165

FN = 8
TN = 13

Acc <- (TP+TN)/(TP+TN+FP+FN)
Acc
TPrate <- TP/(TP+FN)
TPrate
TNrate <- TN/(TN+FP)
TNrate
FPrate <-FP/(FP+TN)
FPrate
FNrate <- FN/(FN+TP)
FNrate
GMean <- sqrt(TPrate*TNrate)
GMean
AUC <- (TPrate+TNrate)/2
AUC