install.packages("ggplot2")
library(ggplot2)
ggplot(mtcars, aes(x=mpg))+geom_histogram(binwidth = 5)
ggplot(mtcars, aes(x=hp, 
                   y=mpg,
                   color=factor(am)))+
  geom_point()

ggplot(mtcars, aes(x=factor(cyl), y=mpg))+
  geom_point()

ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_point()

ggplot(mtcars, aes(x=wt, y=mpg, color=5))+
  geom_point()
ggplot(mtcars, aes(x=wt, y=mpg, size=3))+
  geom_point()

ggplot(iris, aes(x=Sepal.Length, y= Sepal.Width))+
  geom_jitter()

ggplot(mtcars, aes(x=wt, y=mpg))+
  geom_jitter(alpha=0.6)+
  facet_grid(cyl~gear)#구간 나누어 그래프를 출력

levels(iris$Species)<-c("Setosa","Versicolor","Virginica")
library(grid)
ggplot(iris, aes(x= Sepal.Length, y=Sepal.Width))+
  geom_jitter(alpha=0.6)+
  facet_grid(.~Species)+
  start_smooth(method)