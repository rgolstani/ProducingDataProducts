# COURSE PROJECT in project folder

  
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Fitness Predictions for Roshana's Clients"),
    sidebarPanel(
      h4(' Please enter all information below and press submit to get your fitness predictions!'),
      radioButtons("gender", "Gender:", list("Female" = "-161", "male" = "5"), selected= NULL, inline=TRUE),
      br(),
      numericInput('weight', 'Enter your weight/IL', 150, min = 95, max = 350, step = 1),
      numericInput('height', 'Enter your height/inch', 65, min = 45, max = 84, step = 1),
      numericInput('age', 'Enter your age', 40, min = 19, max = 85, step = 1),
      radioButtons("activity.level","How would you describle your daily activity level?",
                   list("Sedentry" = "1.2",
                        "Mostly sitting all day" = "1.4",
                        "Semi active, exercising 2/3 days a week" = "1.55",
                        "Active, exercise everyday" ="1.9",
                        "Athlete" = "2.1")),
      br(),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Body Mass Index (BMI) is a reliable way to estimate body fat. '),
   #   h4('Your weight:'),
  #    verbatimTextOutput("weight"),
    #  h4('Your activity:'),
    #  verbatimTextOutput("activity.level"),
#############  
      h4('Total calories you need to maintain your weight, per your activity level is : '),
      verbatimTextOutput("caloric"),
#############   
      h4('Your BMI prediction is :'),
      verbatimTextOutput("prediction"),
      h4('Compare your BMI index with the standard table below:'),
      tableOutput("table"),
      h3('                 Good Luck in your fitness journey!')
    )
  )
)