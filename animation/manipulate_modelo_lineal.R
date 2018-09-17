################################################################################
#
# TALLER: DISEÑO DE GRAFICOS INTERACTIVOS CON R
# NICOLAS SCHMIDT - MATHIAS SILVA
# JULIO DE 2017
#
# PACKAGE <<-- MANIPULATE - modelo lineal simple
#
################################################################################


if (!require('manipulate')) install.packages('manipulate'); library('manipulate')
base <- read.csv(file.choose(), sep=",")

vec1 <- c( "Freedom of association index", 
           "Share of population whit suffrage",
           "Clean election index","Elected officials index",
           "Equality before the law and individual liberty index",
           "Judicial constraints on the executive index","
           Legislative constraints on the executive index",
           "Equal protection index",
           "Equal access index",
           "Equal distribution of resources index",
           "Civil society participation index",
           "Direct popular vote index",
           "Local government index",
           "Regional government index",
           "Legislative or constituent assambly election",
           "Legislature closed down or aborted",
           "Presidential election",
           "Chief executive no longer electede",
           "Presidential election aborted",
           "Legislative or constituent assembly election aborted",
           "Public sector corruptiion index",
           "Executive corruption index" )
vec2 <- c( "v2x_frassoc_thick", "v2x_suffr", "v2xel_frefair","v2x_elecoff",
           "v2xcl_rol","v2x_jucon","v2xlg_legcon","v2xeg_eqprotec","v2xeg_eqaccess",
           "v2xeg_eqdr","v2x_cspart","v2xdd_dd","v2xel_locelec","v2xel_regelec",
           "v2xel_elecparl","v2xlg_leginter","v2xel_elecpres","v2x_hosinter",
           "v2x_hosabort","v2x_legabort","v2x_pubcorr","v2x_execorr" )
nombres <- data.frame("variable" = vec2, "etiqueta" = vec1)


manipulate({
        modelo<-lm(base[base$country_name==pais,variabley] ~ base[base$country_name==pais, variablex])
        r<-summary(modelo)
        par(col.axis = "gray60", fg = "gray60", col = "gray30", bty = "n",
            mar = c(5.5, 5.5, 5.5, 5.5))
        plot(base[base$country_name==pais,variabley] ~ base[base$country_name==pais, variablex],
             main = paste(pais, ": 1900-2016", "(", expression(R^2),"=", round(r$r.squared,3), ")"),
             pch=16, 
             col=1,
             ylab=nombres[nombres$variable==variabley, "etiqueta"],
             xlab=nombres[nombres$variable==variablex, "etiqueta"])
        abline(modelo, col=2, lwd=1.5)
        grid()
        },
        variabley = picker("Freedom of association index" = "v2x_frassoc_thick", 
                   "Share of population whit suffrage" = "v2x_suffr", 
                   "Clean election index" = "v2xel_frefair",
                   "Elected officials index" = "v2x_elecoff",
                   "Equality before the law and individual liberty index" = "v2xcl_rol",
                   "Judicial constraints on the executive index" = "v2x_jucon",
                   "Legislative constraints on the executive index" = "v2xlg_legcon",
                   "Equal protection index" = "v2xeg_eqprotec",
                   "Equal access index" = "v2xeg_eqaccess",
                   "Equal distribution of resources index" = "v2xeg_eqdr",
                   "Civil society participation index" = "v2x_cspart",
                   "Direct popular vote index" = "v2xdd_dd",
                   "Local government index" = "v2xel_locelec",
                   "Regional government index" = "v2xel_regelec",
                   "Legislative or constituent assambly election" = "v2xel_elecparl",
                   "Legislature closed down or aborted" =  "v2xlg_leginter",
                   "Presidential election" = "v2xel_elecpres",
                   "Chief executive no longer electede" = "v2x_hosinter",
                   "Presidential election aborted" = "v2x_hosabort",
                   "Legislative or constituent assembly election aborted" = "v2x_legabort",
                   "Public sector corruptiion index" = "v2x_pubcorr",
                   "Executive corruption index" = "v2x_execorr"),
        variablex = picker("Freedom of association index" = "v2x_frassoc_thick", 
                   "Share of population whit suffrage" = "v2x_suffr", 
                   "Clean election index" = "v2xel_frefair",
                   "Elected officials index" = "v2x_elecoff",
                   "Equality before the law and individual liberty index" = "v2xcl_rol",
                   "Judicial constraints on the executive index" = "v2x_jucon",
                   "Legislative constraints on the executive index" = "v2xlg_legcon",
                   "Equal protection index" = "v2xeg_eqprotec",
                   "Equal access index" = "v2xeg_eqaccess",
                   "Equal distribution of resources index" = "v2xeg_eqdr",
                   "Civil society participation index" = "v2x_cspart",
                   "Direct popular vote index" = "v2xdd_dd",
                   "Local government index" = "v2xel_locelec",
                   "Regional government index" = "v2xel_regelec",
                   "Legislative or constituent assambly election" = "v2xel_elecparl",
                   "Legislature closed down or aborted" =  "v2xlg_leginter",
                   "Presidential election" = "v2xel_elecpres",
                   "Chief executive no longer electede" = "v2x_hosinter",
                   "Presidential election aborted" = "v2x_hosabort",
                   "Legislative or constituent assembly election aborted" = "v2x_legabort",
                   "Public sector corruptiion index" = "v2x_pubcorr",
                   "Executive corruption index" = "v2x_execorr"),
        pais  = picker(as.list(levels(base$country_name)))
)
























































