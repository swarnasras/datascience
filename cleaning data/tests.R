a="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(a,destfile="data.xlsx", method="curl")
datednd=date()
library(xlsx)
dat=read.xlsx("data.xlsx",sheetIndex=1,rowIndex=rowindex,colIndex=colindex)
sum(dat$Zip*dat$Ext,na.rm=T)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ",destfile="data.csv", method="curl")
b=read.csv("data.csv")
c=b$VAL[(b$VAL==24)]
table(c)

library(XML)
d="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
d1 <- sub('https', 'http', d)
doc<-xmlTreeParse(d1, useInternal=TRUE)
rootNode<-xmlRoot(doc)
e=xpathSApply(rootNode,"//zipcode",xmlValue)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile="data1.csv", method="curl")
DT<-fread("data1.csv")
system.time({
  mean(DT[DT$SEX==1,]$pwgtp15)
  mean(DT[DT$SEX==2,]$pwgtp15)
  })
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time({
  rowMeans(DT)[DT$SEX==1]
  rowMeans(DT)[DT$SEX==2]
  })
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
tapply(DT$pwgtp15,DT$SEX,mean)
DT[,mean(pwgtp15),by=SEX]
mean(DT$pwgtp15,by=DT$SEX)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
sapply(split(DT$pwgtp15,DT$SEX),mean)

as.numberic(a$Height) # coerces other values to become NA
table(a$Height,useNA="ifany") #adds the NA count as well
table(a$Batch,a$Gender)
