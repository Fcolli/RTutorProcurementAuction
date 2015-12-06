This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

In the paper "Bidding for Incomplete Contracts: An Empirical Analysis of Adaption Costs", written by Patrick Bajari, Stephanie Houghton and Steven Tadelis (2014), the authors examine adaption costs using data about highway construction auctions in California. Their
main finding is that adaption costs are significant and account for up to 14 percent of the winning bid. In this problem set you will be guided through their main findings.  Besides, you will gain knowledge about R and 
economic methods.

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
if (!require(devtools))
  install.packages("devtools")
source_gist("gist.github.com/skranz/fad6062e5462c9d0efe4")
install.rtutor(update.github=TRUE)
  
install_github("Fcolli/RTutorProcurementAuction")
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorProcurementAuction)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorProcurementAuction")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorProcurementAuction",
       load.sav=TRUE, sample.solution=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.
