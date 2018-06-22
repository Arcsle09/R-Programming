library(readxl)

data <- read_xlsx("uplsales.xlsx")

data <- as.data.frame(data)

data <- data$netsales

data <- ts(data,frequency = 4,start=2010)

library(forecast)

ARIMAfit <- auto.arima(data,approximation = TRUE,trace=FALSE,allowdrift=F)

ARIMAfit

pred <- predict(ARIMAfit,n.ahead = 12)
pred 

plot(data,xlim=c(2010,2021),ylim = c(1,800),xlab = 'Year',ylab = 'UPL Sales',main="UPL Sales Forecasting")
lines(pred$pred,col='blue')
lines(pred$pred+2*pred$se,col='green')
lines(pred$pred-2*pred$se,col='red')
