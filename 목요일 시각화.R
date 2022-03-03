install.packages('ggplot2')
library(ggplot2)
#ggplot+geom_poitn()
#ggplot(?????ͼ?, mapping=aes(x=,y=,clour=))+
# geom_point()
#ggplot()+
# geom_point(mapping=aes(x=,y=,clour=),?????ͼ?)
#ggplot(?????ͼ?)+
# geom_point(mapping=aes(x=,y=,clour=)

ggplot(iris, aes(x=Sepal.Length, y= Sepal.width,
                 size=Sepal.Length%/3,
                 colour=))

ggplot(iris, aes(x=Sepal.Length, y= Sepal.width,
                 size=Sepal.Length%/3,
                 colour=Sepal.Length%/3))+
  geom_point())

ggplot(iris)+
  geom_point(aes(x=Pepal.Length, y= Pepal.width, size=2, colour='red',alpha=0.6)+
               geom_point(aes(x=Sepal.Length, y= Sepal.width, size=1.5, colour='blue',alpha=0.6))
             
             names(iris)
             ggplot()+
               geom_point(aes(x=Pepal.Length, y= Pepal.width, 
                              size=2, 
                              colour='red',
                              data=iris[1:50],alpha=0.6)+
                            
                            geom_point(aes(x=Sepal.Length, y= Sepal.width, size=1.5, colour='blue',data=iris[1:50],alpha=0.6))
                          names(iris)
                          
install.packages('ggmap')
library(ggmap)
help(package='ggmap')

g1=get_googlemap(center='Korea',zoom=7,
                  maptype = 'roadmap')
ggmap(g1)

add1=c("서울","대구","부산","포항")
add2=enc2utf8(add1)
add3=geocode(add2)
add3$ad=add2
ad3=geocode(add2,output="latlona")
?geocode

ggmap(g1)+geom_point(aes(x=lon, y=lat, size=3, 
                         colour=c("red","green",
                        "blue","gray"))
                     ,data=add3,alpha=0.5)
install.packages('leaflet')
library(leaflet)
leaflet()%>%
  addTiles()
  addMarkers(lng=add3$lon,lat=add3$lat)
  
leaflet(add3)%>%
  addTiles()%>%
  addMarkers(lng=~lon,lat=~lat,
             popup= ~ad)%>%
  addMiniMap()

names(providers)
leaflet()%>%addTiles()%>%
  add
southKorea <- map_data(map = 'world', region = 'South Korea')
northKorea <- map_data(map = 'world', region = 'North Korea')
  
neAsia <- map_data(map = 'world',
                   region = c('South Korea', 'North Korea', 'China',
                              'Japan', 'Mongolia', 'Taiwan'))
twoKoreas <- map_data(map = 'world', 
                      region = c('South Korea', 'North Korea'))

# 지도를 깔끔하게 정리하기 위해 나만의 테마를 만듭니다. 
my_theme <- theme(panel.background = element_blank(),
                  axis.title = element_blank(),
                  axis.text = element_blank(),
                  axis.ticks = element_blank(),
                  plot.title = element_text(hjust = 0.5,
                                            face = 'bold'))
# 통일 전 한반도 지도 이미지를 생성합니다. 
before <- 
  ggplot(data = twoKoreas,
         mapping = aes(x = long,
                       y = lat,
                       group = group)) + 
  coord_map() + 
  geom_polygon(data = southKorea,
               aes(x = long,
                   y = lat,
                   group = group),
               fill = 'blue',
               color = 'blue') +
  geom_polygon(data = northKorea,
               aes(x = long,
                   y = lat,
                   group = group),
               fill = 'red',
               color = 'red') +
  ggtitle(label = '통일 전 한반도') + 
  my_theme

# 통일 전 한반도 지도 이미지를 그립니다.
before 

###사이트 참조: https://mrkevinna.github.io/
sgis

