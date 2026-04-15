library(dplyr)
# Unfortunately Baseballr seems to struggle with some statcast stats, so I have manually made a custom leader board for bat speed and swing length in Savant
# https://baseballsavant.mlb.com/leaderboard/custom?year=2026&type=batter&filter=&min=q&selections=xslg%2Cxwoba%2Cxobp%2Cavg_swing_speed%2Cavg_swing_length&chart=false&x=xslg&y=xslg&r=no&chartType=beeswarm&sort=xobp&sortDir=desc

# Downloading from this link gives us a "stats.csv" file so we will download that then add in our time stat
bat_speed <- read.csv("C:/Users/hanke/Downloads/stats.csv")
bat_speed = bat_speed %>% mutate(time = sqrt((225*(avg_swing_length)^2)/(121*(avg_swing_speed)^2)))
