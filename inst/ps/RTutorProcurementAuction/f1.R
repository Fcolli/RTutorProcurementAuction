
reg.summary = function(...,digits=4){
  library(stargazer)
    stargazer(..., 
            type = "html", 
            style = "aer",  
            digits = digits,
            df = FALSE,
            report = "vct*",
            star.cutoffs = c(0.05, 0.01, 0.001),
            model.names = FALSE,
            object.names = TRUE,
            model.numbers = FALSE, 
            omit.stat = c("adj.rsq", "f", "ser")
    )
} 


tab.summary = function(...,digits=4){
  library(stargazer)
  stargazer(...,
            summary = TRUE,
            type = "text",
            digit.separator = "", 
            style = "aer",
            digits = digits
  )
}


iv.formula = function(){
  a1="Nbidtotal_act ~ dist100 + rivaldist100 + fringe + nbidders | 0 |"
  a2=paste("(NPosAdj | NNegAdj | NEX | NDed | NOverrun ~ ", paste(res1, collapse= "+"))
  a3=")| c"
  a=paste(a1,a2,a3)
  outp=as.formula(paste(a1,a2,a3))
}

iv.formula.felm = function(){
  a1="gamma ~nbidders | 0 |"
  res1 = paste("re", 2:335, sep="")
  a2=paste("(NPosAdj | NNegAdj | NEX | NDed | NOverrun ~ ", paste(res1, collapse= "+"))
  a3=")| c"
  a=paste(a1,a2,a3)
  outp=as.formula(paste(a1,a2,a3))
}


present.map=function(){
  library(leaflet)
  library(XML)
  addr1 <- '1764 SKYWAY / CHICO, USA' 
  url = paste('http://maps.google.com/maps/api/geocode/xml?address=', addr1,'&sensor=false',sep='') 
  doc = xmlTreeParse(url) 
  root = xmlRoot(doc) 
  lat1 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lat']])) 
  long1 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lng']])) 
  
  addr2 <- 'PO BOX 5475 / SHASTA LAKE, USA' 
  url = paste('http://maps.google.com/maps/api/geocode/xml?address=', addr2,'&sensor=false',sep='') 
  doc = xmlTreeParse(url) 
  root = xmlRoot(doc) 
  lat2 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lat']])) 
  long2 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lng']])) 
  
  addr3 <- 'PO BOX 1300 / SUSANVILLE, USA' 
  url = paste('http://maps.google.com/maps/api/geocode/xml?address=', addr3,'&sensor=false',sep='') 
  doc = xmlTreeParse(url) 
  root = xmlRoot(doc) 
  lat3 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lat']])) 
  long3 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lng']])) 
  
  addr4 <- 'PLUMAS COUNTY 89, USA'
  url = paste('http://maps.google.com/maps/api/geocode/xml?address=', addr4,'&sensor=false',sep='')  
  doc = xmlTreeParse(url) 
  root = xmlRoot(doc) 
  lat4 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lat']])) 
  long4 = as.numeric(xmlValue(root[['result']][['geometry']][['location']][['lng']])) 
  lat4=40.278679
  long4=-121.253681
  
  #sty.1 <- styleSingle(col="green", fill="green")
  #sty.2 <- styleSingle(col="brown", fill="brown", rad=3)
  #style=list(sty.1, sty.1, sty.1, sty.2)
  
  m <- leaflet() %>%
    addTiles() %>%  # Add default OpenStreetMap map tiles
    addCircleMarkers(lng=c(long1,long2,long3,long4), lat=c(lat1,lat2,lat3,lat4), fillColor= c('blue', 'blue', 'blue', 'red') , color=c('blue', 'blue', 'blue', 'red'),
                     popup=c("BALDWIN CONTRACTING COMPANY INC","ARCADIAN ENTERPRISES","MILLERS CUSTOM WORK INC","Cross of Higway 89 and 36"))
  m
  
  return (m)
}