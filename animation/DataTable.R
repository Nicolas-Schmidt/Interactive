################################################################################
#
# TALLER: DISEÑO DE GRAFICOS INTERACTIVOS CON R
# NICOLAS SCHMIDT - MATHIAS SILVA
# JULIO DE 2017
#
# PACKAGE <<-- DT (Data Table)
#
################################################################################


if (!require('DT')) install.packages('DT'); library('DT')

base <- read.csv(file.choose(), sep=",")

iris2 = iris[c(1:10, 51:60, 101:110), ]
datatable(iris2, filter = 'top', options = list(
        pageLength = 5, autoWidth = TRUE
))


d = data.frame(
        names = rownames(mtcars),
        date = as.Date('2015-03-23') + 1:32,
        time = as.POSIXct('2015-03-23 12:00:00', tz = 'UTC') + (1:32) * 5000,
        stringsAsFactors = FALSE
)

str(d)
## 'data.frame':    32 obs. of  3 variables:
##  $ names: chr  "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
##  $ date : Date, format: "2015-03-24" "2015-03-25" ...
##  $ time : POSIXct, format: "2015-03-23 13:23:20" "2015-03-23 14:46:40" ...
datatable(d, filter = 'bottom', options = list(pageLength = 5))

