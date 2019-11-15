<<<<<<< HEAD
grad_math<-grad_df %>% filter(sat_math_25_pctl>0, completion_rate_150pct>0)

grad_math %>% ggplot(aes(x=sat_math_25_pctl,y=completion_rate_150pct))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Math Score vs Graduation Rate", x = "SAT score", y = "Grad Rate")

grad_read<-grad_df %>% filter(sat_crit_read_25_pctl>0, completion_rate_150pct>0)

grad_read %>% ggplot(aes(x=sat_crit_read_25_pctl,y=completion_rate_150pct))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Reading Score vs Graduation Rate", x = "SAT score", y = "Grad Rate")

grad_regress <-glm(completion_rate_150pct~sat_crit_read_25_pctl+sat_writing_25_pctl+sat_math_25_pctl,data=grad_df,family="binomial")
summary(grad_regress)

grad_missing<-grad_df %>% filter(is.na(sat_math_25_pctl)) 

mean(grad_missing$completion_rate_150pct,na.rm=TRUE)
mean(grad_math$completion_rate_150pct,na.rm=TRUE)

state_av <- grad_math %>% filter(!is.na(abb)) %>%
  group_by(abb) %>%
  summarize(satmath25=mean(sat_math_25_pctl),grad=mean(completion_rate_150pct))

state_av %>% ggplot(aes(x=satmath25,y=grad,label=abb)) +
  geom_smooth(method=glm,method.args=list(family="binomial"),se=FALSE)+
  labs(title ="State Average: Math Score vs Graduation Rate", x = "SAT score", y = "Grad Rate")+
  geom_point()+
=======
grad_math<-grad_df %>% filter(sat_math_25_pctl>0, completion_rate_150pct>0)

grad_math %>% ggplot(aes(x=sat_math_25_pctl,y=completion_rate_150pct))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Math Score vs Graduation Rate", x = "SAT score", y = "Grad Rate")

grad_read<-grad_df %>% filter(sat_crit_read_25_pctl>0, completion_rate_150pct>0)

grad_read %>% ggplot(aes(x=sat_crit_read_25_pctl,y=completion_rate_150pct))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Reading Score vs Graduation Rate", x = "SAT score", y = "Grad Rate")

grad_regress <-glm(completion_rate_150pct~sat_crit_read_25_pctl+sat_writing_25_pctl+sat_math_25_pctl,data=grad_df,family="binomial")
summary(grad_regress)

grad_missing<-grad_df %>% filter(is.na(sat_math_25_pctl)) 

mean(grad_missing$completion_rate_150pct,na.rm=TRUE)
mean(grad_math$completion_rate_150pct,na.rm=TRUE)

state_av <- grad_math %>% filter(!is.na(abb)) %>%
  group_by(abb) %>%
  summarize(satmath25=mean(sat_math_25_pctl),grad=mean(completion_rate_150pct))

state_av %>% ggplot(aes(x=satmath25,y=grad,label=abb)) +
  geom_smooth(method=glm,method.args=list(family="binomial"),se=FALSE)+
  labs(title ="State Average: Math Score vs Graduation Rate", x = "SAT score", y = "Grad Rate")+
  geom_point()+
>>>>>>> be2af9916bc2c4dea5a6a1ea5185e7c57c9de583
  geom_text_repel()