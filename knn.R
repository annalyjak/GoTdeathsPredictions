install.packages("ipred")
library("ipred")
#k=3
klasyfikatorKNN3 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=3)
oceny3 = predict(klasyfikatorKNN3, zbior.testowy, "class")
table(prawdziwe = zbior.testowy$isAlive, predykcja = oceny3)

#k=20
klasyfikatorKNN20 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=20)
oceny20 = predict(klasyfikatorKNN20, zbior.testowy, "class")
temp <- table(predykcja = oceny20, prawdziwe = zbior.testowy$isAlive)
#k=15
klasyfikatorKNN15 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=15)
oceny15 = predict(klasyfikatorKNN15, zbior.testowy, "class")
table(predykcja = oceny15, prawdziwe = zbior.testowy$isAlive)
#k=10
klasyfikatorKNN10 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=10)
oceny10 = predict(klasyfikatorKNN10, zbior.testowy, "class")
table(predykcja = oceny10, prawdziwe = zbior.testowy$isAlive)
#k=5
klasyfikatorKNN5 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=5)
oceny5 = predict(klasyfikatorKNN5, zbior.testowy, "class")
table(predykcja = oceny5, prawdziwe = zbior.testowy$isAlive)
#k=4
klasyfikatorKNN4 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=4)
oceny4 = predict(klasyfikatorKNN4, zbior.testowy, "class")
table(predykcja = oceny4, prawdziwe = zbior.testowy$isAlive)

#k=2
klasyfikatorKNN2 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=2)
oceny2 = predict(klasyfikatorKNN2, zbior.testowy, "class")
table(predykcja = oceny2, prawdziwe = zbior.testowy$isAlive)
#k=1
klasyfikatorKNN1 = ipredknn(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data =zbior.treningowy, k=1)
oceny1 = predict(klasyfikatorKNN1, zbior.testowy, "class")
table(predykcja = oceny1, prawdziwe = zbior.testowy$isAlive)

#errorest(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data = zbior.treningowy, model=ipredknn, k=3,
#         + estimator = "632plus", predict= function(ob, newdata) predict(
#           ob, newdata, "class"))

#skalowanie
zbior[,3:5] = scale(zbior[,3:5])
zbior[,8:12] = scale(zbior[,8:12])