

install.packages('haven')
library('haven')
setwd("C:/Users/slefe/Desktop/R/ketvirta paskaita")
data  = read_sas("C:/Users/slefe/Desktop/R/ketvirta paskaita/donate.sas7bdat")

# 2 uzduotis


lower_bound1 <- quantile(data$Qtr1, 0.25,na.rm=T)
upper_bound1 <- quantile(data$Qtr1, 0.75,na.rm=T)

IQR1=upper_bound1-lower_bound1


#radimas grubios ir salinimas
for ( i in 2:length(data))
{
  lower_bound <- quantile(data[i], 0.25,na.rm=T)
  upper_bound <- quantile(data[i], 0.75,na.rm=T)
  IQR=upper_bound-lower_bound
  a=which(data[i] < lower_bound - 3*IQR | data[i] > upper_bound + 3*IQR )
  b=data[a, i]
  print(b)
  data_clean = data[-a, ]
}

#santykines radimas
for ( i in 2:length(data))
{
  lower_bound <- quantile(data[i], 0.25,na.rm=T)
  upper_bound <- quantile(data[i], 0.75,na.rm=T)
  IQR=upper_bound-lower_bound
  a=which((data[i] < lower_bound - 1.5*IQR & data[i] >= lower_bound-3*IQR) | (data[i] > upper_bound + 1.5*IQR &
                                                                              data[i] <= upper_bound + 3*IQR))
  b=data[a, i]
  print(b)
}



