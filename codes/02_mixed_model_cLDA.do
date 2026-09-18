
********************************************************************************
*** cLDA MIXED MODEL ***
********************************************************************************

xtset id time

*------------------------------------------------------------------------------*
capture log close
log using "log_table_mixed_model_laboratory_parameters.log", replace

*** 1. LABORATORY PARAMETERS ***
* 1.1. HBA1C
* 1.1.1. Observed descriptive values
table group time, statistic(count hba1c) statistic(mean hba1c) statistic(sd hba1c)

* 1.1.2. Constrained longitudinal data analysis
mixed hba1c i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 1.1.3. Estimated change in control group
lincom 1.time, small

* 1.1.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 1.1.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 1.1.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_hba1c, replace)

* 1.1.7. Model diagnostics
capture drop fit_hba1c res_hba1c
predict fit_hba1c, fitted
predict res_hba1c, rstandard
scatter res_hba1c fit_hba1c, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - HbA1c", size(medium)) name(resfit_hba1c, replace)
qnorm res_hba1c if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids HbA1c - baseline", size(medium)) name(qnorm_hba1c_t0, replace)
qnorm res_hba1c if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids HbA1c - 60 days", size(medium)) name(qnorm_hba1c_t1, replace)
graph combine qnorm_hba1c_t0 qnorm_hba1c_t1, name(hba1c_resid_panel, replace)
graph export "hba1c_resid_panel.png", name(hba1c_resid_panel) width(3000) replace



* 1.2. FASTING PLASMA GLUCOSE
* 1.2.1. Observed descriptive values
table group time, statistic(count glucose) statistic(mean glucose) statistic(sd glucose)

* 1.2.2. Constrained longitudinal data analysis
mixed glucose i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 1.2.3. Estimated change in control group
lincom 1.time, small

* 1.2.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 1.2.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 1.2.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_glucose, replace)

* 1.2.7. Model diagnostics
capture drop fit_glucose res_glucose
predict fit_glucose, fitted
predict res_glucose, rstandard
scatter res_glucose fit_glucose, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - Glucose", size(medium)) name(resfit_glucose, replace)
qnorm res_glucose if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids glucose - baseline", size(medium)) name(qnorm_glucose_t0, replace)
qnorm res_glucose if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids glucose - 60 days", size(medium)) name(qnorm_glucose_t1, replace)
graph combine qnorm_glucose_t0 qnorm_glucose_t1, name(glucose_resid_panel, replace)
graph export "glucose_resid_panel.png", name(glucose_resid_panel) width(3000) replace


* 1.3. C-REACTIVE PROTEIN
* 1.3.1. Observed descriptive values
table group time, statistic(count crp) statistic(mean crp) statistic(sd crp)

* 1.3.2. Constrained longitudinal data analysis
mixed crp i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 1.3.3. Estimated change in control group
lincom 1.time, small

* 1.3.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 1.3.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 1.3.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_crp, replace)

* 1.3.7. Model diagnostics
capture drop fit_crp res_crp
predict fit_crp, fitted
predict res_crp, rstandard
scatter res_crp fit_crp, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - CRP", size(medium)) name(resfit_crp, replace)
qnorm res_crp if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids CRP - baseline", size(medium)) name(qnorm_crp_t0, replace)
qnorm res_crp if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids CRP - 60 days", size(medium)) name(qnorm_crp_t1, replace)
graph combine qnorm_crp_t0 qnorm_crp_t1, name(crp_resid_panel, replace)
graph export "crp_resid_panel.png", name(crp_resid_panel) width(3000) replace

graph combine resfit_hba1c resfit_glucose resfit_crp, rows(1) name(scatter_laboratory_panel, replace)
graph export "scatter_laboratory_panel.png", name(scatter_laboratory_panel) width(3000) replace

log close



capture log close
log using "log_sensitivity_laboratory_parameters.log", text replace

