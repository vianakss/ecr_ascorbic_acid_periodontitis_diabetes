********************************************************************************
 *** Descriptive analysis ***
********************************************************************************
capture log close
log using "table1_sample_characteristics.log", text replace

preserve

* Retain one observation per participant
keep if time == 0
isid id
assert _N == 21
assert inlist(group, 0, 1) if !missing(group)

* 1. AGE 
table group, statistic(count age) statistic(mean age) statistic(sd age)
ttest age, by(group)

* 2. SEX 
tabulate sex group, column exact

* 3. EDUCATION 
tabulate education group, column exact

* 4. FAMILY INCOME 
tabulate income group, column exact

* 5. FAMILY HISTORY OF DIABETES 
tabulate family_hx_diabetes group, column exact

* 6. BODY MASS INDEX 
table group, statistic(count bmi) statistic(mean bmi) statistic(sd bmi)
ttest bmi, by(group)

* 7. SUBGINGIVAL INSTRUMENTATION TIME 
table group, statistic(count subging_instr_time) statistic(mean subging_instr_time) statistic(sd subging_instr_time) statistic(p25 subging_instr_time) statistic(median subging_instr_time) statistic(p75 subging_instr_time)
ranksum subging_instr_time, by(group)

* 8. PRIMARY ENDPOINT 
tabulate endpoint group, column exact

restore

log close




capture log close
log using "median_iqr_mixed_model_tables.log", text replace

* 1. LABORATORY PARAMETERS 
* 1.1. HbA1c
table group time, statistic(count hba1c) statistic(p25 hba1c) statistic(median hba1c) statistic(p75 hba1c)

* 1.2. Fasting plasma glucose
table group time, statistic(count glucose) statistic(p25 glucose) statistic(median glucose) statistic(p75 glucose)

* 1.3. C-reactive protein
table group time, statistic(count crp) statistic(p25 crp) statistic(median crp) statistic(p75 crp)



* 2. PERIODONTAL PARAMETERS 
* 2.1. Plaque
table group time, statistic(count plaque) statistic(p25 plaque) statistic(median plaque) statistic(p75 plaque)

* 2.2. Bleeding on probing
table group time, statistic(count pctbop) statistic(p25 pctbop) statistic(median pctbop) statistic(p75 pctbop)

* 2.3. Mean probing depth
table group time, statistic(count meanpd) statistic(p25 meanpd) statistic(median meanpd) statistic(p75 meanpd)

* 2.4. Mean clinical attachment level
table group time, statistic(count meancal) statistic(p25 meancal) statistic(median meancal) statistic(p75 meancal)

* 2.5. Sites with 4 mm
table group time, statistic(count pctsite4mm) statistic(p25 pctsite4mm) statistic(median pctsite4mm) statistic(p75 pctsite4mm)

* 2.6. Sites with 5-6 mm
table group time, statistic(count pctsite5_6mm) statistic(p25 pctsite5_6mm) statistic(median pctsite5_6mm) statistic(p75 pctsite5_6mm)

* 2.7. Sites with 7 mm or more
table group time, statistic(count pctsite7plus) statistic(p25 pctsite7plus) statistic(median pctsite7plus) statistic(p75 pctsite7plus)



* 3. SALIVARY PARAMETERS 
* 3.1. TNF
table group time, statistic(count tnf) statistic(p25 tnf) statistic(median tnf) statistic(p75 tnf)

* 3.2. IL-6
table group time, statistic(count il6) statistic(p25 il6) statistic(median il6) statistic(p75 il6)

log close


* 4. Boxplots

preserve

* Create the four group-time combinations

capture drop group_time
gen byte group_time = .
replace group_time = 1 if group == 0 & time == 0
replace group_time = 2 if group == 0 & time == 1
replace group_time = 3 if group == 1 & time == 0
replace group_time = 4 if group == 1 & time == 1

label define group_time_label 1 "Control baseline" 2 "Control follow-up" 3 "Test baseline" 4 "Test follow-up", replace
label values group_time group_time_label

*** LEGEND-ONLY GRAPH ***

