################################################################################
#
# TALLER: DISEÑO DE GRAFICOS INTERACTIVOS CON R
# NICOLAS SCHMIDT - MATHIAS SILVA
# JULIO DE 2017
#
# PACKAGE <<-- GOOGLEVIS
#
################################################################################


if (!require('googleVis')) install.packages('googleVis'); library('googleVis')


base <- read.csv(file.choose(), sep=",")
basegv <- base[base$country_name=="Uruguay",c(which(colnames(base)=="year"),
                                              which(colnames(base)=="v2xeg_eqdr"),
                                              which(colnames(base)=="v2xeg_eqprotec"),
                                              which(colnames(base)=="v2xeg_eqaccess")
                                              )]

nombres <- c("years","var1","var2","var3")
names(basegv) <- nombres

graficoGV <- gvisLineChart(basegv, "years", c("var1","var2","var3"),
                           options=list(
                                   vAxes="[{title:'var1'}, {title:'var2'}, {title:'var3'}]",
                                   width=1000, 
                                   height=500,
                                   title="Equal...",
                                   titleTextStyle="{color:'black',fontName:'Courier',fontSize:16}",
                                   gvis.editor="Editar grafico",
                                   curveType='function'
                                   ))
plot(graficoGV)

