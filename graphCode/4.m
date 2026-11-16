T = readtable('Cuba_NM_Housing_Dataset_Catalog(4_CrossGeo_MOE_Benchmark)(in).csv'); 

population = [462 5251 153604 2114371]; 

figure 

bar(population) 

title('Population Comparison') 

ylabel('Population') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

housingUnits = [269 1976 61842 956964]; 

figure 

bar(housingUnits) 

title('Housing Units') 

ylabel('Units') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

housingUnits = [269 1976 61842 956964]; 

figure 

bar(housingUnits) 

title('Housing Units') 

ylabel('Units') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

[Text Wrapping Break]households = [159 1527 56890 837414]; 

figure 

bar(households) 

title('Occupied Households') 

ylabel('Households') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

households = [159 1527 56890 837414]; 

figure 

bar(households) 

title('Occupied Households') 

ylabel('Households') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

vacancy = [40.9 22.7 8.0 12.5]; 

figure 

bar(vacancy) 

title('Gross Vacancy Rate') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ownerShare = [84.9 80.8 81.5 70.0]; 

figure 

bar(ownerShare) 

title('Owner Occupied Share') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

renterShare = [15.1 19.2 18.5 30.0]; 

figure 

bar(renterShare) 

title('Renter Occupied Share') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

income = [58750 32942 86636 64059]; 

figure 

bar(income) 

title('Median Household Income') 

ylabel('Dollars') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

renterIncome = [30313 21450 54210 41820]; 

figure 

bar(renterIncome) 

title('Median Renter Household Income') 

ylabel('Dollars') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

homeValue = [150700 75400 318400 248100]; 

figure 

bar(homeValue) 

title('Median Home Value') 

ylabel('Dollars') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ratio = [2.57 2.29 3.68 3.87]; 

figure 

bar(ratio) 

title('Price-to-Income Ratio') 

ylabel('Ratio') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ownerCost = [572 418 1445 1082]; 

figure 

bar(ownerCost) 

title('Median Monthly Owner Cost') 

ylabel('Dollars') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

rent = [306 548 1412 1067]; 

figure 

bar(rent) 

title('Median Gross Rent') 

ylabel('Dollars') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

rentIncome = [12.1 30.7 31.3 30.6]; 

figure 

bar(rentIncome) 

title('Annual Rent to Income Ratio') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

renterBurden = [20.8 35.8 46.2 45.8]; 

figure 

bar(renterBurden) 

title('Renter Cost Burden >= 30 Percent') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ownerBurden = [17.8 22.4 21.8 21.4]; 

figure 

bar(ownerBurden) 

title('Owner Cost Burden >= 30 Percent') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

incomeCV = [47.7 10.0 2.0 0.8]; 

figure 

bar(incomeCV) 

title('Income Reliability (CV %)') 

ylabel('CV Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

householdCV = [23.3 6.0 0.6 0.2]; 

figure 

bar(householdCV) 

title('Household Estimate Reliability') 

ylabel('CV Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

income = [58750 32942 86636 64059]; 

incomeSE = [28005 3290 1729 491]; 

figure 

errorbar(1:4,income,incomeSE,'o','LineWidth',2) 

xticks(1:4) 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

title('Median Household Income with Confidence Intervals') 

ylabel('Income ($)') 

grid on 

 

tiledlayout(2,3) 

nexttile 

bar(income) 

title('Median Income') 

nexttile 

bar(homeValue) 

title('Home Value') 

nexttile 

bar(vacancy) 

title('Vacancy') 

nexttile 

bar(ratio) 

title('Price/Income Ratio') 

nexttile 

bar(renterBurden) 

title('Renter Burden') 

nexttile 

bar(ownerBurden) 

title('Owner Burden') 
