---
title       : "Forecasting for Air Quality Measurements"
subtitle    : "Based on airquality data"
author      : "Student"
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]         # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Background

### Project Requirement
- First, you will create a Shiny application and deploy it on Rstudio's servers. Here's what you need:
  1. 5 slides to pitch our idea done in Slidify or Rstudio Presenter
  2. Your presentation pushed to github or Rpubs
  3. A link to your github or Rpubs presentation pasted into the provided text box
  
- Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application. Your presentation must satisfy the following:
  1. It must be done in Slidify or Rstudio Presenter
  2. It must be 5 pages
  3. It must be hosted on github or Rpubs
  4. It must contained some embedded R code that gets run when slidifying the document

---

## Dataset Background (airquality {datasets})
- Description: 
  Daily air quality measurements in New York, May to September 1973.
  
- Details:
  Daily readings of the following air quality values for May 1, 1973 (a Tuesday) to September 30, 1973.

  1. Ozone: Mean ozone in parts per billion from 1300 to 1500 hours at Roosevelt Island.
  2. Solar.R: Solar radiation in Langleys in the frequency band 4000-7700 Angstroms from 0800 to 1200 hours at Central Park.
  3. Wind: Average wind speed in miles per hour at 0700 and 1000 hours at LaGuardia Airport.
  4. Temp: Maximum daily temperature in degrees Fahrenheit at La Guardia Airport.

---

## Objectives
- Visualize the trend of different measurements.
- Forecast Sep's measurements based on the measurements in last four months.

### Process
1. Clean the data
2. Exploratory analysis
3. Building simple linear regression model for each measurement
4. Forecast and model evaluation

---

## Conclusion
- Overall, the prediction model is bad
- Prediction for solar rediation is relatively good
- Even the p-values of models are very small for most measurements, it's obvious to conclude that models are not useful.






