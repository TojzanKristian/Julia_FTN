# LOGISTIC REGRESSION -> patients1000A - patients1000C

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
println("Logistic Regression with data from 'patients1000A.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\patients1000A.csv")); # loading data  učitavanje podataka (adatok beolvasása)
      
dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data,.80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(disease ~ height + weight + dbp + sbp); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Binomial(), ProbitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1;
    end
end


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (Osztályozási minőségértékelés) :
# predicted data on how many people with diabetes are affected  predviđeni podaci o tome koliko ima obolelih od dijabetesa (előrejelzett adatok arról, hogy hány cukorbeteg embert van):
NumberOfPatientsFromDiabetesPredict = sum(dataPredictedTestClass);

# predicted data on how many healthy patients there are  predviđeni podaci o tome koliko ima zdravih pacijenata (előrejelzett adatok arról, hogy hány egészséges beteg van):
numberOfHealthyPredict = length(dataPredictedTestClass) - NumberOfPatientsFromDiabetesPredict;

# the data we have in the file on how many people have diabetes  podaci koje imamo u fajlu o tome koliko ima obolelih od dijabetesa (a fájlban szereplő adatok arról, hogy hány ember cukorbeteg):
NumberOfPatientsFromDiabetes = sum(dataTest.disease);

# The data we have in the file on how many healthy patients there are  podaci koje imamo u fajlu o tome koliko ima zdravih pacijenata (a fájlban szereplő adatok arról, hogy hány egészséges beteg van):
numberHealthy = length(dataTest.disease) - NumberOfPatientsFromDiabetes;

# print data  ispis podataka (adatok kiírása):
println("The predicted number of people having diabetes is: $NumberOfPatientsFromDiabetesPredict");
println("The number of people with diabetes is: $NumberOfPatientsFromDiabetes");
println("Predicted number of healthy patients: $numberOfHealthyPredict");
println("Number of healthy patients: $numberHealthy");
println();println();


# example 2:
println("Logistic Regression with data from 'patients1000B.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\patients1000B.csv")); # loading data  učitavanje podataka (adatok beolvasása)
      
dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data,.80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(disease ~ height + weight + dbp + sbp); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Binomial(), ProbitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1;
    end
end


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (Osztályozási minőségértékelés) :
# predicted data on how many people with diabetes are affected  predviđeni podaci o tome koliko ima obolelih od dijabetesa (előrejelzett adatok arról, hogy hány cukorbeteg embert van):
NumberOfPatientsFromDiabetesPredict = sum(dataPredictedTestClass);

# predicted data on how many healthy patients there are  predviđeni podaci o tome koliko ima zdravih pacijenata (előrejelzett adatok arról, hogy hány egészséges beteg van):
numberOfHealthyPredict = length(dataPredictedTestClass) - NumberOfPatientsFromDiabetesPredict;

# the data we have in the file on how many people have diabetes  podaci koje imamo u fajlu o tome koliko ima obolelih od dijabetesa (a fájlban szereplő adatok arról, hogy hány ember cukorbeteg):
NumberOfPatientsFromDiabetes = sum(dataTest.disease);

# The data we have in the file on how many healthy patients there are  podaci koje imamo u fajlu o tome koliko ima zdravih pacijenata (a fájlban szereplő adatok arról, hogy hány egészséges beteg van):
numberHealthy = length(dataTest.disease) - NumberOfPatientsFromDiabetes;

# print data  ispis podataka (adatok kiírása):
println("The predicted number of people having diabetes is: $NumberOfPatientsFromDiabetesPredict");
println("The number of people with diabetes is: $NumberOfPatientsFromDiabetes");
println("Predicted number of healthy patients: $numberOfHealthyPredict");
println("Number of healthy patients: $numberHealthy");
println();println();


# example 3:
println("Logistic Regression with data from 'patients1000C.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Logistic regression\\Data\\patients1000C.csv")); # loading data  učitavanje podataka (adatok beolvasása)
      
dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data,.80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)


# 2. Step : logistic regression  logistička regresija (logisztikai regresszió) :
fm = @formula(disease ~ height + weight + dbp + sbp); # definition of the formula   definicija formule (a képlet meghatározása) 
logisticRegressor = glm(fm, dataTrain, Binomial(), ProbitLink()); # call of logistic regression  poziv logističke regresije (logisztikai regresszió alklamazása)

# predicting data for the test set  predviđanje podataka za test skup (a tesztkészlet adatainak előrejelzése):
dataPredictedTest = predict(logisticRegressor, dataTest);

# computation confusion matrix  računanje confusion matrix (confusion mátrix meghatározása):
dataPredictedTestClass = repeat(0:0, length(dataPredictedTest))

for i in 1:length(dataPredictedTest)
    if (dataPredictedTest[i] > 0.5)
        dataPredictedTestClass[i] = 1;
    end
end


# 3. Step : classification quality assessment  ocena kvaliteta klasifikacije (Osztályozási minőségértékelés) :
# predicted data on how many people with diabetes are affected  predviđeni podaci o tome koliko ima obolelih od dijabetesa (előrejelzett adatok arról, hogy hány cukorbeteg embert van):
NumberOfPatientsFromDiabetesPredict = sum(dataPredictedTestClass);

# predicted data on how many healthy patients there are  predviđeni podaci o tome koliko ima zdravih pacijenata (előrejelzett adatok arról, hogy hány egészséges beteg van):
numberOfHealthyPredict = length(dataPredictedTestClass) - NumberOfPatientsFromDiabetesPredict;

# the data we have in the file on how many people have diabetes  podaci koje imamo u fajlu o tome koliko ima obolelih od dijabetesa (a fájlban szereplő adatok arról, hogy hány ember cukorbeteg):
NumberOfPatientsFromDiabetes = sum(dataTest.disease);

# The data we have in the file on how many healthy patients there are  podaci koje imamo u fajlu o tome koliko ima zdravih pacijenata (a fájlban szereplő adatok arról, hogy hány egészséges beteg van):
numberHealthy = length(dataTest.disease) - NumberOfPatientsFromDiabetes;

# print data  ispis podataka (adatok kiírása):
println("The predicted number of people having diabetes is: $NumberOfPatientsFromDiabetesPredict");
println("The number of people with diabetes is: $NumberOfPatientsFromDiabetes");
println("Predicted number of healthy patients: $numberOfHealthyPredict");
println("Number of healthy patients: $numberHealthy");println();