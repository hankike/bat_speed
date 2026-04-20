library(dplyr)
# Unfortunately Baseballr seems to struggle with some statcast stats, so I have manually made a custom leader board for bat speed and swing length in Savant
# https://baseballsavant.mlb.com/leaderboard/custom?year=2026&type=batter&filter=&min=q&selections=xslg%2Cxwoba%2Cxobp%2Cavg_swing_speed%2Cavg_swing_length&chart=false&x=xslg&y=xslg&r=no&chartType=beeswarm&sort=xobp&sortDir=desc

# Downloading from this link gives us a "stats.csv" file so we will download that then add in our time stat. I did mine here lol
# I have added the stats.csv file for the 2025 season to these files as well
bat_speed <- read.csv("C:/Users/hanke/Downloads/stats.csv")

# Next I will mutate the data to add a time stat. This is simply the amount of time it will take for a player to swing.
bat_speed = bat_speed %>% mutate(swing_time = sqrt((225*(avg_swing_length)^2)/(121*(avg_swing_speed)^2)))

# Now I want to see correlation. To do this I will make a linear model. I will make two models, one with my made up swing time statistic and one without.
# First up is expected woba
lm_xwoba = lm(formula = xwoba ~ avg_swing_speed + avg_swing_length,
              data = bat_speed)
summary(lm_xwoba)

lm_xwoba_time = lm(formula = xwoba ~ swing_time + avg_swing_speed + avg_swing_length,
        data = bat_speed)
summary(lm_xwoba_time)

# Multiple R^2 without swing time = 0.2416
# Multiple R^2 with swing time = 0.2485
# Difference = +0.0069 swing time
