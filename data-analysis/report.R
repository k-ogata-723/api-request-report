library('glmnet')
library('ggplot2')
library('plotly')

requests <- read.csv('request.csv')

# データフレーム型を作成
requests.frame <- data.frame(date = requests[, 1], requests = requests[,2])

print(requests.frame)

is.data.frame(requests.frame)

requests.plot <- ggplot(requests.frame, aes(x = date, y = requests)) +
  geom_line(aes(group=1), colour = '#FF9999', size = 1) + # aes(group=1)がないと折れ線グラフが表示されない
  scale_x_discrete(breaks = seq(by = 1))

requests.plot <- ggplotly(requests.plot)

requests.plot
