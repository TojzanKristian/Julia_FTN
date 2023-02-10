# LINEAR REGRESSION

using StatsModels;
using GLM;
using DataFrames;
using CSV;
using Lathe.preprocess: TrainTestSplit;
using Plots;
using Statistics;

# EXAMPLES :

# example 1:
println("Linear Regression with data from 'data.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data.csv")) # loading data  učitavanje podataka (adatok beolvasása)

c =  cor(data.x, data.y); # specify correlation  određivanje koleracije (a koleráció meghatározása)
println("The correlation coefficient is: $c");println();

if c > 0.9
   println("There is a strong connection between data!");println();
elseif c > 0.7
   println("There is a strong connection between the data!");println();
elseif c > 0.5
   println("The connection between the data is sparingly!");println();
else
   println("The connection between the data is not strong enough!");println();
end

dataTrain, dataTest = TrainTestSplit(data, .80); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# view input data  prikaz ulaznih podataka (bemeneti adatok megtekintése):
describe(data)

# display data in the form of a chart  prikaz podataka u obliku grafikona (az adatok megjelenítése grafikon formájában):
plot(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
savefig(myInputPlot, "EX1-Data-before-Linear-Regression.html")=#


# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
# preparing for linear regression with training set  priprema za linearnu regresiju sa skupom za obuku (felkészülés a lineáris regresszióra a betanítási készlettel):
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása) 
linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)

# data testing by linear regression  testranje podataka linearnom regresijom (tesztelés lineáris regresszióval):
dataPredictedTrain = predict(linearRegressor, dataTrain);
dataPredictedTest = predict(linearRegressor, dataTest);

# print tested data  ispis testiranih podataka (tesztelt adatok megjelenítése):
for i in 1:length(dataPredictedTest)
   println("(X$i, Y$i) = ($(dataTest.x[i]), $(dataTest.y[i])) Predicted: Y$i $(dataPredictedTest[i])");
end
println();println();

