################################################################################
#
# TALLER: DISEÑO DE GRAFICOS INTERACTIVOS CON R
# NICOLAS SCHMIDT - MATHIAS SILVA
# JULIO DE 2017
#
# PACKAGE <<-- DYGRAPHS
#
################################################################################


if (!require('dygraphs')) install.packages('dygraphs'); library('dygraphs')
if (!require('magrittr')) install.packages('magrittr'); library('magrittr')
base <- read.csv(file.choose(), sep=",")
base2<-base[base$country_name=="Uruguay",]
colnames(base2)[15:17]<-c("Equal protection index",
                          "Equal access index",
                          "Equal dist. of resources index")
dygraph(base2[,c(5,15:17)], main = "Uruguay:1900-2016")%>% 
        dyRangeSelector(dateWindow = c("1930", "1970"))%>%
        dyUnzoom() %>% 
        dyCrosshair(direction = "vertical")


#dygraph(base2[,c(5,15:17)], main = "Uruguay:1900-2016")%>% 
#        dyRangeSelector(dateWindow = c("1930", "1970"))%>%
#        dyOptions(fillGraph = TRUE, fillAlpha = 0.1)

