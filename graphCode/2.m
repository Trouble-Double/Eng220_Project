T = readtable('Cuba_NM_Housing_Dataset_Catalog(2_Longitudinal_ZTests).csv'); 

 

populationVillage = [642 462]; 

figure 

bar(populationVillage) 

title('Cuba Village Population Change') 

ylabel('Population') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

 

populationZCTA = [5557 5251]; 

figure 

bar(populationZCTA) 

title('ZIP 87013 Population Change') 

ylabel('Population') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

 

incomeVillage = [31649 58750]; 

incomeZCTA = [31649 32942]; 

figure 

bar([incomeVillage;incomeZCTA]') 

title('Median Household Income Change') 

ylabel('Income ($)') 

legend('Cuba Village','ZIP 87013') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

homeValueVillage = [112500 150700]; 

homeValueZCTA = [77900 75400]; 

figure 

bar([homeValueVillage;homeValueZCTA]') 

title('Median Home Value Change') 

ylabel('Value ($)') 

legend('Cuba Village','ZIP 87013') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

 

vacancyVillage = [26.9 40.9]; 

vacancyZCTA = [19.7 22.7]; 

figure 

bar([vacancyVillage;vacancyZCTA]') 

title('Vacancy Rate Change') 

ylabel('Percent') 

legend('Cuba Village','ZIP 87013') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

 

ownerShare = [65.1 84.9; 

          	80.0 80.8]; 

figure 

bar(ownerShare') 

title('Owner Occupied Share') 

ylabel('Percent') 

legend('Cuba Village','ZIP 87013') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

renterShare = [34.9 15.1; 

           	20.0 19.2]; 

figure 

bar(renterShare') 

title('Renter Occupied Share') 

ylabel('Percent') 

legend('Cuba Village','ZIP 87013') 

xticklabels({'2015-2019','2020-2024'}) 

grid on 

 

changes = [-28.0 85.6 34.0 52.0]; 

figure 

bar(changes) 

title('Major Cuba Village Changes (%)') 

ylabel('Percent Change') 

xticklabels({ 

'Population' 

'Income' 

'Home Value' 

'Vacancy' 

}) 

grid on 

 

changes = [-28.0 85.6 34.0 52.0]; 

figure 

bar(changes) 

title('Major Cuba Village Changes (%)') 

ylabel('Percent Change') 

xticklabels({ 

'Population' 

'Income' 

'Home Value' 

'Vacancy' 

}) 

grid on 

 

income = [31649 58750]; 

moe = [11840 46069]; 

figure 

errorbar(1:2,income,moe,'o','LineWidth',2) 

xticks([1 2]) 

xticklabels({'2015-2019','2020-2024'}) 

title('Median Household Income with MOE') 

ylabel('Income ($)') 

grid on 

 

tiledlayout(2,2) 

nexttile 

bar(populationVillage) 

title('Population') 

nexttile 

bar(incomeVillage) 

title('Income') 

nexttile 

bar(homeValueVillage) 

title('Home Value') 

nexttile 

bar(vacancyVillage) 

title('Vacancy') 
