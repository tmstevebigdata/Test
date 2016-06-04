# ui.R

library(shiny)

AppTitle <- 'Top 10 Property Types'

shinyUI(fluidPage(

  ## -- Include Cascading Style Sheet --
  includeCSS('www/styles.css'),

  headerPanel(AppTitle),

  sidebarPanel(
      helpText('Top 10 Property Types'),

      radioButtons('TopSelection', label = 'Selection',
                   choices = list('Max Sale Price' = 1,
                                  'Min Sale Price' = 2,
                                  'Max Rent Price' = 3,
                                  'Min Rent Price' = 4),
                                  selected = 1)

      # Adding the new div tag to the sidebar
      #tags$div(class = 'header', checked = NA,
      #         tags$p('For the documentation on how to use this App:-'),
      #         tags$a(href='https://tmstevebigdata.shinyapps.io/ShinyApp-TopUSSevereWeatherEvents/documentation.html', target='_blank', 'Click Here!')
      #)
  ),

  mainPanel(
      tabsetPanel(
          tabPanel('Plot', plotOutput(outputId = 'main_plot', height = '710px', width = '850px')),
          tabPanel('Table', tableOutput(outputId = 'main_table'))
      )
  )

))
