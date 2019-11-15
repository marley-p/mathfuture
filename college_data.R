library(tidyverse)
library(ggrepel)

df_full<-earnings_short_df

df25<-df_full%>% filter(earnings_mean>0&sat_math_25_pctl>0)

df25 %>% ggplot(aes(y=earnings_mean,x=sat_math_25_pctl))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=lm,formula = y ~ x)+
  labs(title ="SAT Math Score (25th Percentile) vs Future Income", x = "SAT score", y = "Income/$")


df75<-df_full%>% filter(earnings_mean>0&sat_math_75_pctl>0)

df75 %>% ggplot(aes(y=earnings_mean,x=sat_math_75_pctl))+
  geom_point()+
  geom_smooth(method=lm)+
  labs(title =" New title", x = "New x", y = "New y") 

dfcrit<-df_full%>% filter(earnings_mean>0&sat_crit_read_25_pctl>0)

dfcrit %>% ggplot(aes(y=earnings_mean,x=sat_crit_read_25_pctl))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=lm,formula = y ~ x)+
  labs(title ="SAT Reading Score (25th Percentile) vs Future Income", x = "SAT score", y = "Income/$")
 
dfwrit <- df_full%>% filter(earnings_mean>0&sat_writing_25_pctl>0)

dfwrit %>% ggplot(aes(y=earnings_mean,x=sat_writing_25_pctl))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=lm,formula = y ~ x)+
  labs(title ="SAT Writing Score (25th Percentile) vs Future Income", x = "SAT score", y = "Income/$")

dfclean<-df_full %>% filter_at(vars(sat_math_25_pctl,sat_crit_read_25_pctl,sat_writing_25_pctl),all_vars(.>0))

sat_earnings_regress<-lm(earnings_mean~sat_crit_read_25_pctl+sat_writing_25_pctl+sat_math_25_pctl,data=dfclean)
summary(sat_earnings_regress)

sat_math_av<-mean(df25$sat_math_25_pctl)
sat_math_sd<-sd(df25$sat_math_25_pctl)

sat_crit_av<-mean(dfcrit$sat_crit_read_25_pctl)
sat_crit_sd<-sd(dfcrit$sat_crit_read_25_pctl)

sat_writ_av<-mean(dfwrit$sat_writing_25_pctl)
sat_writ_sd<-sd(dfwrit$sat_writing_25_pctl)

df_act_math<- df_full%>% filter(earnings_mean>0&act_math_25_pctl>0)

df_act_math %>% ggplot(aes(y=earnings_mean,x=act_math_25_pctl))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=lm,formula = y ~ x)+
  labs(title ="ACT Math Score (25th Percentile) vs Future Income", x = "SAT score", y = "Income/$")

df_act_english<- df_full%>% filter(earnings_mean>0&act_english_25_pctl>0)

act_math_av<-mean(df_act_math$act_math_25_pctl)
act_math_sd<-sd(df_act_math$act_math_25_pctl)

act_english_av<-mean(df_act_english$act_english_25_pctl)
act_english_sd<-sd(df_act_english$act_english_25_pctl)

df_act_english %>% ggplot(aes(y=earnings_mean,x=act_english_25_pctl))+
  geom_point(color="red",alpha=0.2)+
  geom_smooth(method=lm,formula = y ~ x)+
  labs(title ="ACT English Score (25th Percentile) vs Future Income", x = "SAT score", y = "Income/$")

act_earnings_regress<-lm(earnings_mean~act_math_25_pctl+act_english_25_pctl,data=df_act_math)
summary(act_earnings_regress)

df_standard<-df_full %>% mutate(sat_math_25_stand=(sat_math_25_pctl-sat_math_av)/sat_math_sd,
                                sat_writ_25_stand=(sat_writing_25_pctl-sat_writ_av)/sat_writ_sd,
                                sat_crit_25_stand=(sat_crit_read_25_pctl-sat_crit_av)/sat_crit_sd,
                                act_math_25_stand=(act_math_25_pctl-act_math_av)/act_math_sd,
                                act_english_25_stand=(act_english_25_pctl-act_english_av)/act_english_sd)

df_na<- df_full %>% filter(is.na(sat_math_25_pctl))
mean(df_na$earnings_mean)

mean(df25$earnings_mean)

state_av <- df25 %>% filter(!is.na(abb)) %>%
  group_by(abb) %>%
  summarize(satmath25=mean(sat_math_25_pctl),income=mean(earnings_mean))

state_av %>% ggplot(aes(x=satmath25,y=income,label=abb)) +
  geom_smooth(method=lm)+
  geom_point()+
  geom_text_repel()+
  labs(title ="State Average: Math Score vs Future Income", x = "SAT score", y = "Income/$")