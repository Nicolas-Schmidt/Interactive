rm(list=ls());gc();library(tcltk)
tclRequire("BWidget")
#######################
######PARAMETROS#######
#######################


#Frames
buttons_frame1_params<-list(height=50,width=200,borderwidth=2,relief="raised",padx=5,side="left")
buttons_frame2_params<-list(height=50,width=200,borderwidth=2,relief="raised",padx=5,side="top")
buttons_frame3_params<-list(height=50,width=200,borderwidth=2,relief="raised",padx=5,side="bottom")
buttons_frame4_params<-list(height=50,width=200,borderwidth=2,relief="raised",padx=5,side="top")
buttons_frame5_params<-list(height=50,width=200,borderwidth=2,relief="raised",padx=5,side="bottom")
button1_frame_params<-list(height=30,width=100,side="bottom")
button2_frame_params <- list(height=30,width=100,side="top")
button3_frame_params<-list(height=30,width=100,side="left")
button4_frame_params<-list(height=30,width=100,side="right")
button5_frame_params<-list(height=30,width=100,side="bottom")
button6_frame_params<-list(height=30,width=100,side="left")
button7_frame_params<-list(height=30,width=100,side="right")
button8_frame_params<-list(height=30,width=100,side="bottom")
entry1_frame_params<-list(height=100,width=10,side="right")
listbox_frame1_params<-list(height=100,width=100)
listbox_frame2_params<-list(height=100,width=100)
listbox_frame3_params<-list(height=100,width=100)
listbox_frame4_params<-list(height=100,width=100)
MPI_entry_frame_params <- list(height=50,width=100,side="right")
MPI_slider_entry_params <- list(height=50,width=55000,relief="raised",side="top")
MPI_slider_frame_params <- list(height=50,width=100,padx=5,relief="raised",side="left")
scale1_frame_params<-list(height=100,width=200)


#Buttons
button1_params<-list(text="Cerrar",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)
button2_params <- list(text="Examinar...",background="#ffffff",relx=0,rely=0,relwidth=1,relheight=1)
button3_params<-list(text="Seleccionar",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)
button4_params<-list(text="De-seleccionar",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)
button5_params<-list(text="Diccionario",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)
button6_params<-list(text="Seleccionar",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)
button7_params<-list(text="De-seleccionar",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)
button8_params<-list(text="Siguiente",background="#ffffff" , relx=0, rely=0, relwidth=1, relheight=1)

#Listboxes
listbox1_params<-list(selectmode="multiple",yscrollcommand=function(...) tkset(scrollbar1,...))
listbox2_params<-list(selectmode="multiple",yscrollcommand=function(...) tkset(scrollbar2,...))
listbox3_params<-list(selectmode="multiple",yscrollcommand=function(...) tkset(scrollbar3,...))
listbox4_params<-list(selectmode="multiple",yscrollcommand=function(...) tkset(scrollbar4,...))

#Scrollbars
scrollbar1_params<-list(repeatinterval=4,command=function(...) tkyview(listbox1,...),rowspan=4,sticky="nsw") 
scrollbar2_params<-list(repeatinterval=4,command=function(...) tkyview(listbox2,...),rowspan=4,sticky="nsw")
scrollbar3_params<-list(repeatinterval=4,command=function(...) tkyview(listbox3,...),rowspan=4,sticky="nsw")
scrollbar4_params<-list(repeatinterval=4,command=function(...) tkyview(listbox4,...),rowspan=4,sticky="nsw") 

#Labels
label1_params<-list(text="Cargado de V-Dem", side="top")
label2_params<-list(text="Seleccion de variables", side="top")
label3_params <- list(text="Seleccion de paises",side="top")
label4_params <- list(text="Seleccion de parametros",side="top")
MPI_slider_label_params <- list(text="MPI",side="left")

#Scales
scale1_params<-list(from=1,to=10,tickinterval=1,orient="horizontal",length=500)
MPI_slider_params <- list(from=0,to=100,tickinterval=5,orient="horizontal",length=500,side="left")

#Entries
entry1_params<-list(side="right")
MPI_entry_params <- list(side="right")

#wm
window1_params <- list(title="V-Dem App")
window2_params <- list(title="V-Dem App")
window3_params <-  list(title="Diccionario V-Dem")
window4_params <- list(title="V-Dem App")

########################
######EMPAQUETADO#######
########################

#toplevel y objeto de datos auxiliares
window1.data<-list()
window1<-tktoplevel()
tkwm.title(window1,window1_params$title)

#espacio de botones 1
buttons_frame1<-tkframe(window1,height=buttons_frame1_params$height,width=buttons_frame1_params$width,borderwidth=buttons_frame1_params$borderwidth,relief="raised",padx=buttons_frame1_params$padx)
tkpack(buttons_frame1,fill="both",expand="yes",side=buttons_frame1_params$side)

#boton 1
button1_frame<-tkframe(buttons_frame1,height=button1_frame_params$height,width=button1_frame_params$width)
tkpack(button1_frame,side=button1_frame_params$side)

button1<-tkbutton(button1_frame,text=button1_params$text,background=button1_params$background)
tkplace(button1, relx=button1_params$relx,rely=button1_params$rely,relwidth=button1_params$relwidth,relheight=button1_params$relheight)
closer<-function() {
   clc <- function() cat(rep("\n",50))
   tkdestroy(window1)
   clc()
}
tkconfigure(button1,command=closer)

#etiqueta al espacio de botones 1
label1<-tklabel(buttons_frame1,text=label1_params$text)
tkpack(label1,side=label1_params$side)

#boton 2
button2_frame <- tkframe(buttons_frame1,height=button2_frame_params$height,width=button2_frame_params$width)
tkpack(button2_frame,side=button2_frame_params$side)

button2 <- tkbutton(button2_frame,text=button2_params$text,background=button2_params$background)
tkplace(button2, relx=button2_params$relx,rely=button2_params$rely,relwidth=button2_params$relwidth,relheight=button2_params$relheight)
button2.Func <- function(...){
basedir <- tclVar()
basedir <- tkgetOpenFile()
base <<- read.csv(as.character(tclvalue(basedir)))
if(ncol(base)>30){ 
base <<- base[,c("country_name","country_text_id","country_id","year","COWcode","v2x_freexp_thick","v2x_frassoc_thick","v2x_suffr","v2xel_frefair","v2x_elecoff","v2xcl_rol","v2x_jucon","v2xlg_legcon","v2xeg_eqprotec","v2xeg_eqaccess","v2xeg_eqdr","v2x_cspart","v2xdd_dd","v2xel_locelec","v2xel_regelec","v2xel_elecparl","v2xlg_leginter","v2xel_elecpres","v2x_hosinter","v2x_hosabort","v2x_legabort","v2x_pubcorr","v2x_execorr")]
}
tkdestroy(window1)
source("app-vdem-2.r")
    }
tkconfigure(button2,command=button2.Func)

