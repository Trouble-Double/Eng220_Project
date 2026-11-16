# Eng220_Project
# Cuba, NM Housing Dashboard

An interactive Streamlit dashboard comparing housing conditions in **Cuba Village, New Mexico** with ZIP 87013, Sandoval County and the state of New Mexico. Built for ENG 220.

**Live app:** [add your Streamlit link here](https://your-app-name.streamlit.app)

## What it shows

The dashboard has five tabs, one for each dataset in the Cuba NM Housing Dataset Catalog:

| Tab | Focus |
|-----|-------|
| 1. Executive Dashboard | Headline income, occupancy, cost burden and price-to-income comparisons |
| 2. Longitudinal Change | How Cuba Village and ZIP 87013 changed between 2015-2019 and 2020-2024 |
| 3. Village vs Hinterland | Cuba Village compared with the rest of ZIP 87013 |
| 4. Cross-Geo Benchmark | Housing, income, rent and cost indicators across four geographies, plus reliability (CV and standard error) |
| 5. Physical Housing Stock | Structure types, manufactured housing, home values and year built |

Each tab opens with a row of key metrics, followed by interactive Plotly charts (hover, zoom and download as image).

## Project background

The charts were first written in MATLAB (separate `bar`, `pie` and `errorbar` figures for each dataset). This project converts them into one Streamlit app so everything can be viewed in a single web page.

## Run it locally

1. Clone the repo:
   ```bash
   git clone https://github.com/Trouble-Double/Eng220_Project.git
   cd Eng220_Project
   ```
2. Install the packages:
   ```bash
   python -m pip install -r requirements.txt
   ```
3. Start the app:
   ```bash
   python -m streamlit run streamlit_app.py
   ```
4. Open the link shown in the terminal (usually http://localhost:8501).

## Tech used

- [Streamlit](https://streamlit.io/) for the web app and tabs
- [Plotly](https://plotly.com/python/) for the interactive charts
- [pandas](https://pandas.pydata.org/) for the data tables
- MATLAB for the original charts

## Data notes

- Values were taken from the project's MATLAB scripts and the Cuba NM Housing Dataset Catalog spreadsheet, which draws on American Community Survey (ACS) estimates.
- Cuba Village is a very small community, so many of its estimates have large margins of error. Dataset 4 shows this with coefficient of variation (CV) and standard error charts, and a CV above 30% generally means the estimate is unreliable.
- Some dataset 5 values were reconstructed from other lines of the same source because part of the script was corrupted. The Sandoval County home-value figures (7% under $100K and 67% for $300K+) were inferred so the column totals 100%, and should be checked against the spreadsheet.
- Both Cuba Village and ZIP 87013 show the same 2015-2019 median household income ($31,649) in dataset 2, which may be a copy error in the source.

## Repository contents

- `streamlit_app.py`: the dashboard
- `requirements.txt`: Python packages needed to run it
- `Cuba_NM_Housing_Dataset_Catalog (1).xlsx`: source data
- `graphCode/`: original MATLAB code
- `dash/`: dashboard-related files
- `.devcontainer/`: Codespaces setup

## Author

Trouble-Double (Nam Vu)
(Colin McRae)