* NECESSARY SENSITIVITY ANALYSIS DUE TO OUTLIER OBSERVATIONS FOR LABORATORY PARAMETERS
capture postutil clear
tempname results
postfile `results' str12 outcome str28 analysis double estimate se df p lb ub using "sensitivity_laboratory_parameters_results.dta", replace

foreach y in hba1c glucose crp {
    display _newline(2) "============================================================"
    display "OUTCOME: `y'"
    display "============================================================"

    * Primary cLDA with unstructured within-participant covariance
    mixed `y' i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
    lincom 1.group#1.time, small
    post `results' ("`y'") ("Primary_UN") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))

    * Identify participants with at least one absolute standardized residual >= 2
    capture drop r_`y' absr_`y' maxabs_`y' keep_`y'
    predict double r_`y', rstandard
    generate double absr_`y' = abs(r_`y')
    bysort id: egen double maxabs_`y' = max(absr_`y')

    display _newline "Observations with |standardized residual| >= 2"
    list id code group time `y' r_`y' if absr_`y' >= 2, sepby(id) noobs abbreviate(20)

    display _newline "Participant-level maximum absolute residual"
    list id code group maxabs_`y' if time == 0 & maxabs_`y' >= 2, noobs abbreviate(20)

    levelsof id if maxabs_`y' >= 2 & !missing(maxabs_`y'), local(flagged)

    * Leave one flagged participant out at a time
    foreach omit of local flagged {
        quietly mixed `y' i.time 1.group#1.time if id != `omit' || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        quietly lincom 1.group#1.time, small
        post `results' ("`y'") ("Omit_ID_`omit'") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    }

    * Systematic leave-one-participant-out analysis for every participant
    levelsof id, local(allids)
    foreach omit of local allids {
        quietly mixed `y' i.time 1.group#1.time if id != `omit' || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        quietly lincom 1.group#1.time, small
        post `results' ("`y'") ("LOO_ID_`omit'") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    }

    * Exclude all flagged participants together as a diagnostic analysis
    generate byte keep_`y' = 1
    foreach omit of local flagged {
        replace keep_`y' = 0 if id == `omit'
    }
    quietly mixed `y' i.time 1.group#1.time if keep_`y' == 1 || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
    quietly lincom 1.group#1.time, small
    post `results' ("`y'") ("Omit_all_flagged") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))

    * Simpler compound-symmetry covariance through a random intercept
    quietly mixed `y' i.time 1.group#1.time || id:, reml dfmethod(kroger)
    quietly lincom 1.group#1.time, small
    post `results' ("`y'") ("Random_intercept") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))

    * Equivalent baseline-adjusted analysis with HC3 standard errors
    preserve
        keep id code group time `y'
        reshape wide `y', i(id code group) j(time)
        quietly regress `y'1 i.group c.`y'0, vce(hc3)
        quietly lincom 1.group
        post `results' ("`y'") ("ANCOVA_HC3") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    restore
}


