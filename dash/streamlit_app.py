import pandas as pd
import plotly.graph_objects as go
import streamlit as st

st.set_page_config(page_title="Cuba, NM Housing Dashboard", page_icon="🏘️", layout="wide")

# ---------------------------------------------------------------- helpers
PALETTE = ["#2E86AB", "#F6AE2D", "#E4572E", "#76B041", "#8E6C8A", "#4B4E6D"]
GEO4 = ["Cuba Village", "ZIP 87013", "Sandoval County", "New Mexico"]
GEO3 = ["Village Only", "Rural Area", "Full ZIP"]
VH = ["Cuba Village", "Outlying Hinterland"]
PERIODS = ["2015-2019", "2020-2024"]


def _style(fig, title, ylabel, height=380):
    fig.update_layout(title=title, yaxis_title=ylabel, height=height,
                      margin=dict(t=60, b=20, l=10, r=10),
                      legend=dict(orientation="h", y=-0.2))
    return fig


def bar(x, y, title, ylabel, fmt="{:,.1f}"):
    fig = go.Figure(go.Bar(x=x, y=y, text=[fmt.format(v) for v in y],
                           textposition="outside",
                           marker_color=PALETTE[:len(x)]))
    fig.update_yaxes(range=[min(0, min(y) * 1.2), max(y) * 1.18])
    fig.update_layout(showlegend=False)
    return _style(fig, title, ylabel)


def multi(x, series, title, ylabel, stacked=False, fmt="{:,.1f}"):
    fig = go.Figure()
    for i, (name, vals) in enumerate(series.items()):
        fig.add_bar(name=name, x=x, y=vals, marker_color=PALETTE[i],
                    text=[fmt.format(v) for v in vals],
                    textposition="inside" if stacked else "outside")
    fig.update_layout(barmode="stack" if stacked else "group")
    return _style(fig, title, ylabel)


def pie(labels, values, title):
    fig = go.Figure(go.Pie(labels=labels, values=values, hole=0.4,
                           marker=dict(colors=PALETTE)))
    fig.update_layout(title=title, height=380, margin=dict(t=60, b=20, l=10, r=10))
    return fig


def errbar(x, y, err, title, ylabel, err_label):
    fig = go.Figure(go.Scatter(x=x, y=y, mode="markers",
                               marker=dict(size=12, color=PALETTE[0]),
                               error_y=dict(type="data", array=err, visible=True, thickness=2)))
    fig.update_layout(showlegend=False)
    fig = _style(fig, title, ylabel)
    fig.add_annotation(text=err_label, xref="paper", yref="paper", x=1, y=1.12,
                       showarrow=False, font=dict(size=11, color="gray"))
    return fig


_chart_counter = [0]


def grid(figs, cols=2):
    for i in range(0, len(figs), cols):
        row = st.columns(cols)
        for col, fig in zip(row, figs[i:i + cols]):
            _chart_counter[0] += 1
            col.plotly_chart(fig, key=f"chart_{_chart_counter[0]}")


def metrics(items):
    cols = st.columns(len(items))
    for col, (label, value, delta) in zip(cols, items):
        col.metric(label, value, delta)


def table(df, label="View data"):
    with st.expander(label):
        st.dataframe(df, hide_index=True)


# ---------------------------------------------------------------- header
st.title("🏘️ Cuba, NM Housing Dashboard")
st.caption("Cuba Village vs. ZIP 87013, Sandoval County and New Mexico  |  ACS-based housing indicators")

tabs = st.tabs([
    "📊 1. Executive Dashboard",
    "📈 2. Longitudinal Change",
    "🏘️ 3. Village vs Hinterland",
    "⚖️ 4. Cross-Geo Benchmark",
    "🏠 5. Physical Housing Stock",
])

# ================================================================ TAB 1
with tabs[0]:
    st.subheader("Executive Dashboard")
    metrics([("Median Household Income", "$58,750", None),
             ("Renter Cost Burden", "20.8%", None),
             ("Price-to-Income Ratio", "2.57", None),
             ("Occupied Households", "159", None)])
    st.caption("Headline figures are for Cuba Village.")

    income = [58750, 32942, 86636, 64059]
    owner = [84.9, 80.8, 81.5, 70.0]
    renter = [15.1, 19.2, 18.5, 30.0]
    rb = [20.8, 35.8, 46.2, 45.8]
    ob = [17.8, 22.4, 21.8, 21.4]
    ratio = [2.57, 2.29, 3.68, 3.87]
    hh = [159, 1527, 56890, 837414]

    st.markdown("#### Benchmark comparison")
    grid([
        bar(GEO4, income, "Median Household Income", "Income ($)", "${:,.0f}"),
        multi(GEO4, {"Owner Occupied": owner, "Renter Occupied": renter},
              "Owner vs Renter Occupancy", "Percent", stacked=True),
        bar(GEO4, rb, "Renter Cost Burden ≥ 30%", "Percent"),
        bar(GEO4, ob, "Owner Cost Burden ≥ 30%", "Percent"),
        bar(GEO4, ratio, "Price-to-Income Ratio", "Ratio", "{:.2f}"),
        bar(GEO4, hh, "Occupied Households", "Households", "{:,.0f}"),
    ])

    st.markdown("#### Village, rural area and full ZIP")
    grid([
        bar(GEO3, [462, 4789, 5251], "Population Comparison", "Population", "{:,.0f}"),
        bar(GEO3, [40.9, 19.9, 22.7], "Gross Vacancy Rate", "Percent"),
        bar(GEO3, [58750, 29850, 32942], "Median Household Income by Geography", "Income ($)", "${:,.0f}"),
    ])
    table(pd.DataFrame({"Geography": GEO4, "Median income": income, "Owner %": owner, "Renter %": renter,
                        "Renter burden %": rb, "Owner burden %": ob, "Price/Income": ratio, "Households": hh}))

