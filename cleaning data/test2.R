# Item1

library(httr)



# 1. Find OAuth settings for github:

#    http://developer.github.com/v3/oauth/

oauth_endpoints("github")



# 2. Register an application at https://github.com/settings/applications;

#    Use any URL you would like for the homepage URL (http://github.com is fine)

#    and http://localhost:1410 as the callback url

#

#    Insert your client ID and secret below - if secret is omitted, it will

#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.

myapp <- oauth_app("github", "c1be6e4ad2360350e8da","e936025550a5823abcc98beeefedc64f253fe383")



# 3. Get OAuth credentials

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)



# 4. Use API

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/repos/jtleek/datasharing", gtoken)

stop_for_status(req)

content(req)

json1=content(req)
install.packages("jsonlite")
library(jsonlite)
json2=jsonlite::fromJSON(toJSON(json1))

# # # OR:

# req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))

# stop_for_status(req)

# content(req)

# Item4
library(XML)
url1="http://biostat.jhsph.edu/~jleek/contact.html"
file = url(url1)
html = readLines(file)
a=html[c(10,20,30,100)]
b=lapply(a,nchar)
unlist(b)

#item 5
a=read.fwf("getdata-wksst8110.for",100)
b=a[c(5:1258),]
b=as.character(b)
c=substr(b,29,32)
c=as.numeric(c)
d=sum(c)
