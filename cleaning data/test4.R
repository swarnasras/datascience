#Q1
a=read.csv("getdata%2Fdata%2Fss06hid.csv")
b=strsplit(names(a),"\\wgtp")
b[[123]]

#Q2
a=read.csv("getdata%2Fdata%2FGDP.csv")
b=as.character(a[,5])
b=gsub(",","",b)
c=as.numeric(b)
mean(c[1:196],na.rm=T)

#Q3
countryNames=a[,4]
grep("^United",countryNames)

#Q4
b=read.csv("getdata%2Fdata%2FEDSTATS_Country.csv")
c=b[10]
d=grep("[Ff]iscal",as.character(c))
e=grep("[Jj]une",as.character(c[d]))
length(e)

#Q5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
a=format(sampleTimes,"%Y")
length(grep("2012",a))
a=format(sampleTimes,"%A %Y")
length(grep("Monday 2012",a))