# ================================================================ TAB 2
with tabs[1]:
    st.subheader("Longitudinal Change (2015-2019 → 2020-2024)")
    metrics([("Population", "462", "-28.0%"),
             ("Median Income", "$58,750", "+85.6%"),
             ("Median Home Value", "$150,700", "+34.0%"),
             ("Vacancy Rate", "40.9%", "+52.0%")])
    st.caption("Changes are for Cuba Village.")

    grid([
        bar(PERIODS, [642, 462], "Cuba Village Population Change", "Population", "{:,.0f}"),
        bar(PERIODS, [5557, 5251], "ZIP 87013 Population Change", "Population", "{:,.0f}"),
        multi(PERIODS, {"Cuba Village": [31649, 58750], "ZIP 87013": [31649, 32942]},
              "Median Household Income Change", "Income ($)", fmt="${:,.0f}"),
        multi(PERIODS, {"Cuba Village": [112500, 150700], "ZIP 87013": [77900, 75400]},
              "Median Home Value Change", "Value ($)", fmt="${:,.0f}"),
        multi(PERIODS, {"Cuba Village": [26.9, 40.9], "ZIP 87013": [19.7, 22.7]},
              "Vacancy Rate Change", "Percent"),
        multi(PERIODS, {"Cuba Village": [65.1, 84.9], "ZIP 87013": [80.0, 80.8]},
              "Owner Occupied Share", "Percent"),
        multi(PERIODS, {"Cuba Village": [34.9, 15.1], "ZIP 87013": [20.0, 19.2]},
              "Renter Occupied Share", "Percent"),
        bar(["Population", "Income", "Home Value", "Vacancy"], [-28.0, 85.6, 34.0, 52.0],
            "Major Cuba Village Changes (%)", "Percent Change"),
        errbar(PERIODS, [31649, 58750], [11840, 46069],
               "Median Household Income with MOE", "Income ($)", "Error bars = margin of error"),
    ])
    st.info("Note: the source data lists the same 2015-2019 median income ($31,649) for both Cuba Village "
            "and ZIP 87013. That may be a copy error in the dataset worth double-checking.")

# ================================================================ TAB 3
with tabs[2]:
    st.subheader("Village vs Outlying Hinterland (ZIP 87013)")
    metrics([("Village Population", "462", None),
             ("Village Share of ZIP", "8.8%", None),
             ("Village Vacancy", "40.9%", None),
             ("Village Poverty Rate", "22.5%", None)])

    grid([
        bar(VH, [462, 4789], "Village vs Hinterland Population", "Population", "{:,.0f}"),
        bar(VH, [269, 1707], "Total Housing Units", "Units", "{:,.0f}"),
        bar(VH, [159, 1368], "Occupied Housing Units", "Units", "{:,.0f}"),
        bar(VH, [110, 339], "Vacant Housing Units", "Units", "{:,.0f}"),
        bar(VH, [40.9, 19.9], "Gross Housing Vacancy Rate", "Percent"),
        bar(VH, [58750, 29850], "Median Household Income", "Income ($)", "${:,.0f}"),
        bar(VH, [70094, 42237], "Mean Household Income", "Income ($)", "${:,.0f}"),
        bar(VH, [24855, 13755], "Per Capita Income", "Income ($)", "${:,.0f}"),
        bar(VH, [22.5, 39.3], "Individual Poverty Rate", "Percent"),
        bar(VH, [150700, 68500], "Median Owner-Occupied Home Value", "Value ($)", "${:,.0f}"),
        bar(["Population", "Housing Units", "Occupied Units", "Owner HH", "Renter HH"],
            [8.8, 13.6, 10.4, 10.9, 8.2], "Village Share of ZIP Code", "Percent of Entire ZIP"),
        multi(VH, {"Owner": [135, 1099], "Renter": [24, 269]},
              "Owner vs Renter Households", "Households", stacked=True, fmt="{:,.0f}"),
        pie(VH, [8.8, 91.2], "Population Share of ZIP 87013"),
    ])

