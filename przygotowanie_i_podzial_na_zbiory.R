#wstepna analiza danych i przygotowanie danych do klasyfikacji
summary(battles)

names(character.predictions)

plot(sort(table(battles$attacker_1)), col = c(colors), xlab = "Attacker_1", ylab = "Liczba bitew")


plot(sort(table(character.deaths$Allegiances)), col = c(colors), xlab = "Allegiances", ylab = "Liczba śmierci", las = 2)

barplot(table(character.deaths$Gender), col = c(colors), main = "Stosunek liczby śmierci kobiet do liczby śmierci mężczyzn", legend.text = c("Kobiety", "Mężczyźni"))

plot(sort(table(character.predictions$culture)), col = c(colors), xlab = "Culture", ylab = "Liczba bohaterów")


plot(sort(which(table(character.predictions$culture) > 10)), col = c(colors), xlab = "Culture", ylab = "Liczba bohaterów", xaxt = "n")
axis(side = 1, at = 1:16, labels = names(sort(which(table(character.predictions$culture) > 10))))

plot(sort(table(character.predictions$house[index])), col = c(colors), xlab = "House", ylab = "Liczba śmierci", las = 2)

index <- which(character.predictions$house %in% levels(character.deaths$Allegiances))

#zmiany w strukturze danych:

character.deaths$Allegiances[which(character.deaths$Allegiances=='')] <- 'None'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Wildling')] <- 'Wildling'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Martell')] <- 'Martell'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Tyrell')] <- 'Tyrell'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Tully')] <- 'Tully'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Targaryen')] <- 'Targaryen'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Stark')] <- 'Stark'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Martell')] <- 'Martell'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Greyjoy')] <- 'Greyjoy'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Baratheon')] <- 'Baratheon'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Arryn')] <- 'Arryn'
character.deaths$Allegiances[which(character.deaths$Allegiances=='House Lannister')] <- 'Lannister'

character.predictions$house[which(character.predictions$house=='House Lannister')] <- 'Lannister'
character.predictions$house[which(character.predictions$house=='House Arryn')] <- 'Arryn'
character.predictions$house[which(character.predictions$house=='House Baratheon')] <- 'Baratheon'
character.predictions$house[which(character.predictions$house=='House Greyjoy')] <- 'Greyjoy'
character.predictions$house[which(character.predictions$house=='House Martell')] <- 'Martell'
character.predictions$house[which(character.predictions$house=='House Stark')] <- 'Stark'
character.predictions$house[which(character.predictions$house=='House Targaryen')] <- 'Targaryen'
character.predictions$house[which(character.predictions$house=='House Tully')] <- 'Tully'
character.predictions$house[which(character.predictions$house=='House Tyrell')] <- 'Tyrell'
character.predictions$house[which(character.predictions$house=='House Martell')] <- 'Martell'
character.predictions$house[which(character.predictions$house=='House Wildling')] <- 'Wildling'
character.predictions$house[which(character.predictions$house=='')] <- 'None'

houses <- c('Arryn', 'Lannister', 'Baratheon', 'Greyjoy', 'Martell', 'Stark', 'Targaryen', 'Tully', 'Tyrell', 'Martell', 'Wildling', 'None')

character.predictions$house[which(!(character.predictions$house %in% houses))] <- 'Different'

plot(sort(table(character.predictions$house)), col = c(colors), xlab = "House", ylab = "Liczba śmierci", las = 2)

#zbior ostateczny
zbior <- data.frame(Name = 'Abelar Hightower', AllegiancesHouse = 'Different', Gender = 1, Nobility = 1, 
                    isAlive = 0, Title = 'Ser', culture = 'None', 
                    isMarried = 0, numDeadRelations = 0, popularity = 0.000000000)
for(i in 1:length(character.predictions$name)) {
  # print(i)
  if(character.predictions$name[i] != 'Abelar Hightower'){
    z <- data.frame(Name = character.predictions$name[i], AllegiancesHouse = character.predictions$house[i], 
                    Gender = character.predictions$male[i], Nobility = character.predictions$isNoble[i], 
                    isAlive = character.predictions$isAlive[i], Title = character.predictions$title[i], 
                    culture = character.predictions$culture[i],
                    isMarried = character.predictions$isMarried[i], 
                    numDeadRelations = character.predictions$numDeadRelations[i], popularity = character.predictions$popularity[i])
    zbior <-rbind(zbior, z)
  }
}
for(i in 1:length(character.deaths)){
  if(!(character.deaths$Name[i] %in% character.predictions$name)) {
    z <- data.frame(Name = character.deaths$Name[i], AllegiancesHouse = character.deaths$Allegiances[i], 
                    Gender = character.deaths$Gender[i], Nobility = character.deaths$Nobility[i], 
                    isAlive = 0, Title = "", 
                    culture = "",  
                    #dateOfBirth = NA, 
                    #age = NA, 
                    isMarried = 0, 
                    numDeadRelations = 0, 
                    popularity = 0.000000000)
    zbior <-rbind(zbior, z)
    print(z)
  }
}

zbior$AllegiancesHouse <- as.factor(zbior$AllegiancesHouse)



margin.table(zbior,1)
barplot(table(zbior$Gender), col = c(colors), main = "Stosunek liczby kobiet do liczby mężczyzn", legend.text = c("Kobiety", "Mężczyźni"))

barplot(table(zbior$Nobility), col = c(colors), main = "Stosunek szlachty do pozostałych bohaterów", legend.text = c("Bohaterownie nie pochodzący ze szlachty", "Szlachta"))

plot(sort(table(zbior$culture)), col = c(colors), xlab = "Kultura bohaterów", ylab = "Liczba bohaterów pochodzących z tej samej kultury")

plot(x = houses, y = sum(which(zbior$AllegiancesHouse == x)))

temp <- data.frame(house=houses[1], numberOfMembers =length(which(zbior$AllegiancesHouse == houses[1])))
for(i in 2:length(houses)){
  z <- data.frame(house=houses[i], numberOfMembers =length(which(zbior$AllegiancesHouse == houses[i])))
  temp <-rbind(temp, z)
}
plot(zbior$AllegiancesHouse, xlab = "", ylab = "Number of members", col = c(colors), las = 2)

zbior$isAlive <- as.factor(zbior$isAlive)

# podział na zbiory:

zbior.t1 <- zbior[1,]
for(i in 2:550) {
  z <- zbior[i,]
  zbior.t1 <- rbind(zbior.t1, z)
}
zbior.testowy <- zbior[551,]
for(i in 552:1400) {
  z <- zbior[i,]
  zbior.testowy <- rbind(zbior.testowy, z)
}
zbior.t2 <- zbior[1401,]
for(i in 1402:1951) {
  z <- zbior[i,]
  zbior.t2 <- rbind(zbior.t2, z)
}
zbior.treningowy <- rbind(zbior.t1, zbior.t2)
