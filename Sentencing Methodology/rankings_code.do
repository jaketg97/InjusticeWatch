//Taking in rankings csv created by R-Code, in R Markdown file (mine is saved in my Desktop)
import delimited /Users/jgosselin15/Desktop/rankings.csv
gen counter=1
gen counter_pj=1 if pj=="TRUE"
gen counter_overallabovemedian=1 if above_median=="TRUE"
gen counter_4=1 if class=="4"
gen counter_3=1 if class=="3"
gen counter_2=1 if class=="2"
gen counter_1=1 if class=="1"
gen counter_4pj=1 if class=="4" & pj=="TRUE"
gen counter_3pj=1 if class=="3" & pj=="TRUE"
gen counter_2pj=1 if class=="2" & pj=="TRUE"
gen counter_1pj=1 if class=="1" & pj=="TRUE"
gen counter_4_above=1 if class=="4" & above_median=="TRUE"
gen counter_3_above=1 if class=="3" & above_median=="TRUE"
gen counter_2_above=1 if class=="2" & above_median=="TRUE"
gen counter_1_above=1 if class=="1" & above_median=="TRUE"
collapse (sum) counter (sum) counter_pj (sum) counter_overallabovemedian (sum) counter_4 (sum) counter_4pj (sum) counter_3 (sum) counter_3pj (sum) counter_2 (sum) counter_2pj (sum) counter_1 (sum) counter_1pj (sum) counter_4_above (sum) counter_3_above (sum) counter_2_above (sum) counter_1_above, by(sentence_judge)
drop if counter<1000
keep if sentence_judge=="William T O'Brien"|sentence_judge=="Catherine Marie Haberkorn" |sentence_judge=="Dennis J Porter" |sentence_judge=="Lawrence Edward Flood" |sentence_judge=="Kenneth J Wadas"|sentence_judge=="William H Hooks"|sentence_judge=="Thomas V Gainer"|sentence_judge=="Vincent M Gaughan"|sentence_judge=="Araujo, Mauricio"|sentence_judge=="Byrne, Thomas"|sentence_judge=="Arthur F Hill"|sentence_judge=="Carol M Howard"|sentence_judge=="Timothy Joseph Joyce"|sentence_judge=="James B Linn"|sentence_judge=="Mary Margaret Brosnahan"|sentence_judge=="Michael B McHale"|sentence_judge=="Erica L Reddick"|sentence_judge=="Thomas J Hennelly"|sentence_judge=="Alfredo  Maldonado"|sentence_judge=="Charles P Burns"|sentence_judge=="Matthew E Coghlan"|sentence_judge=="Thaddeus L Wilson"|sentence_judge=="Diane Gordon Cannon"|sentence_judge=="Maura  Slattery Boyle"
gen class4_prisonpercent=counter_4pj/counter_4
gen class3_prisonpercent=counter_3pj/counter_3
gen class2_prisonpercent=counter_2pj/counter_2
gen class1_prisonpercent=counter_1pj/counter_1
gen above_median=counter_overallabovemedian/counter_pj
gen severity_metric=(class4_prisonpercent+above_median)/2
sort severity_metric
export excel using "/Volumes/GoogleDrive/My Drive/Injustice Watch/Slattery-Boyle/overall_rankings.xlsx", firstrow(variables)
