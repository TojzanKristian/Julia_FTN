using Statistics;
using StatsModels;
using StatsBase;
using DataFrames;
using CSV;
using Plots;
using StatsPlots;

# Step 1 : LOADING AND PRINTING DATA  učitavanje i ispis podataka (adatok betöltése és kiírása) :

data = DataFrame(CSV.File("C:\\Users\\38162\\Desktop\\Data preparation\\Data\\credits.csv")); # loading data  učitavanje podataka (adatok beolvasása)

# print statistics before preparation  ispis statističkih podataka pre pripreme (statisztikai adatok kiírása az előkészítés előtt):
display(describe(data));
println();

display(countmap(data[!, :Gender])); # print gender values  ispis vrednosti pola (a nem értékének kiírása)

display(countmap(data[!, :Married])); # print marriage information  ispis informacije o braku (a házasságról szóló informació kiírása)

display(countmap(data[!, :Dependents])); # print dependent columns  ispis zavisnih kolona (az összefüggő oszlopok kiírása)

display(countmap(data[!, :Self_Employed])); # print self-employed column values  ispis vrednosti samozaposlene kolone (önálló vállalkozó oszlopértékek kiírása)

display(countmap(data[!, :LoanAmount])); # print the value of the loan amount  ispis vrednosti iznosa kredita (a hitelösszeg értékeinek kiírása)

display(countmap(data[!, :Loan_Amount_Term])); # print the term value for loan amounts  ispis vrednosti roka za isplatu kredita (hitelösszeg futamidejének kiírása)

display(countmap(data[!, :Credit_History])); # print credit history  ispis kreditne istorije (hiteltörténetet kiírása)


# Step 2 : MODIFICATION OF DATA TO BE READY FOR USE  modifikacija podataka da budu spremni za korišćenje (az adatok módosítása, hogy használatra készek legyenek) :

# missing gender data can be replaced by the most commonly occurring state
# podatke o polu koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó adatokat a nemről helyettesíthetjük a leggyakrabban előforduló állapottal
data[ismissing.(data[!, :Gender]), :Gender] .= mode(skipmissing(data[!, :Gender]));

# missing marriage data can be replaced by the most commonly occurring state
# podatke o braku koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó házassági adatok helyettesíthetők a leggyakrabban előforduló állapottal
data[ismissing.(data[!, :Married]), :Married] .= mode(skipmissing(data[!, :Married]));

# missing column dependencies data can be replaced by the most commonly occurring state
# podatke o zavisnosti kolona koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó oszlopfüggőségi adatok helyettesíthetők a leggyakrabban előforduló állapottal
data[ismissing.(data[!, :Dependents]), :Dependents] .= mode(skipmissing(data[!, :Dependents]));

# missing self-employment data can be replaced by the most commonly occurring condition
# podatke o samozapošljenju koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó önfoglalkoztatási adatok pótolhatók a leggyakrabban előforduló feltétellel
data[ismissing.(data[!, :Self_Employed]), :Self_Employed] .= mode(skipmissing(data[!, :Self_Employed]));

# the data on the amount of loans that are missing can be replaced by the balance that most often appears
# podatke o iznosu kredita koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó hitelek összegére vonatkozó adatok helyettesíthetők a leggyakrabban megjelenő egyenleggel
data[ismissing.(data[!, :LoanAmount]), :LoanAmount] .= trunc(Int64,mean(skipmissing(data[!, :LoanAmount])))

# the data for payment of missing loans can be replaced by the balance that most often appears
# podatke o roku za isplatu kredita koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó hitel kifizetések határidejére vonatkozó adatok helyettesíthetők a leggyakrabban megjelenő adattal
data[ismissing.(data[!, :Loan_Amount_Term]), :Loan_Amount_Term] .= trunc(Int64,mean(skipmissing(data[!, :Loan_Amount_Term])))

# replace the missing credit history data with the most commonly occurring balance
# podatke o istoriji kredita koji nedostaju možemo zameniti stanjem koje se najčešće pojavljuje
# a hiányzó hiteltörténeti adatokat a leggyakrabban előforduló adattal helyettesíthetjük
data[ismissing.(data[!, :Credit_History]), :Credit_History] .= trunc(Int64,mean(skipmissing(data[!, :Credit_History])))


# print statistics after preparation  ispis statističkih podataka posle pripreme (statisztikai adatok kiírása az előkészítés után):
println();
display(describe(data));
println();


# Step 3 : DRAWING GRAPHICS  crtanje grafikona (grafikonok rajzolása):

plotA = scatter(data.Gender, data.LoanAmount, title = "Scatter Gender - Loan amount", ylabel = "Loan Amount", xlabel = "Gender", legend = true)  
#display(plotA) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotA, "loanAmount-gender.html")

plotB = scatter(data.Married, data.LoanAmount, title = "Scatter Married - Loan amount", ylabel = "Loan Amount", xlabel="Married", legend = true)  
#display(plotB) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotB, "loanAmount-married.html")

plotC = scatter(data.Dependents, data.LoanAmount,  title = "Scatter Dependents - Loan amount", ylabel = "Loan Amount", xlabel = "Dependents", legend = true)
#display(plotC) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotC, "loanAmount-dependents.html")

plotD = scatter(data.Self_Employed, data.LoanAmount,  title = "Scatter Self employed - Loan amount", ylabel = "Loan Amount", xlabel = "Self employed", legend = true)
#display(plotD) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotD, "loanAmount-selfEmployed.html")

plotE = scatter(data.Loan_Amount_Term, data.LoanAmount, title = "Scatter Loan amount term - Loan amount", ylabel = "Loan Amount", xlabel="Loan amount term", legend = true)
#display(plotE) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotE, "loanAmount-loanAmountTerm.html")

plotF = scatter(data.Credit_History, data.LoanAmount, title = "Scatter Credit history - Loan amount", ylabel = "Loan Amount", xlabel="Credit history", legend = true)
#display(plotF) # if you want to show up in Julia  ako želimo da se grafik prikaže u juliji (megjelentés)
savefig(plotF, "loanAmount-creditHistory.html")

# Step 4 : CHECK THE GRAPHS AND DECIDE IF IT NEED TO BE MODIFIED MORE  provera grafikona i odluka da li treba još modifikovati (Ellenőrizze a grafikont, és döntse el, hogy szükség van-e további módosításra) :