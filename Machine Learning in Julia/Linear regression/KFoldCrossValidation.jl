# LINEAR REGGRESION BY APPLAYING KFOLD CROSS VALIDATION

using StatsModels;
using GLM;
using DataFrames;
using CSV;
using Statistics;
using MLBase;

# EXAMPLES :

# example 1:
println("Linear Regression by applying KFold cross validation to data - 'data10.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data10.csv")); # loading data  učitavanje podataka (adatok beolvasása)
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása)

# adjusting KFold cross validation  podešavanje KFold kros validacije (a KFold keresztellenőrzés beállítása):
k = 5;
a = collect(Kfold(length(data.x), k));
averageAbsMeanErrorTest = 0.0;

# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
for i in 1:k
    # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre):
    dataTrain = data[a[i], :];  # train set  podaci za obuku (képzési készlet)
    dataTest = data[setdiff(1:end, a[i]), :]; # test set  podaci za testiranja (tesztelési készlet)

    linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)
    dataPredictedTest = predict(linearRegressor, dataTest); # data prediction  predikcija podataka (adat előrejelzés)

    # 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
    # counting errors for a test set  računanje grešaka za skup za testiranje (tesztkészlet hibáinak kiszámítása):
    errorsTest = dataTest.y-dataPredictedTest;

    # computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
    absMeanErrorTest = mean(abs.(errorsTest));

    # counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
    println("The average absolute error for the test $i is: $absMeanErrorTest");
    global averageAbsMeanErrorTest += absMeanErrorTest;
end

averageAbsMeanErrorTest /= k;
println();
println("The average total error for all tests is: $averageAbsMeanErrorTest");
println();println();


# example 2:
println("Linear Regression by applying KFold cross validation to data - 'data40C.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data40C.csv")); # loading data  učitavanje podataka (adatok beolvasása)
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása)

# adjusting KFold cross validation  podešavanje KFold kros validacije (a KFold keresztellenőrzés beállítása):
k = 7;
a = collect(Kfold(length(data.x), k));
averageAbsMeanErrorTest = 0.0;

# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
for i in 1:k
    # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre):
    dataTrain = data[a[i], :];  # train set  podaci za obuku (képzési készlet)
    dataTest = data[setdiff(1:end, a[i]), :]; # test set  podaci za testiranja (tesztelési készlet)

    linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)
    dataPredictedTest = predict(linearRegressor, dataTest); # data prediction  predikcija podataka (adat előrejelzés)

    # 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
    # counting errors for a test set  računanje grešaka za skup za testiranje (tesztkészlet hibáinak kiszámítása):
    errorsTest = dataTest.y-dataPredictedTest;

    # computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
    absMeanErrorTest = mean(abs.(errorsTest));

    # counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
    println("The average absolute error for the test $i is: $absMeanErrorTest");
    global averageAbsMeanErrorTest += absMeanErrorTest;
end

averageAbsMeanErrorTest /= k;
println();
println("The average total error for all tests is: $averageAbsMeanErrorTest");
println();println();


# example 3:
println("Linear Regression by applying KFold cross validation to data - 'data40E.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data40E.csv")); # loading data  učitavanje podataka (adatok beolvasása)
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása)

# adjusting KFold cross validation  podešavanje KFold kros validacije (a KFold keresztellenőrzés beállítása):
k = 4;
a = collect(Kfold(length(data.x), k));
averageAbsMeanErrorTest = 0.0;

# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
for i in 1:k
    # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre):
    dataTrain = data[a[i], :];  # train set  podaci za obuku (képzési készlet)
    dataTest = data[setdiff(1:end, a[i]), :]; # test set  podaci za testiranja (tesztelési készlet)

    linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)
    dataPredictedTest = predict(linearRegressor, dataTest); # data prediction  predikcija podataka (adat előrejelzés)

    # 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
    # counting errors for a test set  računanje grešaka za skup za testiranje (tesztkészlet hibáinak kiszámítása):
    errorsTest = dataTest.y-dataPredictedTest;

    # computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
    absMeanErrorTest = mean(abs.(errorsTest));

    # counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
    println("The average absolute error for the test $i is: $absMeanErrorTest");
    global averageAbsMeanErrorTest += absMeanErrorTest;
end

averageAbsMeanErrorTest /= k;
println();
println("The average total error for all tests is: $averageAbsMeanErrorTest");
println();println();


# example 4:
println("Linear Regression by applying KFold cross validation to data - 'data.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data.csv")); # loading data  učitavanje podataka (adatok beolvasása)
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása)

# adjusting KFold cross validation  podešavanje KFold kros validacije (a KFold keresztellenőrzés beállítása):
k = 8;
a = collect(Kfold(length(data.x), k));
averageAbsMeanErrorTest = 0.0;

# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
for i in 1:k
    # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre):
    dataTrain = data[a[i], :];  # train set  podaci za obuku (képzési készlet)
    dataTest = data[setdiff(1:end, a[i]), :]; # test set  podaci za testiranja (tesztelési készlet)

    linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)
    dataPredictedTest = predict(linearRegressor, dataTest); # data prediction  predikcija podataka (adat előrejelzés)

    # 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
    # counting errors for a test set  računanje grešaka za skup za testiranje (tesztkészlet hibáinak kiszámítása):
    errorsTest = dataTest.y-dataPredictedTest;

    # computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
    absMeanErrorTest = mean(abs.(errorsTest));

    # counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
    println("The average absolute error for the test $i is: $absMeanErrorTest");
    global averageAbsMeanErrorTest += absMeanErrorTest;
end

averageAbsMeanErrorTest /= k;
println();
println("The average total error for all tests is: $averageAbsMeanErrorTest");
println();println();