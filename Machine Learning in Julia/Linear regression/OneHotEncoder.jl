# LINEAR REGRESSION USING ONE HOT ENCODER

using Statistics;
using StatsModels;
using GLM;
using DataFrames;
using CSV;
using Lathe;
using Lathe.preprocess;
using StatsBase;
using MLBase;


println("Linear Regression with one hot encoder use data from 'cars.csv' :");println();
# 1. Step : preparation and verification of data  priprema i provera podataka (az adatok előkészítése és ellenőrzése) :
data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Machine Learning in Julia\\Linear regression\\Data\\cars.csv")); # loading data  učitavanje podataka (adatok beolvasása)

encoder = Lathe.preprocess.OneHotEncoder();  # encoder initialization  inicijalizacija enkodera (enkóder/kódoló inicializálása)

data = encoder.predict(data, :model); # the use of encoders for prediction  upotreba enkodera za predikciju (enkóder/kódoló használata az előrejelzéshez)

dataTrain, dataTest = Lathe.preprocess.TrainTestSplit(data, .70); # division into training and testing set  podela na skup za obuku i testiranja (felosztás képzési és tesztelési készletre)


# 2. Step : linear regression  linearna regresija (lineáris regresszió) :
fm = @formula(price ~ cubicMeters + age + model); # definition of the formula   definicija formule (a képlet meghatározása) 
linearRegressor = lm(fm, dataTrain); # call of linear regression  poziv linearne regresije (lineáris regresszió alklamazása)

# price prediction for cars  predviđanje cene za aute (autók árának előrejelzése):
PredictedPrice = predict(linearRegressor, dataTest);

# print predicted data  ispis predviđenih podataka (előrejelzett adatok kiírása):
println("Estimated vehicle prices: ");
for i in 1:length(PredictedPrice)
   println("X$i : $(dataTest.manufacturer[i])   $(dataTest.model[i])  $(dataTest.cubicMeters[i])  $(dataTest.age[i])  price: $(dataTest.price[i]), assessment: $(PredictedPrice[i])")
end
println();println();


# 3. Step : analysis of results  analiza rezultata (Az eredmények elemzése) :
# error estimation and print   procena greške i ispis (hibabecslés és kiírás):
errorsTest = dataTest.price-PredictedPrice;

println("The list of all errors in the test is: $(round.(abs.(errorsTest); digits = 2))");
println();

# calculating and printing the average of an absolute error  računanje i ispis proseka absolutne greške (az abszolút hiba átlagának kiszámítása és kiírása):
absMeanErrorTest = mean(abs.(errorsTest));
println("The average absolute error in testing set is: $(absMeanErrorTest)€");

# calculate the average relative error in percentages  računanje prosečne relativne greške u procentima (átlagos relatív hiba kiszámítása százalékban):
mapeTest = mean(abs.(errorsTest ./ dataTest.price));
println("The average relative error in the test is: $(mapeTest*100)%");