#item1
#b=a[a$ACR==3 & a$AGS==6,]
agricultureLogical=(a$ACR==3 & a$AGS==6)
which(agricultureLogical)
#item2
library(jpeg)
a=readJPEG("getdata-jeff.jpg", native=TRUE)
quantile(a, probs=c(0.3,0.8))
#item3
a=read.csv("getdata%2Fdata%2FGDP.csv")
a$Gross.domestic.product.2012=as.numeric(as.character(a$Gross.domestic.product.2012))
b=a[(!is.na(a$Gross.domestic.product.2012)),]
c=read.csv("getdata%2Fdata%2FEDSTATS_Country.csv")
length(intersect(b$X,c$CountryCode))
d=merge(b,c,by.x= "X",by.y="CountryCode", all=T)
e=d[order(d$Gross.domestic.product.2012, decreasing = T),]
e[13,]

#item4
f=d[(d$Income.Group=="High income: OECD"),]
g=d[(d$Income.Group=="High income: nonOECD"),]
mean(f$Gross.domestic.product.2012, na.rm=TRUE)
mean(g$Gross.domestic.product.2012, na.rm=TRUE)

#item5
d$GDPRankGroups=cut(d$Gross.domestic.product.2012, breaks=quantile(d$Gross.domestic.product.2012,na.rm=T))
e=d[order(d$Gross.domestic.product.2012),]
table(e$Income.Group)
sum(e$Income.Group=='Lower middle income'&e$Gross.domestic.product.2012<=38,na.rm=T)
