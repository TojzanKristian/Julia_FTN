# LOGISTIC REGRESSION -> data100 - data1000C

using StatsModels;
using GLM;
using DataFrames;
using CSV;
using Lathe;
using Plots;
using Statistics;
using StatsBase;
using MLBase;
using ROC;

# EXAMPLES :

# example 1:
println("Logistic Regression with data from 'data100.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\data100.csv")); # loading data  učitavanje podataka (adatok beolvasása)

dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# drawing graphics  crtanje grafika (grafikon kirajzolása):
plot(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
scatter!(myInputPlot, dataTest.x, dataTest.y)=#


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(color ~ x + y); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Bernoulli(), LogitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# print predicted data  ispis predviđenih podataka (előrejelzett adatok kiírása):
println("Predicted data: $(round.(dataPredictedTest; digits = 2))");


# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = zeros(Int64,length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1
    elseif (dataPredictedTest[i] < 0.5)
        dataPredictedTestClass[i] = 0
    end
end

# print matrix  ispis matrice (mátrix kiírása):
println("Predicted colors: $dataPredictedTestClass)");

# print colors from a file  ispis boja iz datoteke (színek kiírása a fájlból):
println("Clors: $(dataTest.color))");

FPTest = 0; # false positives
FNTest = 0; # false negatives
TPTest = 0; # true positives
TNTest = 0; # true negatives

for i in 1:length(dataPredictedTestClass)
    if dataTest.color[i] == 0 && dataPredictedTestClass[i] == 0
        global TNTest += 1;
    elseif dataTest.color[i] == 0 && dataPredictedTestClass[i] == 1
        global FPTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 0
        global FNTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 1
        global TPTest += 1;
    end
end

# instead of the upper loop can be used and  umesto gornje petlje može se koristiti i (a felső for ciklus helyett használható ez is):
# confusion_matrix = MLBase.roc(dataTest.boja, dataPredictedTestClass);


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (osztályozási minőségértékelés) :
# accuracy  preciznost (precizitás) = (TP+TN)/(TP+TN+FP+FN) = (TP+TN)/(P+N)
accuracyTest = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest);

# sensitivity  osetljivost (érzékenység) = TP/(TP+FN) = TP/P
sensitivityTest = TPTest / (TPTest + FNTest);

# specificity  specifičnost (sajátlagosság) = TN/(TN+FP) = TN/N
specificityTest = TNTest / (TNTest + FPTest);

# print quality  ispis kvaliteta (minőség kiírása):
println("TP = $TPTest, FP = $FPTest, TN =$TNTest, FN = $FNTest");
println("Accuracy za test skup je $accuracyTest");
println("Sensitivity za test skup je $sensitivityTest");
println("Specificity za test skup je $specificityTest");


# drawing ROC curves  crtanje ROC krive (ROC görbe rajzolása):
rocTest = ROC.roc(dataPredictedTest, dataTest.color, true);

#  it is an objective measure of the quality of the classifier  predstavlja objektivnu meru kvaliteta klasifikatora (az osztályozó minőségének objektív mércéje):
aucTest = AUC(rocTest);
println("The area below the curve is percentage: $aucTest");println();

if (aucTest > 0.9)
    println("The classifier is very very good!");
elseif (aucTest > 0.8)
    println("The classifier is very good!");
elseif (aucTest > 0.7)
    println("The classifier is good!");
elseif (aucTest > 0.5)
    println("The classifier is relatively good!");
else
    println("Classifier is bad!");
end

plot(rocTest, label = "ROC curve")
println();println();


# example 2:
println("Logistic Regression with data from 'data1000A.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\data1000A.csv")); # loading data  učitavanje podataka (adatok beolvasása)

dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# drawing graphics  crtanje grafika (grafikon kirajzolása):
plot(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
scatter!(myInputPlot, dataTest.x, dataTest.y)=#


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(color ~ x + y); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Bernoulli(), LogitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# print predicted data  ispis predviđenih podataka (előrejelzett adatok kiírása):
println("Predicted data: $(round.(dataPredictedTest; digits = 2))");


# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = zeros(Int64,length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1
    elseif (dataPredictedTest[i] < 0.5)
        dataPredictedTestClass[i] = 0
    end
end

# print matrix  ispis matrice (mátrix kiírása):
println("Predicted colors: $dataPredictedTestClass)");

# print colors from a file  ispis boja iz datoteke (színek kiírása a fájlból):
println("Clors: $(dataTest.color))");

FPTest = 0; # false positives
FNTest = 0; # false negatives
TPTest = 0; # true positives
TNTest = 0; # true negatives

for i in 1:length(dataPredictedTestClass)
    if dataTest.color[i] == 0 && dataPredictedTestClass[i] == 0
        global TNTest += 1;
    elseif dataTest.color[i] == 0 && dataPredictedTestClass[i] == 1
        global FPTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 0
        global FNTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 1
        global TPTest += 1;
    end
end

# instead of the upper loop can be used and  umesto gornje petlje može se koristiti i (a felső for ciklus helyett használható ez is):
# confusion_matrix = MLBase.roc(dataTest.boja, dataPredictedTestClass);


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (osztályozási minőségértékelés) :
# accuracy  preciznost (precizitás) = (TP+TN)/(TP+TN+FP+FN) = (TP+TN)/(P+N)
accuracyTest = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest);

# sensitivity  osetljivost (érzékenység) = TP/(TP+FN) = TP/P
sensitivityTest = TPTest / (TPTest + FNTest);

# specificity  specifičnost (sajátlagosság) = TN/(TN+FP) = TN/N
specificityTest = TNTest / (TNTest + FPTest);

# print quality  ispis kvaliteta (minőség kiírása):
println("TP = $TPTest, FP = $FPTest, TN =$TNTest, FN = $FNTest");
println("Accuracy za test skup je $accuracyTest");
println("Sensitivity za test skup je $sensitivityTest");
println("Specificity za test skup je $specificityTest");


# drawing ROC curves  crtanje ROC krive (ROC görbe rajzolása):
rocTest = ROC.roc(dataPredictedTest, dataTest.color, true);

#  it is an objective measure of the quality of the classifier  predstavlja objektivnu meru kvaliteta klasifikatora (az osztályozó minőségének objektív mércéje):
aucTest = AUC(rocTest);
println("The area below the curve is percentage: $aucTest");println();

if (aucTest > 0.9)
    println("The classifier is very very good!");
elseif (aucTest > 0.8)
    println("The classifier is very good!");
elseif (aucTest > 0.7)
    println("The classifier is good!");
elseif (aucTest > 0.5)
    println("The classifier is relatively good!");
else
    println("Classifier is bad!");
end

plot(rocTest, label = "ROC curve")
println();println();


# example 3:
println("Logistic Regression with data from 'data1000B.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\data1000B.csv")); # loading data  učitavanje podataka (adatok beolvasása)

dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# drawing graphics  crtanje grafika (grafikon kirajzolása):
plot(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
scatter!(myInputPlot, dataTest.x, dataTest.y)=#


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(color ~ x + y); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Bernoulli(), LogitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# print predicted data  ispis predviđenih podataka (előrejelzett adatok kiírása):
println("Predicted data: $(round.(dataPredictedTest; digits = 2))");


# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = zeros(Int64,length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1
    elseif (dataPredictedTest[i] < 0.5)
        dataPredictedTestClass[i] = 0
    end
end

# print matrix  ispis matrice (mátrix kiírása):
println("Predicted colors: $dataPredictedTestClass)");

# print colors from a file  ispis boja iz datoteke (színek kiírása a fájlból):
println("Clors: $(dataTest.color))");

FPTest = 0; # false positives
FNTest = 0; # false negatives
TPTest = 0; # true positives
TNTest = 0; # true negatives

for i in 1:length(dataPredictedTestClass)
    if dataTest.color[i] == 0 && dataPredictedTestClass[i] == 0
        global TNTest += 1;
    elseif dataTest.color[i] == 0 && dataPredictedTestClass[i] == 1
        global FPTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 0
        global FNTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 1
        global TPTest += 1;
    end
end

# instead of the upper loop can be used and  umesto gornje petlje može se koristiti i (a felső for ciklus helyett használható ez is):
# confusion_matrix = MLBase.roc(dataTest.boja, dataPredictedTestClass);


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (osztályozási minőségértékelés) :
# accuracy  preciznost (precizitás) = (TP+TN)/(TP+TN+FP+FN) = (TP+TN)/(P+N)
accuracyTest = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest);

# sensitivity  osetljivost (érzékenység) = TP/(TP+FN) = TP/P
sensitivityTest = TPTest / (TPTest + FNTest);

# specificity  specifičnost (sajátlagosság) = TN/(TN+FP) = TN/N
specificityTest = TNTest / (TNTest + FPTest);

