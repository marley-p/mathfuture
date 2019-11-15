<<<<<<< HEAD
library(tidyverse)
library(devtools)
devtools::install_github("UrbanInstitute/education-data-package-r")
library(educationdata)

admit_df<-get_education_data(level = 'college-university', 
                             source = 'ipeds', 
                             topic = 'admissions-requirements',
                             filters=list(year=1997:2014),
                             add_labels = TRUE)

earnings_df<-get_education_data(level = 'college-university', 
                                source = 'scorecard', 
                                topic = 'earnings',
                                filters=list(year=2004:2014),
                                add_labels = TRUE)

repay_df<-get_education_data(level = 'college-university', 
                             source = 'scorecard', 
                             topic = 'repayment',
                             filters=list(year=2007:2016),
                             add_labels = TRUE)

grad_df<-get_education_data(level = 'college-university', 
                            source = 'ipeds', 
                            topic = 'grad-rates',
                            filters=list(year=2006:2016),
                            add_labels = TRUE)

grad_final<-grad_df %>%  filter(race=='Total'&sex=='Total'&subcohort=='Total')

student_df<-get_education_data(level = 'college-university', 
                               source = 'scorecard', 
                               topic = 'student-characteristics',
                               by='aid-applicants',
                               filters=list(year=1997:2016),
                               add_labels = TRUE)

insitut_df<-get_education_data(level = 'college-university', 
                               source = 'ipeds', 
                               topic = 'institutional-characteristics',
                               filters=list(year=1997:2016),
                               add_labels = TRUE)

id_df<-get_education_data(level = 'college-university', 
                               source = 'ipeds', 
                               topic = 'directory',
                               filters=list(year=1997:2016),
                               add_labels = TRUE)

write.csv(admit_df,"admit.csv")
write.csv(earnings_df,"earnings.csv")
write.csv(repay_df,"repay.csv")
write.csv(grad_final,"grad.csv")
write.csv(student_df,"student.csv")
#write.csv(id_df,"id.csv")
=======
library(tidyverse)
library(devtools)
devtools::install_github("UrbanInstitute/education-data-package-r")
library(educationdata)

admit_df<-get_education_data(level = 'college-university', 
                             source = 'ipeds', 
                             topic = 'admissions-requirements',
                             filters=list(year=1997:2014),
                             add_labels = TRUE)

earnings_df<-get_education_data(level = 'college-university', 
                                source = 'scorecard', 
                                topic = 'earnings',
                                filters=list(year=2004:2014),
                                add_labels = TRUE)

repay_df<-get_education_data(level = 'college-university', 
                             source = 'scorecard', 
                             topic = 'repayment',
                             filters=list(year=2007:2016),
                             add_labels = TRUE)

grad_df<-get_education_data(level = 'college-university', 
                            source = 'ipeds', 
                            topic = 'grad-rates',
                            filters=list(year=2006:2016),
                            add_labels = TRUE)

grad_final<-grad_df %>%  filter(race=='Total'&sex=='Total'&subcohort=='Total')

student_df<-get_education_data(level = 'college-university', 
                               source = 'scorecard', 
                               topic = 'student-characteristics',
                               by='aid-applicants',
                               filters=list(year=1997:2016),
                               add_labels = TRUE)

insitut_df<-get_education_data(level = 'college-university', 
                               source = 'ipeds', 
                               topic = 'institutional-characteristics',
                               filters=list(year=1997:2016),
                               add_labels = TRUE)

id_df<-get_education_data(level = 'college-university', 
                               source = 'ipeds', 
                               topic = 'directory',
                               filters=list(year=1997:2016),
                               add_labels = TRUE)

write.csv(admit_df,"admit.csv")
write.csv(earnings_df,"earnings.csv")
write.csv(repay_df,"repay.csv")
write.csv(grad_final,"grad.csv")
write.csv(student_df,"student.csv")
#write.csv(id_df,"id.csv")
>>>>>>> be2af9916bc2c4dea5a6a1ea5185e7c57c9de583
