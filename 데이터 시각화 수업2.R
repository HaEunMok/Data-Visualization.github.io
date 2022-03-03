load("iris.RData")
iris<-iris[c(5,1:4)]
str(iris)
plot(iris$Sepal.Length, iris$Sepal.Width)
points(iris$Petal.Length, iris$Petal.Width, col="red")

library(ggplot2)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point()+
  geom_point(aes(x=Petal.Length, y= Petal.Width),col="red")
ggplot(iris.wide, aes(x=Length, y=Width, col=Part))+
  geom_point()

ggplot(iris.wide2,aes(x=Part, y=setosa, col=Measure))+
  geom_jitter()
ggplot(iris.wide2, aes(x=Measure, y=setosa, col=Part))+
  geom_jitter()

ggplot(iris.wide2,aes(x=Part, y= setosa, col=Measure))+
  geom_jitter()
ggplot(iris.wide2,aes(x=Part, y= versicolor, col=Measure))+
  geom_jitter()
ggplot(iris.wide2,aes(x=Part, y= virginica, col=Measure))+
  geom_jitter()

ggplot(iris.tidy, aes(x=Measure, y=Value, col=Part))+
  geom_jitter()+
  facet_grid(.~Species)
