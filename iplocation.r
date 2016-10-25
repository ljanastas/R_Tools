iplocation <- function(ip=""){
  response    <- readLines(paste("http://www.datasciencetoolkit.org/ip2coordinates/",ip,sep=""))
  success     <- !any(grepl("null",response))

  ip <- grep("[[:digit:]]*\\.[[:digit:]]*\\.[[:digit:]]*\\.[[:digit:]]*",response,value=T)
    match <- regexpr("[[:digit:]]*\\.[[:digit:]]*\\.[[:digit:]]*\\.[[:digit:]]*",ip)
    ip <- substr(ip,match,as.integer(attributes(match)[1])+match-1)
  if(success==T){
    extract <- function(label,response){
            text <- grep(label,response,value=T)
            match <- regexpr(paste('"',label,'"',": ",sep=""),text)
            text <- substr(text,match+as.integer(attributes(match)[1]),nchar(text))
            if(grepl("[[:digit:]]",text)){
                    text <- substr(text,1,nchar(text)-2)
            }else{
                    text <- substr(text,2,nchar(text)-2)
                }
            if( regexpr('"',text)!= -1){
                text<-substr(text,2,nchar(text))
            }
            print(text)
            text
        }
  }
  RESULT <- list()
  RESULT$success     <- success
  RESULT$ip          <- ip
  if(success==T){

      RESULT$latitude    <- as.numeric(extract("latitude",response))
      RESULT$longitude   <- as.numeric(extract("longitude",response))
      RESULT$country     <- extract("country_name",response)
      RESULT$locality    <- extract("locality",response)
      RESULT$postalcode  <- extract("postal_code",response)
      RESULT$region      <- extract("region",response)
      RESULT$countrycode <- extract("country_code3",response)

  }
  RESULT
}
