housingData = [
53.5 77.2 81.2 69.8;
5.6 4.3 7.4 14.9;
40.9 18.5 11.4 15.3
];
figure
bar(housingData')
title('Housing Structure Types')
ylabel('Percent')
legend('Single Family','Multi Family','Manufactured Housing')
xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'})
grid on

manufactured = [40.9 18.5 11.4 15.3];
figure
bar(manufactured)
title('Manufactured Housing Share')
ylabel('Percent')
xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'})
grid on

singleFamily = [53.5 77.2 81.2 69.8];
figure
bar(singleFamily)
title('Single Family Detached Housing')
ylabel('Percent')
xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'})
grid on

multiFamily = [5.6 4.3 7.4 14.9];
figure
bar(multiFamily)
title('Multi-Family Housing Share')
ylabel('Percent')
xticklabels({'Cuba Village','ZIP 87013','Sandoval County','New Mexico'})
grid on

valueData = [
35 57 7 15;
27 23 7 17;
13 8 19 23;
25 12 67 45
];
figure
bar(valueData','stacked')
title('Owner Occupied Home Value Distribution')
ylabel('Percent')
legend({'Under $100K',...
        '$100K-$199K',...
        '$200K-$299K',...
        '$300K+'})
xticklabels({'Cuba Village',...
             'ZIP 87013',...
             'Sandoval County',...
             'New Mexico'})
grid on

yearBuilt = [1976 1984 1999 1985];
figure
bar(yearBuilt)
title('Median Year Housing Structure Built')
ylabel('Year Built')
xticklabels({'Cuba Village',...
             'ZIP 87013',...
             'Sandoval County',...
             'New Mexico'})
grid on

cubaHousing = [53.5 5.6 40.9];
figure
pie(cubaHousing)
legend('Single Family',...
       'Multi Family',...
