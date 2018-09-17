delta <- as.integer(tclvalue(MPI_slider_val))/100

year1 <- min(as.integer(tclvalue(year1_slider_val)),as.integer(tclvalue(year2_slider_val)))

year2 <- max(as.integer(tclvalue(year1_slider_val)),as.integer(tclvalue(year2_slider_val)))

var.weights <- c()
for(i in 1:length(variables.selected)){
    var.weights[i] <- as.integer(tclvalue(eval(as.name(paste("slider",i,"_val",sep="")))))
}
sum.weights <- sum(var.weights)
for(i in 1:length(variables.selected)){
var.weights[i] <- var.weights[i]/sum.weights
    }

var.exponents <- c()
for(i in 1:length(variables.selected)){
    var.exponents[i] <- as.integer(tclvalue(eval(as.name(paste("entry",i,"_var",sep="")))))
}

country.series <- data.frame()
year.series <- seq(year1,year2,1)
for(k in 1:length(countries.selected)){
    for(j in 1:length(year.series)){
        if(year.series[j]%in%base[which(base$country_name==as.character(countries.selected[k])),"year"]){
country.series[k,j] <- (1-delta)*sum((base[which(base$country_name==as.character(countries.selected[k]) & base$year==as.integer(year.series[j])),colnames(base)%in%variables.selected]**var.exponents)*var.weights)+(delta*prod(base[which(base$country_name==as.character(countries.selected[k]) & base$year==as.integer(year.series[j])),colnames(base)%in%variables.selected]))
        }
        else{
country.series[k,j] <- NA
            }
    }
}

row.names(country.series) <- countries.selected
colnames(country.series) <- year.series

View(country.series)
