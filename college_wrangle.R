library(tidyverse)
library(educationdata)

admit_df<-read.csv("admit.csv")
earnings_df<-read.csv("earnings.csv")
repay_df<-read.csv("repay.csv")
grad_final<-read.csv("grad.csv")
student_df<-read.csv("student.csv")
#id_df<-read.csv("id.csv")

admit_df <- admit_df %>% unite(match,unitid,year,remove=FALSE) %>%
  mutate(abb=state.abb[match(fips,state.name)])

earnings_short_df<-earnings_df %>% filter(years_after_entry==6|years_after_entry==7)
earnings_short_df <- earnings_short_df %>% unite(match,unitid,cohort_year,remove=FALSE)
earnings_short_df <- admit_df %>% right_join(earnings_short_df,by="match")

earnings_mid_df<-earnings_df%>% filter(years_after_entry==8)
earnings_mid_df <- earnings_mid_df %>% unite(match,unitid,cohort_year,remove=FALSE)
earnings_mid_df <- admit_df %>% right_join(earnings_mid_df,by="match")

earnings_long_df<-earnings_df%>% filter(years_after_entry==9|years_after_entry==10)
earnings_long_df <- earnings_long_df %>% unite(match,unitid,cohort_year,remove=FALSE)
earnings_long_df <- admit_df %>% left_join(earnings_long_df,by="match")

repay_5<-repay_df %>% filter(years_since_entering_repay==5)
repay_5<-repay_5%>% unite(match,unitid,cohort_year,remove=FALSE)
repay_5 <- admit_df %>% right_join(repay_5,by="match")

grad_df<-grad_final%>% unite(match,unitid,cohort_year,remove=FALSE)
grad_df <- admit_df %>% right_join(grad_df,by="match")

student_df<-student_df%>% unite(match,unitid,year,remove=FALSE)
student_df <- admit_df %>% right_join(student_df,by="match")