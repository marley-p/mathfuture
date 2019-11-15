library(tidyverse)
library(devtools)
devtools::install_github("UrbanInstitute/education-data-package-r",host = "https://api.github.com")
library(educationdata)
df<-get_education_data(level = 'schools', 
                       source = 'edfacts', 
                      topic = 'assessments',
                       filters=list(year=2016,
                       grade_edfacts=9:12),
                       add_labels = TRUE)
scores<-df %>% filter_at(vars(read_test_pct_prof_midpt:read_test_pct_prof_high,math_test_pct_prof_midpt:math_test_pct_prof_low),
                         all_vars(between(.,0,100))) %>%
  mutate(math_weight=0.5*math_test_pct_prof_high+0.4*math_test_pct_prof_midpt+0.1*math_test_pct_prof_low, read_weight=0.5*read_test_pct_prof_high+0.4*read_test_pct_prof_midpt+0.1*read_test_pct_prof_low)

scores %>% ggplot(aes(x=math_weight,y=read_weight))+
  geom_point(color="red",alpha=0.5)+
  geom_smooth(method=lm)

states<-scores %>% group_by(fips)%>%summarize(math=mean(math_weight),lit=mean(read_weight))
states %>% ggplot(aes(x=fips,y=math))+geom_bar(stat='identity')
