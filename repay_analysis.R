<<<<<<< HEAD
repay_5_math<-repay_5 %>% filter(sat_math_25_pctl>0, repay_rate>0)

repay_5_math %>% ggplot(aes(x=sat_math_25_pctl,y=repay_rate))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Math Score vs Repayment Rate", x = "SAT score", y = "Repay Rate")

repay_5_read<-repay_5 %>% filter(sat_crit_read_25_pctl>0, repay_rate>0)

repay_5_read %>% ggplot(aes(x=sat_crit_read_25_pctl,y=repay_rate))+
  geom_point()+
  geom_smooth(method=glm)

repay_regress <-glm(repay_rate~sat_crit_read_25_pctl+sat_writing_25_pctl+sat_math_25_pctl,data=repay_5_math,family="binomial")
summary(repay_regress)

repay_na<- repay_5 %>% filter(is.na(sat_math_25_pctl),
                              repay_rate>0)
mean(repay_na$repay_rate,na.rm=TRUE)

mean(repay_5_math$repay_rate)

state_av <- repay_5_math %>% filter(!is.na(abb)) %>%
  group_by(abb) %>%
  summarize(satmath25=mean(sat_math_25_pctl),repay=mean(repay_rate))

state_av %>% ggplot(aes(x=satmath25,y=repay,label=abb)) +
  geom_smooth(method=glm,method.args=list(family="binomial"),se=FALSE)+
  geom_point()+
  geom_text_repel()+
=======
repay_5_math<-repay_5 %>% filter(sat_math_25_pctl>0, repay_rate>0)

repay_5_math %>% ggplot(aes(x=sat_math_25_pctl,y=repay_rate))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Math Score vs Repayment Rate", x = "SAT score", y = "Repay Rate")

repay_5_read<-repay_5 %>% filter(sat_crit_read_25_pctl>0, repay_rate>0)

repay_5_read %>% ggplot(aes(x=sat_crit_read_25_pctl,y=repay_rate))+
  geom_point()+
  geom_smooth(method=glm)

repay_regress <-glm(repay_rate~sat_crit_read_25_pctl+sat_writing_25_pctl+sat_math_25_pctl,data=repay_5_math,family="binomial")
summary(repay_regress)

repay_na<- repay_5 %>% filter(is.na(sat_math_25_pctl),
                              repay_rate>0)
mean(repay_na$repay_rate,na.rm=TRUE)

mean(repay_5_math$repay_rate)

state_av <- repay_5_math %>% filter(!is.na(abb)) %>%
  group_by(abb) %>%
  summarize(satmath25=mean(sat_math_25_pctl),repay=mean(repay_rate))

state_av %>% ggplot(aes(x=satmath25,y=repay,label=abb)) +
  geom_smooth(method=glm,method.args=list(family="binomial"),se=FALSE)+
  geom_point()+
  geom_text_repel()+
>>>>>>> be2af9916bc2c4dea5a6a1ea5185e7c57c9de583
  labs(title ="State Average: Math Score vs Repayment Rate", x = "SAT score", y = "Repayment Rate")