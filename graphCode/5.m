T = readtable(**uba_NM_Housing_Dataset_Catalog(5_**ysical_Stock_Sources)(in).csv'); 

** 

 

housingData = [ 

53.5 77.2 **.2 69.8; 

5.6 4.3 7.4 14.9; 

40.9 1**5 11.4 15.3 

]; 

figure 

bar(housin**ata') 

title('Housing Structure Ty**s') 

ylabel('Percent') 

legend('Sin**e Family','Multi Family','Manufac**red Housing') 

xticklabels({'Cuba **llage','ZIP 87013','Sandoval Coun**','New Mexico'}) 

grid on 

 

manufactured = [40.9 18.5 11.4 **.3]; 

figure 

bar(manufactured) 

ti**e('Manufactured Housing Share') 

y**bel('Percent') 

xticklabels({'Cuba**illage','ZIP 87013','Sandoval Cou**y','New Mexico'}) 

grid on 

 

singleFamily = [53.5 77.2 81.**69.8]; 

figure 

bar(singleFamily) 

**tle('Single Family Detached Housi**') 

ylabel('Percent') 

xticklabels(**Cuba Village','ZIP 87013','Sandov** County','New Mexico'}) 

grid on 

`** 

 

multiFamily = [5.6 4.3 7** 14.9]; 

figure 

bar(multiFamily) 

**tle('Multi-Family Housing Share')**label('Percent') 

xticklabels({'Cu** Village','ZIP 87013','Sandoval C**nty','New Mexico'}) 

grid on 

 

valueData = [ 

35 57 7**5; 

27 23 7 17; 

13 8 19 23; 

25 12 ** 45 

]; 

figure 

bar(valueData','st**ked') 

title('Owner Occupied Home**alue Distribution') 

ylabel('Perc**t') 

legend({'Under $100K',... 

  **	'
100𝐾−
100
K
−
 
199K',... 

    	'
2∗∗𝐾−
2
∗
∗
K
−
 
299K',... 

    	'$300K+'}) 

**icklabels({'Cuba Village',... 

   **    	'ZIP 87013',... 

     	**  'Sandoval County',... 

     	**  'New Mexico'}) 

grid on 

 

yearBuilt = [1976 1984 1999 1985]; 

fig**e 

bar(yearBuilt) 

title('Median Y**r Housing Structure Built') 

ylab**('Year Built') 

xticklabels({'Cub**Village',... 

         	'ZIP 87**3',... 

         	'Sandoval County',... 

         	'New Mexico'}) 

grid on 

 

cubaHousing = [53.5 5.6 40.9]; 

figure 

pie(cubaHousing) 

legend('Single Family',... 

   	'Multi Family',... 

   	'Manufactured Housing') 

title('Cuba Village Housing Composition') 

 

compareHousing = [ 

53.5 81.2; 

40.9 11.4 

]; 

figure 

bar(compareHousing) 

legend('Cuba Village','Sandoval County') 

xticklabels({'Single Family','Manufactured Housing'}) 

title('Housing Stock Comparison') 

ylabel('Percent') 

grid on 

 

tiledlayout(2,2) 

nexttile 

bar(manufactured) 

title('Manufactured Housing') 

nexttile 

bar(yearBuilt) 

title('Median Year Built') 

nexttile 

bar(singleFamily) 

title('Single Family Share') 

nexttile 

bar(multiFamily) 

title('Multi Family Share') 

 
