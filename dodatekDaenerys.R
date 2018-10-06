#KNN 
predict(klasyfikatorKNN1, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN2, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN3, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN4, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN5, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN10, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN15, zbior[which(zbior$Name == "Daenerys Targaryen"),])

predict(klasyfikatorKNN20, zbior[which(zbior$Name == "Daenerys Targaryen"),])

#Naiwny Bayes
predict(naiwnyBayes1, zbior[which(zbior$Name == "Daenerys Targaryen"),]) #0


#drzewa decyzyjne
predict(drzewo, zbior[which(zbior$Name == "Daenerys Targaryen"),]) #1
predict(drzewoMini, zbior[which(zbior$Name == "Daenerys Targaryen"),]) #1

#las losowy
predict(modelRandomForest, zbior[which(zbior$Name == "Daenerys Targaryen"),]) #1