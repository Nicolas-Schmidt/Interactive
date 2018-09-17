rm(list=ls())
library(tcltk)

window0 <-tktoplevel()

button1_frame <- tkframe(parent=window0,height=50,width=100,borderwidth=2,relief="raised")

button1 <- tkbutton(parent=button1_frame,text="Boton de Ejemplo")

tkpack(button1_frame)
tkpack(button1)

tkconfigure(button1,command=function(...){tkdestroy(window0)})

