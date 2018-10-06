#lasy losowe

install.packages("randomForest")
library("randomForest")

# ustawiamy ziarno generatora, by mozna było odtworzyc te wyniki
set.seed(1)
#standardowe uczenie modelu:
modelRandomForest <- randomForest(isAlive~AllegiancesHouse+Gender+Nobility+numDeadRelations+popularity,
                                  data =zbior.treningowy, importance=TRUE, proximity=TRUE)

print(modelRandomForest)

oceny = predict(modelRandomForest, zbior.testowy)
table(predykcja = oceny, prawdziwe = zbior.testowy$isAlive)