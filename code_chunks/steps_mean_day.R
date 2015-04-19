### group by interval
clean_activity <- clean_activity %>% group_by(interval)
### calculate mean steps and clean data
stepsByInterval <- clean_activity %>% summarise_each(funs(mean))
stepsByInterval <- stepsByInterval[, 1:2]

#png("plots/stepsByInterval.png", width = 800, height = 600)
qplot(stepsByInterval$interval, stepsByInterval$steps, 
      geom = "line", 
      main = "average daily activity pattern", 
      xlab = "interval (hhmm)", 
      ylab = "steps average"
)
#dev.off()

### extract max steps interval
stepsByInterval[which.max(stepsByInterval$steps),]
