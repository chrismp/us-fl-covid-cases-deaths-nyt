library(dplyr)

d <- read.csv(url('https://raw.githubusercontent.com/nytimes/covid-19-data/master/rolling-averages/us-states.csv'))
fl <- filter(
  .data = d,
  state == 'Florida'
)

o <- 'output'
dir.create(o)

write.csv(
  x = d,
  file = paste0(o,'/nyt-us-deaths-by-date.csv'),
  na = '',
  row.names = F
)

write.csv(
  x = fl,
  file = paste0(o,'/nyt-fl-deaths-by-date.csv'),
  na = '',
  row.names = F
)
