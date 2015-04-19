### get steps sum per day - historgram
clean_activity <- clean_activity %>% group_by(date)
stepsByDay <- clean_activity %>% summarise_each(funs(sum))
stepsByDay <- stepsByDay[, 1:2]

#png("plots/stepsByDay.png", width = 800, height = 600)
hist(
  stepsByDay$steps, 
  xlab = "total number of steps per day", 
  main = "histogram of the total number of steps taken each day", 
  col = "blue"
)
#dev.off()

### mean and median values
mean(stepsByDay$steps)
median(stepsByDay$steps)
