# Drzewa decyzyjne
install.packages("party")
library("party")
# okreslamy kryteria budowy drzewa klasyfikayjnego
ustawienia <- ctree_control(mincriterion = 0.5, testtype = "Teststatistic")
zbior.testowy$isAlive <- as.factor(zbior.testowy$isAlive)
zbior.treningowy$isAlive <- as.factor(zbior.treningowy$isAlive)
# uczymy drzewo
drzewo <- ctree(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data=zbior.treningowy, controls = ustawienia)
# narysujmy jetesttype
#plot(drzewo) - za duże
# w standardowy sposób przeprowadzamy klasyfikacje
oceny = predict(drzewo, zbior.testowy)
table(predykcja = oceny, prawdziwe = zbior.testowy$isAlive)
#do narysowania
drzewoMini <- ctree(isAlive~Gender+isMarried+popularity, data=zbior.treningowy, controls = ustawienia)
plot(drzewoMini)
oceny = predict(drzewoMini, zbior.walidacyjny)
table(predykcja = oceny, prawdziwe = zbior.walidacyjny$isAlive)

#inne ustawienia
#MC
ustawienia <- ctree_control(mincriterion = 0.90, testtype = "MonteCarlo", minbucket = 15)
drzewo <- ctree(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data=zbior.treningowy, controls = ustawienia)
oceny = predict(drzewo, zbior.testowy)
table(predykcja = oceny, prawdziwe = zbior.testowy$isAlive)
#B
ustawienia <- ctree_control(mincriterion = 0.90, testtype = "Bonferroni", minbucket = 15)
drzewo <- ctree(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data=zbior.treningowy, controls = ustawienia)
oceny = predict(drzewo, zbior.testowy)
table(predykcja = oceny, prawdziwe = zbior.testowy$isAlive)
#U
ustawienia <- ctree_control(mincriterion = 0.90, testtype = "Univariate", minbucket = 15)
drzewo <- ctree(isAlive~AllegiancesHouse+Gender+Nobility+Title+culture+isMarried+numDeadRelations+popularity, data=zbior.treningowy, controls = ustawienia)
oceny = predict(drzewo, zbior.testowy)
table(predykcja = oceny, prawdziwe = zbior.testowy$isAlive)
#TestStat
ustawienia <- ctree_control(mincriterion = 0.9, testtype = "Teststatistic")