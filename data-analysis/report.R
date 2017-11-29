library('glmnet')
library('ggplot2')
library('plotly')

blogs.requests <- read.csv('blogs_request.csv')
news.requests <- read.csv('news_request.csv')
products.requests <- read.csv('products_request.csv')

# データフレーム型を作成
# 日付のフォーマットが変なので、as.Dateメソッドで変換しておく
# 変換をしないとggplotした時にx軸が変な感じになる
requests.frame <- data.frame(date = as.Date(requests[, 1]),
                                            blogs.requests = blogs.requests[,2],
                                            news.requests = news.requests[,2],
                                            products.requests = products.requests[,2])

print(requests.frame)

is.data.frame(requests.frame)

requests.plot <- ggplot() +
  geom_line(data = requests.frame, aes(x = date, y = blogs.requests, group = 1), colour = '#FF9999', size = 1)  + # aes(group=1)がないと折れ線グラフが表示されない
  geom_line(data = requests.frame, aes(x = date, y = news.requests, group = 1), colour = '#0971B2', size = 1)  + # aes(group=1)がないと折れ線グラフが表示されない
  geom_line(data = requests.frame, aes(x = date, y = products.requests, group = 1), colour = '#FFFC19', size = 1)  + # aes(group=1)がないと折れ線グラフが表示されない
  # scale_x_discrete(breaks = seq(by = 10)) # x軸の表示の幅を指定したかったが、不要になったのでcommentアウト
  theme(panel.background = element_rect(fill = "transparent", color = NA))

requests.plot <- ggplotly(requests.plot)

requests.plot
