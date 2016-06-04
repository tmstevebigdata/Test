# server.R

## Initial setup
rm(list = ls())
options(warn = -1)

options(digits = 2)
options(scipen = 999)

## Define Libraries
library(shiny)
library(gridExtra)
library(grid)
library(gtable)
library(xtable)

## Load data
df_Sale_Max <- readRDS('Listing2015-Sale-Max.rds')
df_Sale_Min <- readRDS('Listing2015-Sale-Min.rds')
df_Rent_Max <- readRDS('Listing2015-Rent-Max.rds')
df_Rent_Min <- readRDS('Listing2015-Rent-Min.rds')

shinyServer(function(input, output, session) {

## -- PLOT --

  output$main_plot <- renderPlot({

  ## Set variables
  Selection <- as.integer(input$TopSelection)
  TopNum <- 10

  ## Sort Plot Data
  if (Selection == 1) {df_Plot <- df_Sale_Max[order(df_Sale_Max$Price, decreasing = FALSE), ]}
  if (Selection == 2) {df_Plot <- df_Sale_Min[order(df_Sale_Min$Price, decreasing = TRUE), ]}
  if (Selection == 3) {df_Plot <- df_Rent_Max[order(df_Rent_Max$Price, decreasing = FALSE), ]}
  if (Selection == 4) {df_Plot <- df_Rent_Min[order(df_Rent_Min$Price, decreasing = TRUE), ]}

  ## Define Functions
  fPlot <- function() {
     barplot(vY, names.arg = vX,
             horiz = vHoriz,
             width = vWidth, col = vCol, las = vLas,
             cex.names = vCexNames, cex.axis = vCexAxis, cex.lab = vCexLab,
             col.main = vColMain, col.lab = vColLab,
             main = vMain, xlab = vXLab, ylab = vYLab)
  }

  ## RESULTS

  ## -- Set up variables for plot --
  vY <- df_Plot$Price
  vX <- df_Plot$Township
  vHoriz <- TRUE
  vWidth <- 1
  vCol <- 'Red'
  vLas <- 2
  vCexNames <- 1.2 # 0.85
  vCexAxis <- 1.2 # 0.85
  vCexLab <- 1.5
  vColMain <- 'Purple'
  vColLab <- 'Red'

  if (Selection == 1) {vMain <- paste('Top', TopNum, 'Max Property Price for Sale in Selangor')}
  if (Selection == 2) {vMain <- paste('Top', TopNum, 'Min Property Price for Sale in Selangor')}
  if (Selection == 3) {vMain <- paste('Top', TopNum, 'Max Property Price for Rent in Selangor')}
  if (Selection == 4) {vMain <- paste('Top', TopNum, 'Min Property Price for Rent in Selangor')}

  vXLab <- 'Price'
  vYLab <- 'Area'

  ## -- Output Plots --
  opar <- par()

  par(mar = c(5.5, 15, 2, 1), mgp = c(0.75, 2, 0), oma = c(0, 0, 0, 0), lwd = 0.1)
  par(mfrow = c(2, 2))

  ## Plot Graph
  fPlot()

  par(opar)

  })

## -- TABLE --

  output$main_table <- renderTable({

  ## Set variables
  Selection <- as.integer(input$TopSelection)
  TopNum <- 10

  ## -- Output Results in a Table --
  if (Selection == 1) {df_Result <- data.frame(c(df_Sale_Max))}
  if (Selection == 2) {df_Result <- data.frame(c(df_Sale_Min))}
  if (Selection == 3) {df_Result <- data.frame(c(df_Rent_Max))}
  if (Selection == 4) {df_Result <- data.frame(c(df_Rent_Min))}

  row.names(df_Result) <- NULL
  names(df_Result) <- c('Area','Price','Property Type')

  ## Show Table
  xtable(df_Result)

  })

})
