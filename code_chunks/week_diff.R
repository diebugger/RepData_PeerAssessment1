### Create a new factor variable in the dataset with two levels – “weekday” and “weekend” 
### indicating whether a given date is a weekday or weekend day.
days <- weekdays(activity_filled$date)
days <- ifelse(days %in% c("Saturday", "Sunday"), c("Weekend"), c("Weekday"))
days <- as.factor(days)
activity_filled$classification <- days

### Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) 
### and the average number of steps taken, averaged across all weekday days or weekend days (y-axis).
g <- ggplot(activity_filled, aes(interval, steps))

#png("plots/weekActivityPatterns.png", width = 800, height = 600)
g + geom_line() + aes(color = classification) + facet_grid(classification ~ .) + labs(title = "weekdays and weekends activity patterns") + labs(x = "interval (hhmm)", y = "steps average")
#dev.off()
