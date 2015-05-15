# COURSE PROJECT in project folder


#  BMR calculation
#  females = 10 x (Weight in kg) + 6.25 x (Height in cm) - 5x age - 161
#  males= 10 x (Weight in kg) + 6.25 x (Height in cm) - 5 x age + 5

# this formula is based on Mifflin-St.Joer Equation
BMRcalculator <- function(weight, height, age, gender, activity.level) {
  result <- (10* (weight/2.2) + (6.25* (height * 2.54)) - 5*age + as.numeric(gender)) * as.numeric(activity.level)
  return(round(result, digits = 2))
}

BMIindex <- function(weight, height) (weight/2.2) / (height*.0254)^2
BMItable <- data.frame( cbind(BMI = c("Below 18.5", "18.5 - 24.9", "25.0 - 29.9","30 and above"),
                              Weight.status= c("Under weight", " Normal", "Overweight", "Obese")))

shinyServer(
  function(input, output) {
    #output$weight <- renderPrint({input$weight})
    #output$activity.level <- renderPrint({input$activity.level})
    output$prediction <- renderPrint({BMIindex(input$weight, input$height)})
    output$table <- renderTable({
      BMItable
    })
    output$caloric <- renderText({ BMRcalculator(input$weight, input$height, input$age, input$gender, input$activity.level)})  
    
  }
)