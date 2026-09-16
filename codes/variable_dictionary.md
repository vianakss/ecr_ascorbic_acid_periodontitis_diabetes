# Variable Dictionary

Data are organized in **long format** (one row per participant per time point), consistent with the mixed-model analysis. Variable names and value codes are reproduced exactly as they appear in the analysis script.

## Structure and identifiers

| Variable | Description | Type / coding | Unit |
|---|---|---|---|
| `id` | Participant identifier (clustering unit in the mixed model) | Numeric | — |
| `code` | Participant code (secondary identifier used in listings and in the `reshape`) | Text / numeric | — |
| `group` | Allocation group | Categorical: 0 = Control, 1 = Test | — |
| `time` | Assessment time point | Categorical: 0 = Baseline, 1 = 60 days (follow-up) | — |
| `group_time` | Group-by-time combination (created for the boxplots) | Categorical: 1 = Control baseline, 2 = Control follow-up, 3 = Test baseline, 4 = Test follow-up | — |

## Table 1 — Descriptive (sample characterization)

| Variable | Description | Type / coding | Unit |
|---|---|---|---|
| `age` | Age | Continuous | years |
| `sex` | Sex | Categorical (Male / Female) | — |
| `education` | Educational level | Categorical (< 9 years / ≥ 9 years) | — |
| `income` | Family income | Categorical (< 5 / ≥ 5 minimum wages) | — |
| `family_hx_diabetes` | Family history of diabetes | Categorical (yes / no) | — |
| `bmi` | Body mass index | Continuous | kg/m² |
| `subging_instr_time` | Subgingival instrumentation time (treatment duration) | Continuous | minutes |
| `endpoint` | Achievement of the primary clinical endpoint (treat-to-target) | Binary categorical (yes / no) | — |

## Table 2 — Mixed model: laboratory parameters

| Variable | Description | Type / coding | Unit |
|---|---|---|---|
| `hba1c` | Glycated hemoglobin (HbA1c) | Continuous | % \* |
| `glucose` | Fasting plasma glucose | Continuous | mg/dL \* |
| `crp` | C-reactive protein | Continuous | mg/L \* |

## Table 3 — Mixed model: periodontal parameters

| Variable | Description | Type / coding | Unit |
|---|---|---|---|
| `plaque` | Plaque index | Continuous | % |
| `pctbop` | Percentage of sites with bleeding on probing | Continuous | % |
| `meanpd` | Mean probing depth | Continuous | mm |
| `meancal` | Mean clinical attachment level | Continuous | mm |
| `pctsite4mm` | Percentage of sites with probing depth of 4 mm | Continuous | % |
| `pctsite5_6mm` | Percentage of sites with probing depth of 5–6 mm | Continuous | % |
| `pctsite7plus` | Percentage of sites with probing depth ≥ 7 mm | Continuous | % |

## Table 4 — Mixed model: salivary parameters

| Variable | Description | Type / coding | Unit |
|---|---|---|---|
| `tnf` | Salivary tumor necrosis factor alpha (TNF-α) concentration | Continuous | pg/mL \* |
| `il6` | Salivary interleukin-6 (IL-6) concentration | Continuous | pg/mL \* |