* Finalize writing the sensitivity results
postclose `results'

* Display and export the sensitivity results
preserve
use "sensitivity_laboratory_parameters_results.dta", clear
format estimate se lb ub %10.4f
format df %8.2f
format p %8.4f
sort outcome analysis
display _newline(2) "============================================================"
display "SUMMARY OF SENSITIVITY ANALYSES"
display "============================================================"
list outcome analysis estimate se df p lb ub, sepby(outcome) noobs abbreviate(28)
export delimited using "sensitivity_laboratory_parameters_results.csv", replace
restore

log close



*------------------------------------------------------------------------------*
capture log close
log using "log_table_mixed_model_periodontal_parameters.log", replace

*** 2. PERIODONTAL PARAMETERS ***
* 2.1. PLAQUE
* 2.1.1. Observed descriptive values
table group time, statistic(count plaque) statistic(mean plaque) statistic(sd plaque)

* 2.1.2. Constrained longitudinal data analysis
mixed plaque i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.1.3. Estimated change in control group
lincom 1.time, small

* 2.1.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.1.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.1.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_plaque, replace)

* 2.1.7. Model diagnostics
capture drop fit_plaque res_plaque
predict fit_plaque, fitted
predict res_plaque, rstandard
scatter res_plaque fit_plaque, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - plaque index", size(medium)) name(resfit_plaque, replace)
qnorm res_plaque if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids plaque index - baseline", size(medium)) name(qnorm_plaque_t0, replace)
qnorm res_plaque if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids plaque index - 60 days", size(medium)) name(qnorm_plaque_t1, replace)
graph combine qnorm_plaque_t0 qnorm_plaque_t1, name(plaque_resid_panel, replace)
graph export "plaque_resid_panel.png", name(plaque_resid_panel) width(3000) replace





* 2.2. BLEEDING ON PROBING
* 2.2.1. Observed descriptive values
table group time, statistic(count pctbop) statistic(mean pctbop) statistic(sd pctbop)

* 2.2.2. Constrained longitudinal data analysis
mixed pctbop i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.2.3. Estimated change in control group
lincom 1.time, small

* 2.2.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.2.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.2.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_pctbop, replace)

* 2.2.7. Model diagnostics
capture drop fit_pctbop res_pctbop
predict fit_pctbop, fitted
predict res_pctbop, rstandard
scatter res_pctbop fit_pctbop, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - BoP", size(medium)) name(resfit_bop, replace)
qnorm res_pctbop if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids BoP - baseline", size(medium)) name(qnorm_bop_t0, replace)
qnorm res_pctbop if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids BoP - 60 days", size(medium)) name(qnorm_bop_t1, replace)
graph combine qnorm_bop_t0 qnorm_bop_t1, name(bop_resid_panel, replace)
graph export "bop_resid_panel.png", name(bop_resid_panel) width(3000) replace



* 2.3. MEAN PROBING DEPTH
* 2.3.1. Observed descriptive values
table group time, statistic(count meanpd) statistic(mean meanpd) statistic(sd meanpd)

* 2.3.2. Constrained longitudinal data analysis
mixed meanpd i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.3.3. Estimated change in control group
lincom 1.time, small

* 2.3.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.3.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.3.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_meanpd, replace)

* 2.3.7. Model diagnostics
capture drop fit_meanpd res_meanpd
predict fit_meanpd, fitted
predict res_meanpd, rstandard
scatter res_meanpd fit_meanpd, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - PPD", size(medium)) name(resfit_pd, replace)
qnorm res_meanpd if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids PPD - baseline", size(medium)) name(qnorm_pd_t0, replace)
qnorm res_meanpd if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids PPD - 60 days", size(medium)) name(qnorm_pd_t1, replace)
graph combine qnorm_pd_t0 qnorm_pd_t1, name(pd_resid_panel, replace)
graph export "pd_resid_panel.png", name(pd_resid_panel) width(3000) replace



* 2.4. MEAN CLINICAL ATTACHMENT LEVEL
* 2.4.1. Observed descriptive values
table group time, statistic(count meancal) statistic(mean meancal) statistic(sd meancal)

* 2.4.2. Constrained longitudinal data analysis
mixed meancal i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.4.3. Estimated change in control group
lincom 1.time, small

* 2.4.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.4.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.4.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_meancal, replace)

* 2.4.7. Model diagnostics
capture drop fit_meancal res_meancal
predict fit_meancal, fitted
predict res_meancal, rstandard
scatter res_meancal fit_meancal, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - CAL", size(medium)) name(resfit_cal, replace)
qnorm res_meancal if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids CAL - baseline", size(medium)) name(qnorm_cal_t0, replace)
qnorm res_meancal if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids CAL - 60 days", size(medium)) name(qnorm_cal_t1, replace)
graph combine qnorm_cal_t0 qnorm_cal_t1, name(cal_resid_panel, replace)
graph export "cal_resid_panel.png", name(cal_resid_panel) width(3000) replace


* 2.5. SITES 4 MM
* 2.5.1. Observed descriptive values
table group time, statistic(count pctsite4mm) statistic(mean pctsite4mm) statistic(sd pctsite4mm)

* 2.5.2. Constrained longitudinal data analysis
mixed pctsite4mm i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.5.3. Estimated change in control group
lincom 1.time, small

* 2.5.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.5.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.5.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_pctsite4mm, replace)

* 2.5.7. Model diagnostics
capture drop fit_pctsite4mm res_pctsite4mm
predict fit_pctsite4mm, fitted
predict res_pctsite4mm, rstandard
scatter res_pctsite4mm fit_pctsite4mm, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - Sites 4 mm (%)", size(medium)) name(resfit_pctsite4mm, replace)
qnorm res_pctsite4mm if time==0,  mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids sites 4 mm (%) - baseline", size(medium)) name(qnorm_pctsite4mm_t0, replace)
qnorm res_pctsite4mm if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids sites 4 mm (%) - 60 days", size(medium)) name(qnorm_pctsite4mm_t1, replace)
graph combine qnorm_pctsite4mm_t0 qnorm_pctsite4mm_t1, name(pctsite4mm_resid_panel, replace)
graph export "pctsite4mm_resid_panel.png", name(pctsite4mm_resid_panel) width(3000) replace



* 2.6. SITES 5-6 MM
* 2.6.1. Observed descriptive values
table group time, statistic(count pctsite5_6mm) statistic(mean pctsite5_6mm) statistic(sd pctsite5_6mm)

* 2.6.2. Constrained longitudinal data analysis
mixed pctsite5_6mm i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.6.3. Estimated change in control group
lincom 1.time, small

* 2.6.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.6.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.6.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_pctsite5_6mm, replace)

* 2.6.7. Model diagnostics
capture drop fit_pctsite5_6mm res_pctsite5_6mm
predict fit_pctsite5_6mm, fitted
predict res_pctsite5_6mm, rstandard
scatter res_pctsite5_6mm fit_pctsite5_6mm, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - Sites 5-6 mm (%)", size(medium)) name(resfit_pctsite5_6mm, replace)
qnorm res_pctsite5_6mm if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids sites 5-6 mm (%) - baseline", size(medium)) name(qnorm_pctsite5_6mm_t0, replace)
qnorm res_pctsite5_6mm if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids sites 5-6 mm (%) - 60 days", size(medium)) name(qnorm_pctsite5_6mm_t1, replace)
graph combine qnorm_pctsite5_6mm_t0 qnorm_pctsite5_6mm_t1, name(pctsite5_6mm_resid_panel, replace)
graph export "pctsite5_6mm_resid_panel.png", name(pctsite5_6mm_resid_panel) width(3000) replace


* 2.7. SITES 7 MM OR MORE
* 2.7.1. Observed descriptive values
table group time, statistic(count pctsite7plus) statistic(mean pctsite7plus) statistic(sd pctsite7plus)

* 2.7.2. Constrained longitudinal data analysis
mixed pctsite7plus i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 2.7.3. Estimated change in control group
lincom 1.time, small

* 2.7.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 2.7.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 2.7.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_pctsite7plus, replace)

* 2.7.7. Model diagnostics
capture drop fit_pctsite7plus res_pctsite7plus
predict fit_pctsite7plus, fitted
predict res_pctsite7plus, rstandard
scatter res_pctsite7plus fit_pctsite7plus, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - Sites >=7 mm (%)", size(medium)) name(resfit_pctsite7plus, replace)
qnorm res_pctsite7plus if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids sites >=7 mm (%) - baseline", size(medium)) name(qnorm_pctsite7plus_t0, replace)
qnorm res_pctsite7plus if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids sites >=7 mm (%) - 60 days", size(medium)) name(qnorm_pctsite7plus_t1, replace)
graph combine qnorm_pctsite7plus_t0 qnorm_pctsite7plus_t1, name(pctsite7plus_resid_panel, replace)
graph export "pctsite7plus_resid_panel.png", name(pctsite7plus_resid_panel) width(3000) replace


graph combine resfit_plaque resfit_bop resfit_pd resfit_cal resfit_pctsite4mm resfit_pctsite5_6mm resfit_pctsite7plus, rows(2) name(scatter_periodontal_panel, replace)
graph export "scatter_periodontal_panel.png", name(scatter_periodontal_panel) width(3000) replace

log close



capture log close
log using "sensitivity_periodontal_parameters.log", replace text

* NECESSARY SENSITIVITY ANALYSIS DUE TO OUTLIER OBSERVATIONS ON PERIODONTAL PARAMETERS
set more off
capture postutil clear

tempname results
postfile `results' str16 outcome str28 analysis double estimate se df p lb ub using "sensitivity_periodontal_parameters_results.dta", replace

