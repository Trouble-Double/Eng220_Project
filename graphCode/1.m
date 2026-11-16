T = readtable('Cuba_NM_Housing_Dataset_Catalog(1_Executive_Dashboard).csv'); 

 

income = [58750 32942 86636 64059]; 

figure 

bar(income) 

title('Median Household Income') 

ylabel('Income ($)') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

occupancy = [ 

84.9 15.1; 

80.8 19.2; 

81.5 18.5; 

70.0 30.0 

]; 

figure 

bar(occupancy,'stacked') 

title('Owner vs Renter Occupancy') 

ylabel('Percent') 

legend('Owner Occupied','Renter Occupied') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

renterBurden = [20.8 35.8 46.2 45.8]; 

figure 

bar(renterBurden) 

title('Renter Cost Burden >= 30%') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ownerBurden = [17.8 22.4 21.8 21.4]; 

figure 

bar(ownerBurden) 

title('Owner Cost Burden >= 30%') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ownerBurden = [17.8 22.4 21.8 21.4]; 

figure 

bar(ownerBurden) 

title('Owner Cost Burden >= 30%') 

ylabel('Percent') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

ratio = [2.57 2.29 3.68 3.87]; 

figure 

bar(ratio) 

title('Price-to-Income Ratio') 

ylabel('Ratio') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

households = [159 1527 56890 837414]; 

figure 

bar(households) 

title('Occupied Households') 

ylabel('Households') 

xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'}) 

grid on 

 

population = [462 4789 5251]; 

figure 

bar(population) 

title('Population Comparison') 

ylabel('Population') 

xticklabels({'Village Only','Rural Area','Full ZIP'}) 

grid on 

 

vacancy = [40.9 19.9 22.7]; 

figure 

bar(vacancy) 

title('Gross Vacancy Rate') 

ylabel('Percent') 

xticklabels({'Village Only','Rural Area','Full ZIP'}) 

grid on 

 

geoIncome = [58750 29850 32942]; 

figure 

bar(geoIncome) 

title('Median Household Income by Geography') 

ylabel('Income ($)') 

xticklabels({'Village Only','Rural Area','Full ZIP'}) 

grid on 

tiledlayout(2,2) 

nexttile 

bar(income) 

title('Median Income') 

nexttile 

bar(renterBurden) 

title('Renter Burden') 

nexttile 

bar(ownerBurden) 

title('Owner Burden') 

nexttile 

bar(ratio) 

title('Price-to-Income Ratio') 

 

exportgraphics(gcf,'ExecutiveDashboard.png','Resolution',300) 

 
