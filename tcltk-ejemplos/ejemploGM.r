rm(list=ls())
library(tcltk)

window0 <- tcl("toplevel", ".tl")

button1_frame <- tcl("frame",paste(as.character(window0),".b1f",sep=""),height=50,width=100,borderwidth=2,relief="raised")

frame2 <- tcl("frame",paste(as.character(window0),".b2f",sep=""),height=50,width=100,borderwidth=2,relief="raised")

button1 <- tcl("button",paste(as.character(button1_frame),".b1",sep=""),text="Boton de Ejemplo",command=function(...){tcl("destroy",as.character(window0))})

button2 <- tcl("button",paste(as.character(button1_frame),".b2",sep=""),text="Boton de Ejemplo 2",command=function(...){tcl("destroy",as.character(window0))})

label1 <- tcl("label",paste(as.character(frame2),".l1",sep=""),text="Presione un botón")

tcl("grid",button1_frame,column=3,row=3)
tcl("grid",frame2,column=3,row=1)
tcl("pack",button1,side="top")
tcl("pack",button2,side="bottom")
tcl("pack",label1,side="right")