foreach y in plaque pctbop meanpd meancal pctsite4mm pctsite5_6mm pctsite7plus {

    display _newline(2) "============================================================"
    display "OUTCOME: `y'"
    display "============================================================"

    * 1. Primary cLDA with unstructured covariance

    mixed `y' i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
    lincom 1.group#1.time, small
    post `results' ("`y'") ("Primary_UN") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))

    * Identify participants with |standardized residual| >= 2

    capture drop r_`y' absr_`y' maxabs_`y' keep_`y'
    predict double r_`y', rstandard
    generate double absr_`y' = abs(r_`y')
    bysort id: egen double maxabs_`y' = max(absr_`y')

    display _newline "Observations with |standardized residual| >= 2"
    list id code group time `y' r_`y' if absr_`y' >= 2 & !missing(absr_`y'), sepby(id) noobs abbreviate(20)

    display _newline "Participant-level maximum absolute residual"
    list id code group maxabs_`y' if time == 0 & maxabs_`y' >= 2 & !missing(maxabs_`y'), noobs abbreviate(20)

    local flagged ""
    quietly count if maxabs_`y' >= 2 & !missing(maxabs_`y')

    if r(N) > 0 {
        quietly levelsof id if maxabs_`y' >= 2 & !missing(maxabs_`y'), local(flagged)
    }
    else {
        display "No participants were flagged for `y'."
    }

    * 2. Exclude each flagged participant individually

    foreach omit of local flagged {

        capture quietly mixed `y' i.time 1.group#1.time if id != `omit' || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        local rc = _rc

        if `rc' == 0 {
            capture quietly lincom 1.group#1.time, small
            local rc = _rc
        }

        if `rc' == 0 {
            post `results' ("`y'") ("Omit_ID_`omit'") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
        }
        else {
            display as error "FAILED: `y' / Omit_ID_`omit' (return code `rc')"
            post `results' ("`y'") ("Omit_ID_`omit'") (.) (.) (.) (.) (.) (.)
        }
    }

    * 3. Systematic leave-one-participant-out analysis

    quietly levelsof id, local(allids)

    foreach omit of local allids {

        capture quietly mixed `y' i.time 1.group#1.time if id != `omit' || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        local rc = _rc

        if `rc' == 0 {
            capture quietly lincom 1.group#1.time, small
            local rc = _rc
        }

        if `rc' == 0 {
            post `results' ("`y'") ("LOO_ID_`omit'") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
        }
        else {
            display as error "FAILED: `y' / LOO_ID_`omit' (return code `rc')"
            post `results' ("`y'") ("LOO_ID_`omit'") (.) (.) (.) (.) (.) (.)
        }
    }

    * 4. Exclude all flagged participants together

    if "`flagged'" != "" {

        generate byte keep_`y' = 1

        foreach omit of local flagged {
            replace keep_`y' = 0 if id == `omit'
        }

        capture quietly mixed `y' i.time 1.group#1.time if keep_`y' == 1 || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        local rc = _rc

        if `rc' == 0 {
            capture quietly lincom 1.group#1.time, small
            local rc = _rc
        }

        if `rc' == 0 {
            post `results' ("`y'") ("Omit_all_flagged") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
        }
        else {
            display as error "FAILED: `y' / Omit_all_flagged (return code `rc')"
            post `results' ("`y'") ("Omit_all_flagged") (.) (.) (.) (.) (.) (.)
        }
    }
    else {
        display "Omit_all_flagged not applicable for `y'."
    }

    * 5. Alternative covariance structure: random intercept

    capture quietly mixed `y' i.time 1.group#1.time || id:, reml dfmethod(kroger)
    local rc = _rc

    if `rc' == 0 {
        capture quietly lincom 1.group#1.time, small
        local rc = _rc
    }

    if `rc' == 0 {
        post `results' ("`y'") ("Random_intercept") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    }
    else {
        display as error "FAILED: `y' / Random_intercept (return code `rc')"
        post `results' ("`y'") ("Random_intercept") (.) (.) (.) (.) (.) (.)
    }

    * 6. Baseline-adjusted ANCOVA with HC3 standard errors

    preserve
    keep id code group time `y'
    reshape wide `y', i(id code group) j(time)
    capture quietly regress `y'1 i.group c.`y'0, vce(hc3)
    local rc = _rc

    if `rc' == 0 {
        capture quietly lincom 1.group
        local rc = _rc
    }

    if `rc' == 0 {
        post `results' ("`y'") ("ANCOVA_HC3") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    }
    else {
        display as error "FAILED: `y' / ANCOVA_HC3 (return code `rc')"
        post `results' ("`y'") ("ANCOVA_HC3") (.) (.) (.) (.) (.) (.)
    }

    restore

    * Remove variables created only for diagnostics

    capture drop r_`y' absr_`y' maxabs_`y' keep_`y'
}

* Finalize the results file

postclose `results'

