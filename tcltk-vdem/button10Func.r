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

png(filename="indexplot.PNG")
#par(xpd=T)
plot(seq(year1,year2,1),country.series[which(apply(t(apply(country.series,1,is.na)),1,sum)==0),][1,],xlab="Año",ylab="Indice",type="l",ylim=c(0,1),xlim=c(year1,year2))

linecolors <- sample(terrain.colors(1000),size=nrow(country.series),replace=T)

for(l in 1:nrow(country.series)){
lines(seq(year1,year2,1),country.series[l,],col=linecolors[l])
    }
#legend(2020,-0.5,c("group A", "group B"), pch = c(1,2), lty = c(1,2))
dev.off()
image1 <- tclVar()
tkimage.create("photo",image1,file="indexplot.PNG")
#index.plot <- tcl("label",paste0(as.character(framer),".image"),image=image1)
if(exists("index.plot")==TRUE){
tcl("destroy",as.character(index.plot))
rm(index.plot)
index.plot <- tcl("label",paste0(as.character(framer),".image"),image=image1)
tkpack(index.plot)
}
if(exists("index.plot")==FALSE){
index.plot <- tcl("label",paste0(as.character(framer),".image"),image=image1)    
tkpack(index.plot)
    }
