rm(list=ls())
library(tcltk)

window0 <- tcl("toplevel", ".tl")

button1_frame <- tcl("frame",paste(as.character(window0),".b1f",sep=""),height=50,width=100,borderwidth=2,relief="raised")

button1 <- tcl("button",paste(as.character(button1_frame),".b1",sep=""),text="Boton de Ejemplo",command=function(...){tcl("destroy",as.character(window0))})

tcl("pack",button1_frame)
tcl("pack",button1)

