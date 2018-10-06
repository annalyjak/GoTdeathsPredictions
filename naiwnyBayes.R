# NAIVE BAYES 
install.packages("klaR")
library("klaR")

naiwnyBayes1 <- NaiveBayes(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data=zbior.treningowy)

oceny <- predict(naiwnyBayes1, zbior.testowy)$class
table(predykcja = oceny, prawdziwe = zbior.testowy$isAlive)