twoway (scatteri 1 1, msymbol(square) mcolor("#161E2F") msize(large)) (scatteri 1 1, msymbol(square) mcolor("#384358") msize(large)) (scatteri 1 1, msymbol(square) mcolor("#B51A2B") msize(large)) (scatteri 1 1, msymbol(square) mcolor("#541A2E") msize(large)), legend(order(1 "Control baseline" 2 "Control follow-up" 3 "Test baseline" 4 "Test follow-up") rows(4) size(small) region(lcolor(none) fcolor(white))) ylabel(none) xlabel(none) yscale(off) xscale(off) title("") graphregion(color(white)) plotregion(color(white)) name(legend_boxplots, replace)

*** 1. LABORATORY PARAMETERS ***

graph box hba1c, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("HbA1c", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_hba1c, replace)

graph box glucose, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Fasting plasma glucose", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_glucose, replace)

graph box crp, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("C-reactive protein", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_crp, replace)

grc1leg2 box_hba1c box_glucose box_crp legend_boxplots, cols(3) xsize(11) ysize(4.5) legendfrom(legend_boxplots) hidelegendfrom pos(6) imargin(tiny) title("Laboratory parameters", color("#161E2F") size(medium)) note("Boxes represent the median and interquartile range.", color("#242F49") size(vsmall)) graphregion(color(white)) name(boxplots_laboratory, replace)

graph export "boxplots_laboratory.png", name(boxplots_laboratory) width(3600) replace

*** 2. PERIODONTAL PARAMETERS ***

graph box plaque, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Plaque", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_plaque, replace)

graph box pctbop, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Bleeding on probing", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_bop, replace)

graph box meanpd, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Mean probing depth", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_meanpd, replace)

graph box meancal, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Mean clinical attachment level", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_meancal, replace)

graph box pctsite4mm, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Sites with PPD 4 mm", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_site4, replace)

graph box pctsite5_6mm, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Sites with PPD 5-6 mm", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_site5, replace)

graph box pctsite7plus, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("Sites with PPD >= 7 mm", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_site7, replace)

grc1leg2 box_plaque box_bop box_meanpd box_meancal box_site4 box_site5 box_site7 legend_boxplots, cols(2) xsize(10) ysize(9) legendfrom(legend_boxplots) hidelegendfrom pos(4) imargin(tiny) title("", color("#161E2F") size(medium))  name(boxplots_periodontal, replace)

graph export "boxplots_periodontal.png", name(boxplots_periodontal) width(3600) replace

*** 3. SALIVARY PARAMETERS ***

graph box tnf, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("TNF-alpha", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_tnf, replace)

graph box il6, over(group_time, label(labsize(vsmall) labcolor("#242F49"))) asyvars box(1, fcolor("#161E2F") lcolor("#242F49")) box(2, fcolor("#384358") lcolor("#242F49")) box(3, fcolor("#B51A2B") lcolor("#242F49")) box(4, fcolor("#541A2E") lcolor("#242F49")) marker(1, mcolor("#161E2F") msize(vsmall)) marker(2, mcolor("#384358") msize(vsmall)) marker(3, mcolor("#B51A2B") msize(vsmall)) marker(4, mcolor("#541A2E") msize(vsmall)) title("IL-6", color("#161E2F") size(medsmall)) ytitle("") ylabel(, angle(horizontal) labsize(small) labcolor("#242F49") nogrid) legend(off) graphregion(color(white)) plotregion(color(white) lcolor("#242F49")) scheme(s1color) name(box_il6, replace)

grc1leg2 box_tnf box_il6 legend_boxplots, cols(2) xsize(8) ysize(4.5) legendfrom(legend_boxplots) hidelegendfrom pos(6) imargin(tiny) title("Salivary parameters", color("#161E2F") size(medium)) note("Boxes represent the median and interquartile range.", color("#242F49") size(vsmall)) graphregion(color(white)) name(boxplots_salivary, replace)

graph export "boxplots_salivary.png", name(boxplots_salivary) width(3000) replace

restore




