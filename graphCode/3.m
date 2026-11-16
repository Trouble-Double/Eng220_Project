population = [462 4789]; 

figure 

bar(population) 

title('Village vs Hinterland Population') 

ylabel('Population') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

housingUnits = [269 1707]; 

figure 

bar(housingUnits) 

title('Total Housing Units') 

ylabel('Units') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

occupied = [159 1368]; 

figure 

bar(occupied) 

title('Occupied Housing Units') 

ylabel('Units') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

vacant = [110 339]; 

figure 

bar(vacant) 

title('Vacant Housing Units') 

ylabel('Units') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

vacancyRate = [40.9 19.9]; 

figure 

bar(vacancyRate) 

title('Gross Housing Vacancy Rate') 

ylabel('Percent') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

income = [58750 29850]; 

figure 

bar(income) 

title('Median Household Income') 

ylabel('Income ($)') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

meanIncome = [70094 42237]; 

figure 

bar(meanIncome) 

title('Mean Household Income') 

ylabel('Income ($)') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

perCapita = [24855 13755]; 

figure 

bar(perCapita) 

title('Per Capita Income') 

ylabel('Income ($)') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

poverty = [22.5 39.3]; 

figure 

bar(poverty) 

title('Individual Poverty Rate') 

ylabel('Percent') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

homeValue = [150700 68500]; 

figure 

bar(homeValue) 

title('Median Owner Occupied Home Value') 

ylabel('Value ($)') 

xticklabels({'Cuba Village','Outlying Hinterland'}) 

grid on 

 

shares = [8.8 13.6 10.4 10.9 8.2]; 

figure 

bar(shares) 

xticklabels({ 

'Population' 

'Housing Units' 

'Occupied Units' 

'Owner HH' 

'Renter HH' 

}) 

title('Village Share of ZIP Code') 

ylabel('Percent of Entire ZIP') 

grid on 

 

tenure = [135 24; 

      	1099 269]; 

figure 

bar(tenure','stacked') 

legend('Owner','Renter') 

xticklabels({ 

'Cuba Village' 

'Hinterland' 

}) 

title('Owner vs Renter Households') 

ylabel('Households') 

grid on 

 

tiledlayout(2,2) 

nexttile 

bar(income) 

title('Median Income') 

nexttile 

bar(homeValue) 

title('Home Value') 

nexttile 

bar(vacancyRate) 

title('Vacancy Rate') 

nexttile 

bar(poverty) 

title('Poverty Rate') 

 

villageShare = 8.8; 

hinterlandShare = 91.2; 

figure 

pie([villageShare hinterlandShare]) 

legend('Cuba Village','Outlying Hinterland') 

title('Population Share of ZIP 87013') 
