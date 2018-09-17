rm(list=ls());library(tcltk)
#addTclPath("ruta/hasta/bwidget-1.9.10")
tclRequire("BWidget")

window0 <- tcl("toplevel",".tl0",height=250,width=250)

scroll_win1 <- tcl("ScrolledWindow",paste(as.character(window0),".sw1",sep=""))
scroll_frame1 <- tcl("ScrollableFrame",paste(as.character(scroll_win1),".sf1",sep=""))

tcl(scroll_win1,"setwidget",scroll_frame1)

png(filename="plot1.png",width=1000,height=1000)
plot(rnorm(100),rnorm(100))
dev.off()

imagen1 <- tcl("image","create","photo",file="plot1.png")
labelimage1 <- tcl("label",paste(as.character(tcl(scroll_frame1,"getframe")),".im1",sep=""),image=imagen1)                   
tcl("pack",labelimage1)
tcl("pack",scroll_win1)
