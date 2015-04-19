### Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)
index <- which(is.na(activity$steps))
length(index)

### Devise a strategy for filling in all of the missing values in the dataset.
# I fill in the average for that interval

### Create a new dataset that is equal to the original dataset but with the missing data filled in.
### Here I copy the orignal dataset
activity_filled <- activity

### Here I fill the avg values into NAs
for (i in index)
{
  interval_ix = as.integer(activity_filled[i,3])
  avg_step = as.numeric(stepsByInterval[stepsByInterval$interval == interval_ix, 2])
  activity_filled[i,1] = avg_step
}

# Make a histogram of the total number of steps taken each day 
# and Calculate and report the mean and median total number of steps taken per day. 
### get steps sum per day - historgram
activity_filled <- activity_filled %>% group_by(date)
stepsByDayFilled <- activity_filled %>% summarise_each(funs(sum))
stepsByDayFilled <- stepsByDayFilled[, 1:2]

png("plots/stepsByDayFilled.png", width = 800, height = 600)
hist(
  stepsByDayFilled$steps, 
  xlab = "total number of steps per day", 
  main = "histogram of the total number of steps taken each day", 
  col = "blue"
)
dev.off()

### mean and median values
mean(stepsByDayFilled$steps)
median(stepsByDayFilled$steps)

# Do these values differ from the estimates from the first part of the assignment? 
## yes, I have recovered 8 observations and putting the avg value makes median value levels up till mean value
# What is the impact of imputing missing data on the estimates of the total daily number of steps?
summary(stepsByDay)
summary(stepsByDayFilled)
## I have raised the median value and I have reduced the standard deviation of the dataset distribution:
sd(stepsByDay$steps)
sd(stepsByDayFilled$steps)