# display data after linear regression in the form of a chart  prikaz podataka posle linearne regresije u obliku grafikona (az adatok megjelenítése grafikonon a lineáris regresszió után):
plot(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
#=myOutputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
scatter!(myOutputPlot, dataTest.x, dataTest.y)
scatter!(myOutputPlot, dataTest.x, dataPredictedTest)
savefig(myOutputPlot, "EX1-Data-after-Linear-Regression.html")=#


# 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
rSquared = r2(linearRegressor);
println("R squared is : $rSquared");println();

if (rSquared > 0.9)
   println("This model is very good for predicting!");println();
elseif (rSquared > 0.7)
   println("This model is good for predicting!");println();
elseif (rSquared > 0.5)
   println("This model is relatively good for predicting!");println();
else 
   println("This model is not good for predicting!");println();
end

# error count for a training set  računanje grešaka za skup za obuku (betanítási készlet hiba arányainak meghatározása):
errorsTrain = dataTrain.y - dataPredictedTrain;

println();
println("The list of all the mistakes in training is : $(round.(errorsTrain; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTrain = mean(abs.(errorsTrain));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTrain = mean(abs.(errorsTrain ./ dataTrain.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTrainSquared = errorsTrain .* errorsTrain;

# counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
mseTrain = mean(errorTrainSquared);
rmseTrain = sqrt(mean(errorTrainSquared));

# print errors for training set  ispis grešaka za skup obuke (betanítási készlet hibáinak megjelenítése):
println("The average absolute error in training set is: $absMeanErrorTrain");
println("The average relative error in training set is: $(mapeTrain *100)%");
println("The average quadrative error in training set is: $mseTrain");
println("The root of the average quadrate of training set error is: $rmseTrain");
println();

# counting errors for test set  računanje grešaka za test skup (a tesztkészlet hibáinak kiszámítása):
errorsTest = dataTest.y-dataPredictedTest;

println();
println("The list of all errors in the test is: $(round.(errorsTest; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTest = mean(abs.(errorsTest));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTest = mean(abs.(errorsTest ./ dataTest.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTestSquared = errorsTest .* errorsTest;

# Racunanje MSE i RMSE (Root Mean Square Error)
mseTest = mean(errorTestSquared);
rmseTest = sqrt(mean(errorTestSquared));

# print errors for test set  ispis grešaka za skup testiranja (tesztelés készlet hibáinak megjelenítése):
println("The average absolute error in the test set is: $absMeanErrorTest");
println("The average relative error in the test set is: $(mapeTest*100)%");
println("The average of the error quadratics in the test set is: $mseTest");
println("The root of the average of the error quadrate in the test set is: $rmseTest");
println();println();

# check to see if the system is well tested  provera da li je sistem dobro testiran (ellenőrizés, hogy a rendszer jól tesztelt-e):
if (rmseTrain < rmseTest)
   println("The system is well trained!");println();println();
else
   println("The system is not well trained!");println();println();
end


# example 2:
println("Linear Regression with data from 'data40B.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data40B.csv")) # loading data  učitavanje podataka (adatok beolvasása)

c =  cor(data.x, data.y); # specify correlation  određivanje koleracije (a koleráció meghatározása)
println("The correlation coefficient is: $c");println();

if c > 0.9
   println("There is a strong connection between data!");println();
elseif c > 0.7
   println("There is a strong connection between the data!");println();
elseif c > 0.5
   println("The connection between the data is sparingly!");println();
else
   println("The connection between the data is not strong enough!");println();
end

dataTrain, dataTest = TrainTestSplit(data, .70); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# view input data  prikaz ulaznih podataka (bemeneti adatok megtekintése):
describe(data)

# display data in the form of a chart  prikaz podataka u obliku grafikona (az adatok megjelenítése grafikon formájában):
plot(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
savefig(myInputPlot, "EX2-Data-before-Linear-Regression.html")=#


# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
# preparing for linear regression with training set  priprema za linearnu regresiju sa skupom za obuku (felkészülés a lineáris regresszióra a betanítási készlettel):
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása) 
linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)

# data testing by linear regression  testranje podataka linearnom regresijom (tesztelés lineáris regresszióval):
dataPredictedTrain = predict(linearRegressor, dataTrain);
dataPredictedTest = predict(linearRegressor, dataTest);

# print tested data  ispis testiranih podataka (tesztelt adatok megjelenítése):
for i in 1:length(dataPredictedTest)
   println("(X$i, Y$i) = ($(dataTest.x[i]), $(dataTest.y[i])) Predicted: Y$i $(dataPredictedTest[i])");
end
println();println();

# display data after linear regression in the form of a chart  prikaz podataka posle linearne regresije u obliku grafikona (az adatok megjelenítése grafikonon a lineáris regresszió után):
plot(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
#=myOutputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
scatter!(myOutputPlot, dataTest.x, dataTest.y)
scatter!(myOutputPlot, dataTest.x, dataPredictedTest)
savefig(myOutputPlot, "EX2-Data-after-Linear-Regression.html")=#


# 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
rSquared = r2(linearRegressor);
println("R squared is : $rSquared");println();

if (rSquared > 0.9)
   println("This model is very good for predicting!");println();
elseif (rSquared > 0.7)
   println("This model is good for predicting!");println();
elseif (rSquared > 0.5)
   println("This model is relatively good for predicting!");println();
else 
   println("This model is not good for predicting!");println();
end

# error count for a training set  računanje grešaka za skup za obuku (betanítási készlet hiba arányainak meghatározása):
errorsTrain = dataTrain.y - dataPredictedTrain;

println();
println("The list of all the mistakes in training is : $(round.(errorsTrain; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTrain = mean(abs.(errorsTrain));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTrain = mean(abs.(errorsTrain ./ dataTrain.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTrainSquared = errorsTrain .* errorsTrain;

# counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
mseTrain = mean(errorTrainSquared);
rmseTrain = sqrt(mean(errorTrainSquared));

# print errors for training set  ispis grešaka za skup obuke (betanítási készlet hibáinak megjelenítése):
println("The average absolute error in training set is: $absMeanErrorTrain");
println("The average relative error in training set is: $(mapeTrain *100)%");
println("The average quadrative error in training set is: $mseTrain");
println("The root of the average quadrate of training set error is: $rmseTrain");
println();

# counting errors for test set  računanje grešaka za test skup (a tesztkészlet hibáinak kiszámítása):
errorsTest = dataTest.y-dataPredictedTest;

println();
println("The list of all errors in the test is: $(round.(errorsTest; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTest = mean(abs.(errorsTest));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTest = mean(abs.(errorsTest ./ dataTest.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTestSquared = errorsTest .* errorsTest;

# Racunanje MSE i RMSE (Root Mean Square Error)
mseTest = mean(errorTestSquared);
rmseTest = sqrt(mean(errorTestSquared));

# print errors for test set  ispis grešaka za skup testiranja (tesztelés készlet hibáinak megjelenítése):
println("The average absolute error in the test set is: $absMeanErrorTest");
println("The average relative error in the test set is: $(mapeTest*100)%");
println("The average of the error quadratics in the test set is: $mseTest");
println("The root of the average of the error quadrate in the test set is: $rmseTest");
println();println();

# check to see if the system is well tested  provera da li je sistem dobro testiran (ellenőrizés, hogy a rendszer jól tesztelt-e):
if (rmseTrain < rmseTest)
   println("The system is well trained!");println();println();
else
   println("The system is not well trained!");println();println();
end


# example 3:
println("Linear Regression with data from 'data40E.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data40E.csv")) # loading data  učitavanje podataka (adatok beolvasása)

c =  cor(data.x, data.y); # specify correlation  određivanje koleracije (a koleráció meghatározása)
println("The correlation coefficient is: $c");println();

if c > 0.9
   println("There is a strong connection between data!");println();
elseif c > 0.7
   println("There is a strong connection between the data!");println();
elseif c > 0.5
   println("The connection between the data is sparingly!");println();
else
   println("The connection between the data is not strong enough!");println();
end

dataTrain, dataTest = TrainTestSplit(data, .75); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# view input data  prikaz ulaznih podataka (bemeneti adatok megtekintése):
describe(data)

# display data in the form of a chart  prikaz podataka u obliku grafikona (az adatok megjelenítése grafikon formájában):
plot(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
savefig(myInputPlot, "EX3-Data-before-Linear-Regression.html")=#


# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
# preparing for linear regression with training set  priprema za linearnu regresiju sa skupom za obuku (felkészülés a lineáris regresszióra a betanítási készlettel):
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása) 
linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)

# data testing by linear regression  testranje podataka linearnom regresijom (tesztelés lineáris regresszióval):
dataPredictedTrain = predict(linearRegressor, dataTrain);
dataPredictedTest = predict(linearRegressor, dataTest);

# print tested data  ispis testiranih podataka (tesztelt adatok megjelenítése):
for i in 1:length(dataPredictedTest)
   println("(X$i, Y$i) = ($(dataTest.x[i]), $(dataTest.y[i])) Predicted: Y$i $(dataPredictedTest[i])");
end
println();println();

# display data after linear regression in the form of a chart  prikaz podataka posle linearne regresije u obliku grafikona (az adatok megjelenítése grafikonon a lineáris regresszió után):
plot(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
#=myOutputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
scatter!(myOutputPlot, dataTest.x, dataTest.y)
scatter!(myOutputPlot, dataTest.x, dataPredictedTest)
savefig(myOutputPlot, "EX3-Data-after-Linear-Regression.html")=#


# 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
rSquared = r2(linearRegressor);
println("R squared is : $rSquared");println();

if (rSquared > 0.9)
   println("This model is very good for predicting!");println();
elseif (rSquared > 0.7)
   println("This model is good for predicting!");println();
elseif (rSquared > 0.5)
   println("This model is relatively good for predicting!");println();
else 
   println("This model is not good for predicting!");println();
end

# error count for a training set  računanje grešaka za skup za obuku (betanítási készlet hiba arányainak meghatározása):
errorsTrain = dataTrain.y - dataPredictedTrain;

println();
println("The list of all the mistakes in training is : $(round.(errorsTrain; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTrain = mean(abs.(errorsTrain));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTrain = mean(abs.(errorsTrain ./ dataTrain.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTrainSquared = errorsTrain .* errorsTrain;

# counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
mseTrain = mean(errorTrainSquared);
rmseTrain = sqrt(mean(errorTrainSquared));

# print errors for training set  ispis grešaka za skup obuke (betanítási készlet hibáinak megjelenítése):
println("The average absolute error in training set is: $absMeanErrorTrain");
println("The average relative error in training set is: $(mapeTrain *100)%");
println("The average quadrative error in training set is: $mseTrain");
println("The root of the average quadrate of training set error is: $rmseTrain");
println();

# counting errors for test set  računanje grešaka za test skup (a tesztkészlet hibáinak kiszámítása):
errorsTest = dataTest.y-dataPredictedTest;

println();
println("The list of all errors in the test is: $(round.(errorsTest; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTest = mean(abs.(errorsTest));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTest = mean(abs.(errorsTest ./ dataTest.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTestSquared = errorsTest .* errorsTest;

# Racunanje MSE i RMSE (Root Mean Square Error)
mseTest = mean(errorTestSquared);
rmseTest = sqrt(mean(errorTestSquared));

# print errors for test set  ispis grešaka za skup testiranja (tesztelés készlet hibáinak megjelenítése):
println("The average absolute error in the test set is: $absMeanErrorTest");
println("The average relative error in the test set is: $(mapeTest*100)%");
println("The average of the error quadratics in the test set is: $mseTest");
println("The root of the average of the error quadrate in the test set is: $rmseTest");
println();println();

# check to see if the system is well tested  provera da li je sistem dobro testiran (ellenőrizés, hogy a rendszer jól tesztelt-e):
if (rmseTrain < rmseTest)
   println("The system is well trained!");println();println();
else
   println("The system is not well trained!");println();println();
end


# example 3:
println("Linear Regression with data from 'data40.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\data40.csv")) # loading data  učitavanje podataka (adatok beolvasása)

c =  cor(data.x, data.y); # specify correlation  određivanje koleracije (a koleráció meghatározása)
println("The correlation coefficient is: $c");println();

if c > 0.9
   println("There is a strong connection between data!");println();
elseif c > 0.7
   println("There is a strong connection between the data!");println();
elseif c > 0.5
   println("The connection between the data is sparingly!");println();
else
   println("The connection between the data is not strong enough!");println();
end

dataTrain, dataTest = TrainTestSplit(data, .75); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)

# view input data  prikaz ulaznih podataka (bemeneti adatok megtekintése):
describe(data)

# display data in the form of a chart  prikaz podataka u obliku grafikona (az adatok megjelenítése grafikon formájában):
plot(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
#=myInputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, before Linear Regression", ylabel = "Y values", xlabel = "X value")
savefig(myInputPlot, "EX4-Data-before-Linear-Regression.html")=#


# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
# preparing for linear regression with training set  priprema za linearnu regresiju sa skupom za obuku (felkészülés a lineáris regresszióra a betanítási készlettel):
fm = @formula(y ~ x); # definition of the formula   definicija formule (a képlet meghatározása) 
linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)

# data testing by linear regression  testranje podataka linearnom regresijom (tesztelés lineáris regresszióval):
dataPredictedTrain = predict(linearRegressor, dataTrain);
dataPredictedTest = predict(linearRegressor, dataTest);

# print tested data  ispis testiranih podataka (tesztelt adatok megjelenítése):
for i in 1:length(dataPredictedTest)
   println("(X$i, Y$i) = ($(dataTest.x[i]), $(dataTest.y[i])) Predicted: Y$i $(dataPredictedTest[i])");
end
println();println();

# display data after linear regression in the form of a chart  prikaz podataka posle linearne regresije u obliku grafikona (az adatok megjelenítése grafikonon a lineáris regresszió után):
plot(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
#=myOutputPlot = scatter(dataTrain.x, dataTrain.y, title = "Data, after Linear Regression", ylabel = "Y values", xlabel = "X value", legend=:bottomright)
scatter!(myOutputPlot, dataTest.x, dataTest.y)
scatter!(myOutputPlot, dataTest.x, dataPredictedTest)
savefig(myOutputPlot, "EX3-Data-after-Linear-Regression.html")=#


# 3. Step : analysis of results  analiza rezultata (az eredmények elemzése) :
rSquared = r2(linearRegressor);
println("R squared is : $rSquared");println();

if (rSquared > 0.9)
   println("This model is very good for predicting!");println();
elseif (rSquared > 0.7)
   println("This model is good for predicting!");println();
elseif (rSquared > 0.5)
   println("This model is relatively good for predicting!");println();
else 
   println("This model is not good for predicting!");println();
end

# error count for a training set  računanje grešaka za skup za obuku (betanítási készlet hiba arányainak meghatározása):
errorsTrain = dataTrain.y - dataPredictedTrain;

println();
println("The list of all the mistakes in training is : $(round.(errorsTrain; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTrain = mean(abs.(errorsTrain));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTrain = mean(abs.(errorsTrain ./ dataTrain.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTrainSquared = errorsTrain .* errorsTrain;

# counting MSE (Mean Squared Error) and RMSE (Root Mean Squared Error)  računanje MSE i RMSE (a MSE és RMSE hibák kiszámítása):
mseTrain = mean(errorTrainSquared);
rmseTrain = sqrt(mean(errorTrainSquared));

# print errors for training set  ispis grešaka za skup obuke (betanítási készlet hibáinak megjelenítése):
println("The average absolute error in training set is: $absMeanErrorTrain");
println("The average relative error in training set is: $(mapeTrain *100)%");
println("The average quadrative error in training set is: $mseTrain");
println("The root of the average quadrate of training set error is: $rmseTrain");
println();

# counting errors for test set  računanje grešaka za test skup (a tesztkészlet hibáinak kiszámítása):
errorsTest = dataTest.y-dataPredictedTest;

println();
println("The list of all errors in the test is: $(round.(errorsTest; digits = 3))");

# computing the average of absolute values of errors  računanje proseka apsolutnih vrednosti grešaka (a hibák abszolút értékeinek átlagának kiszámítása):
absMeanErrorTest = mean(abs.(errorsTest));

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hibát kiszámítása százalékban):
mapeTest = mean(abs.(errorsTest ./ dataTest.y));

# computing error quadrates for each value separately  računanje kvadarata grešaka za svaku vrednost posebno (a hibák négyzetének kiszámítása minden értékre külön-külön):
errorTestSquared = errorsTest .* errorsTest;

# Racunanje MSE i RMSE (Root Mean Square Error)
mseTest = mean(errorTestSquared);
rmseTest = sqrt(mean(errorTestSquared));

# print errors for test set  ispis grešaka za skup testiranja (tesztelés készlet hibáinak megjelenítése):
println("The average absolute error in the test set is: $absMeanErrorTest");
println("The average relative error in the test set is: $(mapeTest*100)%");
println("The average of the error quadratics in the test set is: $mseTest");
println("The root of the average of the error quadrate in the test set is: $rmseTest");
println();println();

# check to see if the system is well tested  provera da li je sistem dobro testiran (ellenőrizés, hogy a rendszer jól tesztelt-e):
if (rmseTrain < rmseTest)
   println("The system is well trained!");println();println();
else
   println("The system is not well trained!");println();println();
end