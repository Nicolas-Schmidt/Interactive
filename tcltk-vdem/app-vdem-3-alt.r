window4 <<- tktoplevel(height=1000,width=1750)
tkwm.title(window4,window4_params$title)

#Frame de slider de parametros
#slider para Multiplicative interaction (MPI es multiplicacion simple entre todas las elegidas. Si slider queda en 0 no hay MPI, si esta entre 0 y 1 su complemento en el intervalo es lo que pondera el Additive)

#Al lado de cada slider, un campo de entrada para ponerle exponente a la variable, por defecto vale 1.
framel <- tcl("frame",paste0(window4$ID,".framel"),width=1000)
framer <- tcl("frame",paste0(window4$ID,".framer"))
tkpack(framel,side="left",fill="both",expand=TRUE)
tkpack(framer,side="right")
label4_frame <- tcl("frame",paste0(as.character(framel),".lab4frame"))
label4 <- tcl("label",paste0(as.character(label4_frame),".lab4"),text="Seleccion de Parametros")
tkgrid(label4_frame,sticky="n")
tkpack(label4,side="left")

source("MPI-slider.r")

label5_frame <- tcl("frame",paste0(as.character(framel),".lab5frame"))
label5 <- tcl("label",paste0(as.character(label5_frame),".lab5l"),text="Variable")
label6 <- tcl("label",paste0(as.character(label5_frame),".lab5c"),text="Coeficiente")
label7 <- tcl("label",paste0(as.character(label5_frame),".lab5r"),text="Exponente")
tkgrid(label5_frame,sticky="ew")
tkpack(label5,side="left",padx=45)
tkpack(label7,side="right",padx=45)
tkpack(label6,side="right",padx=45)


source("scrolled-window-1.r")
tkgrid(scroll_window4,sticky="swe")

source("years-sliders.r")


buttons_frame6 <- tcl("frame",paste0(as.character(framel),".btfr6"),height=50,width=200)
tkgrid(buttons_frame6,sticky="swe")

button9_frame <- tcl("frame",paste0(as.character(buttons_frame6),".bt9f"),height=30,width=100)
tkpack(button9_frame,side="bottom")
button9 <- tcl("button",paste0(as.character(button9_frame),".bt9"),text="Diccionario",background="#ffffff")
tkpack(button9)
button9.Func <- function(...){
source("app-vdem-dicc.r")
    }
tkconfigure(button9,command=button9.Func)

button10_frame <- tcl("frame",paste0(as.character(buttons_frame6),".bt10f"),height=30,width=100)
tkpack(button10_frame,side="top")
button10 <- tcl("button",paste0(as.character(button10_frame),".bt10"),text="Graficar",background="#ffffff")
tkpack(button10)
button10.Func <- function(...){
source("button10Func.r")
    }
tkconfigure(button10,command=button10.Func)

button11_frame <- tcl("frame",paste0(as.character(buttons_frame6),".bt11f"),height=30,width=100)
tkpack(button11_frame,side="bottom")
button11 <- tcl("button",paste0(as.character(button11_frame),".bt11"),text="Ver Serie",background="#ffffff")
tkpack(button11)
button11.Func <- function(...){
source("button11Func.r")
    }
tkconfigure(button11,command=button11.Func)

button12_frame <- tcl("frame",paste0(as.character(buttons_frame6),".bt12f"),height=30,width=100)
tkpack(button12_frame,side="top")
button12 <- tcl("button",paste0(as.character(button12_frame),".bt12"),text="Exportar .csv",background="#ffffff")
tkpack(button12)
button12.Func <- function(...){
source("button12Func.r")
    }
tkconfigure(button12,command=button12.Func)
