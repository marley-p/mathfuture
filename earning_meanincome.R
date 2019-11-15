student_math<-student_df %>% filter(sat_math_25_pctl>0, faminc_med>0)
student_income<-student_math %>% right_join(earnings_mid_df,by="match")

student_math %>% ggplot(aes(y=sat_math_25_pctl,x=faminc_med))+
  geom_point(color="red",alpha=0.1)+
  geom_smooth(method=lm)+
  labs(title ="Family Income vs SAT Math Score", x = "Family Income/$", y = "SAT Score/$")

student_read<-student_df %>% filter(sat_crit_read_25_pctl>0, faminc_med>0)

student_read %>% ggplot(aes(x=sat_crit_read_25_pctl,y=faminc_med))+
  geom_point()+
  geom_smooth(method=lm)

student_regress <-lm(faminc_med~sat_crit_read_25_pctl+sat_writing_25_pctl+sat_math_25_pctl,data=student_df)
summary(student_regress)

student_earnings<- student_df %>% left_join(earnings_short_df,by="match")

student_earnings_cut %>% ggplot(aes(x=faminc_med,y=earnings_mean))+
  geom_point(color="red",alpha=0.1)+
  geom_smooth(method=lm)+
  labs(title ="Family Income vs Future Income", x = "Family Income/$", y = "Future Income/$")

student_earnings_cut<- student_earnings %>% filter(sat_math_25_pctl.x>0, faminc_med>0,earnings_mean>0)

student_earning_regress <-lm(earnings_mean~faminc_med+sat_crit_read_25_pctl.x+sat_writing_25_pctl.x+sat_math_25_pctl.x,data=student_earnings_cut)
summary(student_earning_regress)

student_earning_regress <-lm(earnings_mean~faminc_med+sat_math_25_pctl.x,data=student_earnings_cut)
summary(student_earning_regress)

student_earning_regress <-lm(earnings_mean~faminc_med,data=student_earnings_cut)
summary(student_earning_regress)

student_na<- student_df %>% filter(is.na(sat_math_25_pctl),
                                   faminc_med>0)
mean(student_na$faminc_med,na.rm=TRUE)

student_full<-student_math %>% left_join(repay_5,by="match") %>% left_join(grad_df,by="match")

student_full %>% ggplot(aes(y=completion_rate_150pct,x=faminc_med))+
  geom_point(color="red",alpha=0.1)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Family Income vs Graduation Rate", x = "Family Income/$", y = "Graduation Rate")

student_full %>% filter(repay_rate>0) %>%
  ggplot(aes(y=repay_rate,x=faminc_med))+
  geom_point(color="red",alpha=0.1)+
  geom_smooth(method=glm,method.args=list(family="binomial"))+
  labs(title ="Family Income vs Repay Rate", x = "Family Income/$", y = "Repay Rate")

grad_regress <-glm(completion_rate_150pct~faminc_med+sat_math_25_pctl,data=student_full,family="binomial")
summary(grad_regress)

repay_regress <-glm(repay_rate~faminc_med+sat_math_25_pctl,data=student_full,family="binomial")
summary(grad_regress)