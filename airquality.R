airquality <- datasets::airquality

#Top 5 rows and last 5 rows
head(airquality,5)
tail(airquality,5)

#selecting specific columns using $ from the given data set i.e airquality
airquality$Ozone
airquality$Wind

# accessing values usin [] operator
airquality[,c(1,2)]
airquality[1:4,]
df<-airquality[,-6]
df

#summary of columns
summary(airquality[1,])
summary(airquality)
summary(airquality$Wind)