* Display and export the collected results

preserve
use "sensitivity_periodontal_parameters_results.dta", clear
format estimate se lb ub %10.4f
format df %8.2f
format p %8.4f
sort outcome analysis

display _newline(2) "============================================================"
display "SUMMARY OF PERIODONTAL SENSITIVITY ANALYSES"
display "============================================================"

list outcome analysis estimate se df p lb ub, sepby(outcome) noobs abbreviate(28)
export delimited using "sensitivity_periodontal_parameters_results.csv", replace

restore
log close





*------------------------------------------------------------------------------*
capture log close
log using "log_table_mixed_model_salivary_parameters.log", replace

*** 3. SALIVARY PARAMETERS ***
* 3.1. TNF-ALPHA
* 3.1.1. Observed descriptive values
table group time, statistic(count tnf) statistic(mean tnf) statistic(sd tnf)

* 3.1.2. Constrained longitudinal data analysis
mixed tnf i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 3.1.3. Estimated change in control group
lincom 1.time, small

* 3.1.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 3.1.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 3.1.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_tnf, replace)

* 3.1.7. Model diagnostics
capture drop fit_tnf res_tnf
predict fit_tnf, fitted
predict res_tnf, rstandard
scatter res_tnf fit_tnf, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - TNF-α", size(medium)) name(resfit_tnf, replace)
qnorm res_tnf if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids TNF-α - baseline", size(medium)) name(qnorm_tnf_t0, replace)
qnorm res_tnf if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids TNF-α - 60 days", size(medium)) name(qnorm_tnf_t1, replace)
graph combine qnorm_tnf_t0 qnorm_tnf_t1, name(tnf_resid_panel, replace)
graph export "tnf_resid_panel.png", name(tnf_resid_panel) width(3000) replace



