################################################################################
#
# TALLER: DISEÑO DE GRAFICOS INTERACTIVOS CON R
# NICOLAS SCHMIDT - MATHIAS SILVA
# JULIO DE 2017
#
# PACKAGE <<-- ANIMATION
#
################################################################################


if (!require('animation')) install.packages('animation'); library('animation')

base <- read.csv(file.choose(), sep=",")
base2<-base[base$country_name=="Uruguay",c(which(colnames(base)=="year"),which(colnames(base)=="v2xeg_eqdr"))]

years <- as.vector(base2[,1])
base3 <- matrix(base2$v2xeg_eqdr,
              nrow=length(years),
              ncol=1,
              dimnames = list(years, "v2xeg_eqdr"))
base3 <- t(base3)

nyears <- length(base2$year)
for(i in 1:nyears)
{
        pdf(paste("grafh",i,".pdf",sep=""),height=4,width=6.5)
        x <- base3
        if(i<nyears)
                x[,(i+1):nyears] <- NA
        {plot(x~t(years),
              ylim=c(0,1),
              xlab="",
              ylab="",
              col=2, 
              lwd=2,
              main=paste("Equal distribution of resources index: Uruguay (",years[1]-1+i,")",sep=""), 
              type="l");grid()}
        dev.off()
}




#########################################
# salida HTML
########################################

saveHTML({
        for(i in 1:nyears)
        {
                x <- base3
                if(i<nyears)
                        x[,(i+1):nyears] <- NA
                {plot(x~t(years),
                      ylim=c(0,1),
                      xlab="",
                      ylab="",
                      col=2,
                      lwd=2,
                      main=paste("Equal distribution of resources index: Uruguay (",years[1]-1+i,")",sep=""), 
                      type="l");grid()}
        }
}, htmlfile = "index.html", description = "Equal distribution of resources index: Uruguay ",
ani.height = 500, 
ani.width = 1000,
title = "Equal distribution of resources index: Uruguay ",
interval = 0.03)









