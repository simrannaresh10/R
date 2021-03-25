##Data Analysis using dplyr
install.packages("dplyr")
library(dplyr)
flights<-read.csv("C:/Users/Simran/Desktop/flights.csv")                
View(flights)
data(flights)
head(flights)
tail(flights)
flights<-data.frame(flights)
#overview of the data
glimpse(flights)
#Select required rows and columns
# dplyr approach
select(flights, dep_time, arr_time, flight)
#filter: Keep rows matching criteria
# note: you can use comma or ampersand to represent AND condition
filter(flights, month==1, day==1,origin=="EWR")
# use pipe for OR condition
filter(flights, carrier=="AA" | carrier=="UA")

#“Chaining” or “Pipelining”
# chaining method
flights %>%
  select(carrier, dep_delay) %>%
  filter(dep_delay > 60)

#Select carrier and DepDelay columns and sort by DepDelay
flights %>%
  select(carrier, dep_delay) %>%
  arrange(dep_delay)
#mutate: Add new variables
#Create new variables that are functions of existing variables
# store the new variable
flights <- flights %>% mutate(Speed = distance/air_time*60)

#summarise: Reduce variables to values
flights %>%
  group_by(dest) %>%
  summarise(avg_delay = mean(arr_delay, na.rm=TRUE))

flights %>%
  group_by(month, day) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))