# print quality  ispis kvaliteta (minőség kiírása):
println("TP = $TPTest, FP = $FPTest, TN =$TNTest, FN = $FNTest");
println("Accuracy za test skup je $accuracyTest");
println("Sensitivity za test skup je $sensitivityTest");
println("Specificity za test skup je $specificityTest");


# drawing ROC curves  crtanje ROC krive (ROC görbe rajzolása):
rocTest = ROC.roc(dataPredictedTest, dataTest.color, true);

#  it is an objective measure of the quality of the classifier  predstavlja objektivnu meru kvaliteta klasifikatora (az osztályozó minőségének objektív mércéje):
aucTest = AUC(rocTest);
println("The area below the curve is percentage: $aucTest");println();

if (aucTest > 0.9)
    println("The classifier is very very good!");
elseif (aucTest > 0.8)
    println("The classifier is very good!");
elseif (aucTest > 0.7)
    println("The classifier is good!");
elseif (aucTest > 0.5)
    println("The classifier is relatively good!");
else
    println("Classifier is bad!");
end

plot(rocTest, label = "ROC curve")
println();println();


# example 4:
println("Logistic Regression with data from 'data1000C.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\data1000C.csv")); # loading data  učitavanje podataka (adatok beolvasása)

dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# drawing graphics  crtanje grafika (grafikon kirajzolása):
plot(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x,dataTrain.y, title = "Data, before Logistic Regressor", ylabel = "Y values", xlabel = "X value")
scatter!(myInputPlot, dataTest.x, dataTest.y)=#


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(color ~ x + y); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Bernoulli(), LogitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# print predicted data  ispis predviđenih podataka (előrejelzett adatok kiírása):
println("Predicted data: $(round.(dataPredictedTest; digits = 2))");


# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = zeros(Int64,length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1
    elseif (dataPredictedTest[i] < 0.5)
        dataPredictedTestClass[i] = 0
    end
end

# print matrix  ispis matrice (mátrix kiírása):
println("Predicted colors: $dataPredictedTestClass)");

# print colors from a file  ispis boja iz datoteke (színek kiírása a fájlból):
println("Clors: $(dataTest.color))");

FPTest = 0; # false positives
FNTest = 0; # false negatives
TPTest = 0; # true positives
TNTest = 0; # true negatives

for i in 1:length(dataPredictedTestClass)
    if dataTest.color[i] == 0 && dataPredictedTestClass[i] == 0
        global TNTest += 1;
    elseif dataTest.color[i] == 0 && dataPredictedTestClass[i] == 1
        global FPTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 0
        global FNTest += 1;
    elseif dataTest.color[i] == 1 && dataPredictedTestClass[i] == 1
        global TPTest += 1;
    end
end

# instead of the upper loop can be used and  umesto gornje petlje može se koristiti i (a felső for ciklus helyett használható ez is):
# confusion_matrix = MLBase.roc(dataTest.boja, dataPredictedTestClass);


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (osztályozási minőségértékelés) :
# accuracy  preciznost (precizitás) = (TP+TN)/(TP+TN+FP+FN) = (TP+TN)/(P+N)
accuracyTest = (TPTest + TNTest) / (TPTest + TNTest + FPTest + FNTest);

# sensitivity  osetljivost (érzékenység) = TP/(TP+FN) = TP/P
sensitivityTest = TPTest / (TPTest + FNTest);

# specificity  specifičnost (sajátlagosság) = TN/(TN+FP) = TN/N
specificityTest = TNTest / (TNTest + FPTest);

# print quality  ispis kvaliteta (minőség kiírása):
println("TP = $TPTest, FP = $FPTest, TN =$TNTest, FN = $FNTest");
println("Accuracy za test skup je $accuracyTest");
println("Sensitivity za test skup je $sensitivityTest");
println("Specificity za test skup je $specificityTest");


# drawing ROC curves  crtanje ROC krive (ROC görbe rajzolása):
rocTest = ROC.roc(dataPredictedTest, dataTest.color, true);

#  it is an objective measure of the quality of the classifier  predstavlja objektivnu meru kvaliteta klasifikatora (az osztályozó minőségének objektív mércéje):
aucTest = AUC(rocTest);
println("The area below the curve is percentage: $aucTest");println();

if (aucTest > 0.9)
    println("The classifier is very very good!");
elseif (aucTest > 0.8)
    println("The classifier is very good!");
elseif (aucTest > 0.7)
    println("The classifier is good!");
elseif (aucTest > 0.5)
    println("The classifier is relatively good!");
else
    println("Classifier is bad!");
end

plot(rocTest, label = "ROC curve")