using Statistics;
using StatsModels;
using StatsBase;
using DataFrames;
using CSV;
using Plots;
using StatsPlots;

# Step 1 : LOADING AND PRINTING DATA  učitavanje i ispis podataka (adatok betöltése és kiírása) :

df = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Data preparation\\Data\\car_prices.csv"));  # loading data  učitavanje podataka (adatok beolvasása)

# print statistics before preparation  ispis statističkih podataka pre pripreme (statisztikai adatok kiírása az előkészítés előtt):
display(describe(df));
println();

display(countmap(df[!, :color])); # print color values  ispis vrednosti boja (színértékek kiírása)

display(countmap(df[!, :type])); # print type values  ispis vrednosti tipa (típus értékeinek kiírása)

display(countmap(df[!, :damage])); # print damage value  ispis vrednosti oštećenja (sérülés értéke kiírása)

display(countmap(df[!, :status])); # print status values  ispis vrednosti stanja (állapotértékek kiírása)

display(countmap(df[!, :price])); # print price values  ispis vrednosti cena (árértékek kiírása)


# Step 2 : MODIFICATION OF DATA TO BE READY FOR USE  modifikacija podataka da budu spremni za korišćenje (az adatok módosítása, hogy használatra készek legyenek) :

# Eject specific lines based on price  izbacivanje određenih redova na osnovu cene (adott sorok kidobása az ár alapján):
dropmissing!(df, [:price]); # Removing lines where there is no price  izbacivanje redova gde nepostoji cena (ár nélküli sorok eltávolítása)
filter!(row -> row.price != 0, df); # ejection of rows where price = 0  izbacivanje redova gde je cena = 0 (sorok kidobása, ahol az ár = 0)

# Eject entire column of colors  izbacivanje cele kolone boja (a színek oszlopának eltávolítása)
select!(df, Not(:color));

# data on the condition of the missing engine can be replaced by the state that most often appears
# podatke o stanju motora koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó motor állapotára vonatkozó adatok helyettesíthetők a leggyakrabban megjelenő állapottal
df[ismissing.(df[!,:status]), :status] .= mode(skipmissing(df[!, :status]));

# replace the missing damage data with the most commonly occurring condition.
# podatke o oštećenju koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó káradatokat a leggyakrabban előforduló állapotra cserélhetjük
df[ismissing.(df[!,:damage]), :damage] .= mode(skipmissing(df[!, :damage]));

# for numeric columns that have few missing values, we can fill them with the average of other values
# za numeričke kolone koje imaju malo nedostajućih vrednosti, možemo ih popuniti prosekom ostalih vrednosti
# a kevés hiányzó értékkel rendelkező numerikus oszlopok esetében kitölthetjük őket más értékek átlagával
df[ismissing.(df[!,:mileage]), :mileage] .= trunc(Int64,mean(skipmissing(df[!, :mileage])));


# print statistics after preparation  ispis statističkih podataka posle pripreme (statisztikai adatok kiírása az előkészítés után):
println();
display(describe(df));
println();


# Step 3 : DRAWING GRAPHICS  crtanje grafikona (grafikonok rajzolása):

plotappl = scatter(df.age, df.price, title = "Scatter Age - Price", ylabel = "Price", xlabel = "Age", legend = true)  
#display(plotappl) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotappl, "age-price.html")

plotcoap = scatter(df.mileage, df.price, title = "Scatter MileAge - Price", ylabel = "Price", xlabel="MileAge", legend = true)  
#display(plotcoap) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotcoap, "mileage-price.html")

plotloan = scatter(df.kW, df.price,  title = "Scatter KW - Price", ylabel = "Price", xlabel = "kW", legend = true)
#display(plotloan) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotloan, "kwscatter.html")

plotloanterm = scatter(df.KS, df.price,  title = "Scatter KS - Price", ylabel = "Price", xlabel = "KS", legend = true)
#display(plotloanterm) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotloanterm, "ksscatter.html")

plotcredit = scatter(df.numberOfCylinders, df.price, title = "Scatter Number of cylinders - Price", ylabel = "Price", xlabel="Number of cylinders", legend = true)
#display(plotcredit) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotcredit, "numberofCylinders-price.html")


# Step 4 : CHECK THE GRAPHS AND DECIDE IF IT NEED TO BE MODIFIED MORE  provera grafikona i odluka da li treba još modifikovati (Ellenőrizze a grafikont, és döntse el, hogy szükség van-e további módosításra) :

# Step 5 : RE-MODIFYING THE DATA TO BE READY FOR USE  ponovna modifikacija podataka da budu spremni za korišćenje (az adatok újramódosítása, hogy használatra készek legyenek) :

# we choose only engines that are between 1900 and 2021
# biramo samo motore kojima je godište između 1900 i 2021
# csak olyan motorokat választunk, amelyek 1900 és 2021 között vannak
filter!(row ->row.age <= 2021 && row.age > 1900, df);

# we choose only engines with a mileage of more than 500000
# biramo samo motore kojima je kilometraža veća od 500000
# csak olyan motorokat választunk, amelyek futásteljesítménye meghaladja az 500 000
filter!(row ->row.mileage <= 500000, df);

# we choose only engines with cylinders less than 1 and larger than 300
# biramo samo motore kojima je cilindara manji od 1 i veci od 300
# csak 1-nél kisebb és 300-nál nagyobb hengerekkel rendelkező motorokat választunk
filter!(row ->row.numberOfCylinders > 0 && row.numberOfCylinders < 300, df);

# potential multicollinearity between kW and KS
# potencijalna multikolinearnost između kW i KS
# potenciális multikollinearitás kW és KS között
covKwKs = cov(df.kW, df.KS);

# if there is a multicolicity, we throw out one column
# ako postoji multikolearnost izbacujemo jednu kolonu
# ha multikolicitás van, akkor az egyik oszlopot eltávolítjuk
if(covKwKs > 0.6)
    select!(df, Not(:kW));
end


# Step 6 : DATA IS READY TO USE  podaci su spremni za upotrebu (az adatok használatra készek) !!

# print statistical ready data  ispis statističkih spremnih podataka (statisztikailag kész adataok kiírása):
println();
display(describe(df));