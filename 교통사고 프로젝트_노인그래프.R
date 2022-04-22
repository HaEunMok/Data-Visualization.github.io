############################################################
people<-readxl::read_xlsx("도시지역_인구현황_시군구__20191109022301.xlsx")
elder<-readxl::read_xlsx("고령인구비율_시도_시_군_구__20191109022439.xlsx")
population<-cbind(elder,people)
population$`소재지(시군구)별`<-NULL
names(population)<-c("지역","노인비율","인구")

population$노인인구<-apply(population,1,function(x){((population$노인비율)*0.000001)*population$인구})#만 단위로 바꿔줌.
population$노인인구<-floor(population$노인인구)
############################################################
library('xlsx')
population<-population[-1,]
ggplot(population, aes(x = 지역, y = 노인인구,fill=노인인구)) + geom_bar(stat = "identity")+  labs(y="노인인구(만 명)", x="지역")+coord_flip()

########################################################3
data<-read.csv("도로교통공단_전국_사망교통사고정보(2018).csv")
library('dplyr')
library('ggplot2')
data$피해운전자.연령<-substr(data$피해운전자.연령, 1, 2)
pohang<-read.csv("포항시.csv")
pohang$피해운전자.연령<-substr(pohang$피해운전자.연, 1, 2)

pohang_elders<-subset(pohang,피해운전자.연령>=65)
elders<-subset(data,피해운전자.연령>=65)
write.csv(elders,"elders.csv")
################ 지역별 교통사고 사망자 인구분포 ########################################33

elders<-read.csv("elders.csv")
pohang_elders<-subset(pohang,피해운전자.연령>=65)
elders_final<-rbind(elders, pohang_elders)
a<-subset(elders_final,지역=="경상북도")
b<-subset(elders_final,지역=="경상북도")
a<-as.data.frame(a)
b<-as.data.frame(b)
p<-cbind(a,b)
count<-elders %>% group_by(지역) %>% summarise(n = n())
count_final<-elders_final %>% group_by(지역) %>% summarise(n = n())
p_final<-p %>% group_by(지역) %>% summarise(n = n())
#지역별 교통사고 노인인구
count$지역<-as.factor(count$지역)
ggplot(count, aes(x = reorder(지역, -n), y =n ,fill=n)) + geom_bar(stat = "identity")+  labs(y="수(명)", x="지역")+coord_flip()

ggplot(count_final, aes(x = 지역, y =n ,fill=n)) + geom_bar(stat = "identity")+  labs(y="수(명)", x="지역")+coord_flip()
ggplot(p, aes(x = 지역, y =n ,fill=n)) + geom_bar(stat = "identity")+  labs(y="수(명)", x="지역")+coord_flip()
write.csv(count,"count.csv")
############## 지역별 교통사고 사망자 비율 ##################3
count<-read.csv("count.csv")
names(elder)<-c("지역","노인비율")
elder<-elder[-1,]
count<-merge(count,population,by="지역")
count$노인인구<-count$노인인구*10000
count$acc_ratio<-(count$n/count$노인인구)*100
acc_ratio<-as.numeric(count$acc_ratio)
names(count)<-c("region", "a","b","c","d","e","acc_ratio")
write.csv(count,"count.csv")
count<-read.csv("count.csv")
count$acc_ratio.2
ggplot(count, aes(x = reorder(region,-acc_ratio.2), y =acc_ratio.2 ,fill=acc_ratio.2)) + geom_bar(stat = "identity")+  labs(y="비율(%)", x="지역")+coord_flip()
