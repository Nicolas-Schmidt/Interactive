rm(list=ls());library(tcltk)

entrada1 <- tclVar()
entrada2 <- tclVar()

ventana0 <- tcl("toplevel",".v0")
frametop <- tcl("frame",paste(as.character(ventana0),".ft",sep=""),height=50,width=100,borderwidth=2,relief="raised")
framemiddle <- tcl("frame",paste(as.character(ventana0),".fm",sep=""),height=50,width=100,borderwidth=2,relief="raised")

entrytop <- tcl("entry",paste(as.character(frametop),".entry1",sep=""),textvariable=entrada1)
entrymiddle <- tcl("entry",paste(as.character(framemiddle),".entry2",sep=""),textvariable=entrada2)
buttonmiddle <- tcl("button",paste(as.character(framemiddle),".butt1",sep=""))

buttonFunc <- function(...){
    print(as.integer(tclvalue(entrada1))+as.integer(tclvalue(entrada2)))
}
tcl(buttonmiddle,"configure",command=buttonFunc,text="Calcular suma")

tcl("pack",frametop,side="top")
tcl("pack",framemiddle,side="bottom")
tcl("pack",entrytop)
tcl("pack",entrymiddle)
tcl("pack",buttonmiddle,side="top")
