scroll_window4 <- tcl("ScrolledWindow",paste0(as.character(framel),".scw1"),scrollbar="vertical",sides="ws",relief="sunken")
scroll_frame1 <- tcl("ScrollableFrame",paste0(as.character(scroll_window4),".sf1"))
tcl(scroll_window4,"setwidget",scroll_frame1)

sliders_frame <- tcl("frame",paste0(as.character(tcl(scroll_frame1,"getframe")),".slf"),width=100,relief="sunken")
tkpack(sliders_frame,side="left")

for(i in 1:length(variables.selected)){

assign(paste("slider_entry",i,"_frame",sep=""),tcl("frame",paste0(as.character(sliders_frame),paste(".sefr",i,sep="")),height=50,width=500,relief="sunken"))

assign(paste("slider",i,"_label",sep=""),tcl("label",paste0(as.character(eval(as.name(paste("slider_entry",i,"_frame",sep="")))),paste(".label",i,sep="")),text=as.character(variables.selected[i])))

assign(paste("slider",i,"_frame",sep=""),tcl("frame",paste(as.character(eval(as.name(paste("slider_entry",i,"_frame",sep="")))),paste(".slif",i,sep=""),sep=""),width=100,height=50,padx=5,relief="sunken"))

assign(paste("slider",i,"_val",sep=""),tclVar())

assign(paste("slider",i,sep=""),tcl("scale",paste(as.character(eval(as.name(paste("slider",i,"_frame",sep="")))),paste("scale",i,sep=""),sep=""),from=0,to=100,tickinterval=25,orient="horizontal",length=250,variable=eval(as.name(paste("slider",i,"_val",sep="")))))


assign(paste("entry",i,"_frame",sep=""),tcl("frame",paste(as.character(eval(as.name(paste("slider_entry",i,"_frame",sep="")))),paste(".entfr",i,sep=""),sep=""),height=50,width=5,relief="sunken"))

assign(paste("entry",i,"_var",sep=""),tclVar(1))

assign(paste("entry",i,sep=""),tcl("entry",paste(as.character(eval(as.name(paste("entry",i,"_frame",sep="")))),paste(".entry",i,sep=""),sep=""),textvariable=eval(as.name(paste("entry",i,"_var",sep=""))),width=5))
    
tkpack(eval(as.name(paste("slider_entry",i,"_frame",sep=""))),side="bottom")
tkpack(eval(as.name(paste("slider",i,"_label",sep=""))),side="left")
tkpack(eval(as.name(paste("slider",i,"_frame",sep=""))),side="right")
tkpack(eval(as.name(paste("slider",i,sep=""))),side="left")
tkpack(eval(as.name(paste("entry",i,"_frame",sep=""))),side="right")
tkpack(eval(as.name(paste("entry",i,sep=""))),side="right")
}