# ================================================================ TAB 4
with tabs[3]:
    st.subheader("Cross-Geography Benchmark with Reliability")
    metrics([("Village Median Rent", "$306", None),
             ("Village Median Home Value", "$150,700", None),
             ("Village Vacancy", "40.9%", None),
             ("Income CV (Village)", "47.7%", None)])
    st.caption("A CV above 30% generally means the estimate is unreliable. Village figures are based on small samples.")

    grid([
        bar(GEO4, [462, 5251, 153604, 2114371], "Population Comparison", "Population", "{:,.0f}"),
        bar(GEO4, [269, 1976, 61842, 956964], "Housing Units", "Units", "{:,.0f}"),
        bar(GEO4, [159, 1527, 56890, 837414], "Occupied Households", "Households", "{:,.0f}"),
        bar(GEO4, [40.9, 22.7, 8.0, 12.5], "Gross Vacancy Rate", "Percent"),
        bar(GEO4, [84.9, 80.8, 81.5, 70.0], "Owner Occupied Share", "Percent"),
        bar(GEO4, [15.1, 19.2, 18.5, 30.0], "Renter Occupied Share", "Percent"),
        bar(GEO4, [58750, 32942, 86636, 64059], "Median Household Income", "Dollars", "${:,.0f}"),
        bar(GEO4, [30313, 21450, 54210, 41820], "Median Renter Household Income", "Dollars", "${:,.0f}"),
        bar(GEO4, [150700, 75400, 318400, 248100], "Median Home Value", "Dollars", "${:,.0f}"),
        bar(GEO4, [2.57, 2.29, 3.68, 3.87], "Price-to-Income Ratio", "Ratio", "{:.2f}"),
        bar(GEO4, [572, 418, 1445, 1082], "Median Monthly Owner Cost", "Dollars", "${:,.0f}"),
        bar(GEO4, [306, 548, 1412, 1067], "Median Gross Rent", "Dollars", "${:,.0f}"),
        bar(GEO4, [12.1, 30.7, 31.3, 30.6], "Annual Rent to Income Ratio", "Percent"),
        bar(GEO4, [20.8, 35.8, 46.2, 45.8], "Renter Cost Burden ≥ 30%", "Percent"),
        bar(GEO4, [17.8, 22.4, 21.8, 21.4], "Owner Cost Burden ≥ 30%", "Percent"),
        bar(GEO4, [47.7, 10.0, 2.0, 0.8], "Income Reliability (CV %)", "CV Percent"),
        bar(GEO4, [23.3, 6.0, 0.6, 0.2], "Household Estimate Reliability (CV %)", "CV Percent"),
        errbar(GEO4, [58750, 32942, 86636, 64059], [28005, 3290, 1729, 491],
               "Median Household Income with Standard Error", "Income ($)", "Error bars = standard error"),
    ])

# ================================================================ TAB 5
with tabs[4]:
    st.subheader("Physical Housing Stock")
    metrics([("Single Family", "53.5%", None),
             ("Manufactured Housing", "40.9%", None),
             ("Multi-Family", "5.6%", None),
             ("Median Year Built", "1976", None)])
    st.caption("Village figures shown above.")

    single = [53.5, 77.2, 81.2, 69.8]
    multif = [5.6, 4.3, 7.4, 14.9]
    manuf = [40.9, 18.5, 11.4, 15.3]
    bins = {"Under $100K": [35, 57, 7, 15],
            "$100K-$199K": [27, 23, 7, 17],
            "$200K-$299K": [13, 8, 19, 23],
            "$300K+": [25, 12, 67, 45]}

    grid([
        multi(GEO4, {"Single Family": single, "Multi Family": multif, "Manufactured Housing": manuf},
              "Housing Structure Types", "Percent"),
        bar(GEO4, manuf, "Manufactured Housing Share", "Percent"),
        bar(GEO4, single, "Single Family Detached Housing", "Percent"),
        bar(GEO4, multif, "Multi-Family Housing Share", "Percent"),
        multi(GEO4, bins, "Owner-Occupied Home Value Distribution", "Percent", stacked=True, fmt="{:.0f}"),
        bar(GEO4, [1976, 1984, 1999, 1985], "Median Year Structure Built", "Year Built", "{:.0f}"),
        pie(["Single Family", "Multi Family", "Manufactured Housing"], [53.5, 5.6, 40.9],
            "Cuba Village Housing Composition"),
        multi(["Single Family", "Manufactured Housing"],
              {"Cuba Village": [53.5, 40.9], "Sandoval County": [81.2, 11.4]},
              "Housing Stock Comparison", "Percent"),
    ])
    st.warning("Parts of the original dataset 5 code were corrupted (characters replaced with **). Missing values "
               "were recovered from the other lines of the same file, but two Sandoval County home-value cells "
               "(7% under $100K and 67% for $300K+) were inferred so each column sums to 100%. Please verify "
               "them against the CSV.")

st.divider()
st.caption("Source: Cuba_NM_Housing_Dataset_Catalog (datasets 1-5).")