* 3.2. IL-6
* 3.2.1. Observed descriptive values
table group time, statistic(count il6) statistic(mean il6) statistic(sd il6)

* 3.2.2. Constrained longitudinal data analysis
mixed il6 i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)

* 3.2.3. Estimated change in control group
lincom 1.time, small

* 3.2.4. Estimated change in test group
lincom 1.time + 1.group#1.time, small

* 3.2.5. Estimated treatment effect: Test - Control
lincom 1.group#1.time, small

* 3.2.6. Model-estimated means and profile
margins group#time
marginsplot, plot1opts(lcolor("#384358") mcolor("#384358")) plot2opts(lcolor("#541A2E") mcolor("#541A2E")) ci1opts(lcolor("#384358")) ci2opts(lcolor("#541A2E")) graphregion(color(white)) plotregion(color(white)) name(margins_il6, replace)

* 3.2.7. Model diagnostics
capture drop fit_il6 res_il6
predict fit_il6, fitted
predict res_il6, rstandard
scatter res_il6 fit_il6, mcolor("#5B6E8C") msize(medsmall) yline(0, lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Scatter plot - IL-6", size(medium)) name(resfit_il6, replace)
qnorm res_il6 if time==0, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids IL-6 - baseline", size(medium)) name(qnorm_il6_t0, replace)
qnorm res_il6 if time==1, mcolor("#5B6E8C") rlopts(lcolor("#541A2E") lwidth(medthick)) graphregion(color(white)) plotregion(color(white)) title("Resids IL-6 - 60 days", size(medium)) name(qnorm_il6_t1, replace)
graph combine qnorm_il6_t0 qnorm_il6_t1, name(il6_resid_panel, replace)
graph export "il6_resid_panel.png", name(il6_resid_panel) width(3000) replace


graph combine resfit_tnf resfit_il6, rows(1) name(scatter_salivary_panel, replace)
graph export "scatter_salivary_panel.png", name(scatter_salivary_panel) width(3000) replace



log close



capture log close
log using "log_sensitivity_salivary_parameters.log", replace text

* NECESSARY SENSITIVITY ANALYSIS DUE TO OUTLIER OBSERVATIONS FOR SALIVARY PARAMETERS
set more off
capture postutil clear

tempname results
postfile `results' str16 outcome str28 analysis double estimate se df p lb ub using "sensitivity_salivary_parameters_results.dta", replace

foreach y in tnf il6 {

    display _newline(2) "============================================================"
    display "OUTCOME: `y'"
    display "============================================================"

    * 1. Primary cLDA with unstructured covariance

    mixed `y' i.time 1.group#1.time || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
    generate byte sample_`y' = e(sample)
    lincom 1.group#1.time, small
    post `results' ("`y'") ("Primary_UN") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))

    * Identify participants with |standardized residual| >= 2

    capture drop r_`y' absr_`y' maxabs_`y' keep_`y'
    predict double r_`y', rstandard
    generate double absr_`y' = abs(r_`y')
    bysort id: egen double maxabs_`y' = max(absr_`y')

    display _newline "Observations with |standardized residual| >= 2"
    list id code group time `y' r_`y' if sample_`y' == 1 & absr_`y' >= 2 & !missing(absr_`y'), sepby(id) noobs abbreviate(20)

    display _newline "Participant-level maximum absolute residual"
    list id code group maxabs_`y' if sample_`y' == 1 & time == 0 & maxabs_`y' >= 2 & !missing(maxabs_`y'), noobs abbreviate(20)

    local flagged ""
    quietly count if sample_`y' == 1 & maxabs_`y' >= 2 & !missing(maxabs_`y')

    if r(N) > 0 {
        quietly levelsof id if sample_`y' == 1 & maxabs_`y' >= 2 & !missing(maxabs_`y'), local(flagged)
    }
    else {
        display "No participants were flagged for `y'."
    }

    * 2. Exclude each flagged participant individually

    foreach omit of local flagged {

        capture quietly mixed `y' i.time 1.group#1.time if id != `omit' || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        local rc = _rc

        if `rc' == 0 {
            capture quietly lincom 1.group#1.time, small
            local rc = _rc
        }

        if `rc' == 0 {
            post `results' ("`y'") ("Omit_ID_`omit'") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
        }
        else {
            display as error "FAILED: `y' / Omit_ID_`omit' (return code `rc')"
            post `results' ("`y'") ("Omit_ID_`omit'") (.) (.) (.) (.) (.) (.)
        }
    }

    * 3. Systematic leave-one-participant-out analysis among analyzed participants

    quietly levelsof id if sample_`y' == 1, local(allids)

    foreach omit of local allids {

        capture quietly mixed `y' i.time 1.group#1.time if id != `omit' || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        local rc = _rc

        if `rc' == 0 {
            capture quietly lincom 1.group#1.time, small
            local rc = _rc
        }

        if `rc' == 0 {
            post `results' ("`y'") ("LOO_ID_`omit'") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
        }
        else {
            display as error "FAILED: `y' / LOO_ID_`omit' (return code `rc')"
            post `results' ("`y'") ("LOO_ID_`omit'") (.) (.) (.) (.) (.) (.)
        }
    }

    * 4. Exclude all flagged participants together

    if "`flagged'" != "" {

        generate byte keep_`y' = sample_`y'

        foreach omit of local flagged {
            replace keep_`y' = 0 if id == `omit'
        }

        capture quietly mixed `y' i.time 1.group#1.time if keep_`y' == 1 || id:, nocons residuals(unstructured, t(time)) reml dfmethod(kroger)
        local rc = _rc

        if `rc' == 0 {
            capture quietly lincom 1.group#1.time, small
            local rc = _rc
        }

        if `rc' == 0 {
            post `results' ("`y'") ("Omit_all_flagged") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
        }
        else {
            display as error "FAILED: `y' / Omit_all_flagged (return code `rc')"
            post `results' ("`y'") ("Omit_all_flagged") (.) (.) (.) (.) (.) (.)
        }
    }
    else {
        display "Omit_all_flagged not applicable for `y'."
    }

    * 5. Alternative covariance structure: random intercept

    capture quietly mixed `y' i.time 1.group#1.time || id:, reml dfmethod(kroger)
    local rc = _rc

    if `rc' == 0 {
        capture quietly lincom 1.group#1.time, small
        local rc = _rc
    }

    if `rc' == 0 {
        post `results' ("`y'") ("Random_intercept") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    }
    else {
        display as error "FAILED: `y' / Random_intercept (return code `rc')"
        post `results' ("`y'") ("Random_intercept") (.) (.) (.) (.) (.) (.)
    }

    * 6. Baseline-adjusted ANCOVA with HC3 standard errors

    preserve
    keep id code group time `y'
    reshape wide `y', i(id code group) j(time)
    keep if !missing(`y'0) & !missing(`y'1)
    capture quietly regress `y'1 i.group c.`y'0, vce(hc3)
    local rc = _rc

    if `rc' == 0 {
        capture quietly lincom 1.group
        local rc = _rc
    }

    if `rc' == 0 {
        post `results' ("`y'") ("ANCOVA_HC3") (r(estimate)) (r(se)) (r(df)) (r(p)) (r(lb)) (r(ub))
    }
    else {
        display as error "FAILED: `y' / ANCOVA_HC3 (return code `rc')"
        post `results' ("`y'") ("ANCOVA_HC3") (.) (.) (.) (.) (.) (.)
    }

    restore

    * Remove variables created only for diagnostics

    capture drop r_`y' absr_`y' maxabs_`y' keep_`y' sample_`y'
}

* Finalize the results file

postclose `results'

* Display and export the collected results

preserve
use "sensitivity_salivary_parameters_results.dta", clear
format estimate se lb ub %10.4f
format df %8.2f
format p %8.4f
sort outcome analysis

display _newline(2) "============================================================"
display "SUMMARY OF SALIVARY SENSITIVITY ANALYSES"
display "============================================================"

list outcome analysis estimate se df p lb ub, sepby(outcome) noobs abbreviate(28)
export delimited using "sensitivity_salivary_parameters_results.csv", replace

restore

log close
