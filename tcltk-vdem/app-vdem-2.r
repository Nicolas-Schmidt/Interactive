window2 <<- tktoplevel()
tkwm.title(window2,window2_params$title)

#Frame de seleccion de variables (izquierda)
variables_frame <- tkframe(window2)
tkpack(variables_frame,side="left")

#etiqueta al frame de variables
label2<-tklabel(variables_frame,text=label2_params$text)
tkpack(label2,side=label2_params$side)

#Frame de seleccion de paises (centro)
countries_frame <- tkframe(window2)
tkpack(countries_frame,side="right")

#etiqueta al frame de paises
label3<-tklabel(countries_frame,text=label3_params$text)
tkpack(label3,side=label3_params$side)

#listbox frame 1
listbox_frame1<-tkframe(variables_frame,height=listbox_frame1_params$height,width=listbox_frame1_params$width)
tkpack(listbox_frame1)

#scrollbar 1
scrollbar1 <- tkscrollbar(listbox_frame1, repeatinterval=scrollbar1_params$repeatinterval,command=scrollbar1_params$command)

#listbox 1
listbox1<-tklistbox(listbox_frame1,selectmode=listbox1_params$selectmode,yscrollcommand=listbox1_params$yscrollcommand)
tkgrid(listbox1,scrollbar1)
tkgrid.configure(scrollbar1,rowspan=scrollbar1_params$rowspan,sticky=scrollbar1_params$sticky)

for(variable in colnames(base)[grep("v2x",colnames(base))]){
tkinsert(listbox1,"end",variable)
}

#listbox frame 2
listbox_frame2<-tkframe(variables_frame,height=listbox_frame2_params$height,width=listbox_frame2_params$width)
tkpack(listbox_frame2)

#scrollbar 2
scrollbar2 <- tkscrollbar(listbox_frame2, repeatinterval=scrollbar2_params$repeatinterval,command=scrollbar2_params$command)

#listbox 2
listbox2<-tklistbox(listbox_frame2,selectmode=listbox2_params$selectmode,yscrollcommand=listbox2_params$yscrollcommand)
tkgrid(listbox2,scrollbar2)
tkgrid.configure(scrollbar2,rowspan=scrollbar2_params$rowspan,sticky=scrollbar2_params$sticky)

#espacio de botones 2
buttons_frame2<-tkframe(variables_frame,height=buttons_frame2_params$height,width=buttons_frame2_params$width,borderwidth=buttons_frame2_params$borderwidth,relief="raised",padx=buttons_frame2_params$padx)
tkpack(buttons_frame2,fill="both",expand="yes",side=buttons_frame2_params$side)

#boton 3
button3_frame<-tkframe(buttons_frame2,height=button3_frame_params$height,width=button3_frame_params$width)
tkpack(button3_frame,side=button3_frame_params$side)

button3<-tkbutton(button3_frame,text=button3_params$text,background=button3_params$background)
tkplace(button3, relx=button3_params$relx,rely=button3_params$rely,relwidth=button3_params$relwidth,relheight=button3_params$relheight)

button3.Func<-function(){
selects1<-as.integer(tkcurselection(listbox1))
for(i in selects1){
if(as.character(tkget(listbox1,i))%in%as.character(tkget(listbox2,0,"end"))==FALSE){
tkinsert(listbox2,"end",tkget(listbox1,i))
}
}
}
tkconfigure(button3,command=button3.Func)

#boton 4
button4_frame<-tkframe(buttons_frame2,height=button4_frame_params$height,width=button4_frame_params$width)
tkpack(button4_frame,side=button4_frame_params$side)

button4<-tkbutton(button4_frame,text=button4_params$text,background=button4_params$background)
tkplace(button4, relx=button4_params$relx,rely=button4_params$rely,relwidth=button4_params$relwidth,relheight=button4_params$relheight)

button4.Func<-function(){
l.selects2<-length(as.integer(tkcurselection(listbox2)))
selects2.aux<-list()
for(j in 1:l.selects2){
selects2.aux[[j]]<-as.integer(tkcurselection(listbox2))
tkdelete(listbox2,selects2.aux[[j]][1])
}
}
tkconfigure(button4,command=button4.Func)

#Espacio de botones 3
buttons_frame3<-tkframe(variables_frame,height=buttons_frame3_params$height,width=buttons_frame3_params$width,borderwidth=buttons_frame3_params$borderwidth,relief="raised",padx=buttons_frame3_params$padx)
tkpack(buttons_frame3,fill="both",expand="yes",side=buttons_frame3_params$side)

#Boton 5
button5_frame <- tkframe(buttons_frame3,height=button5_frame_params$height,width=button5_frame_params$width)
tkpack(button5_frame,side=button5_frame_params$side)

button5 <- tkbutton(button5_frame,text=button5_params$text,background=button5_params$background)
tkplace(button5,relx=button5_params$relx,rely=button5_params$rely,relwidth=button5_params$relwidth,relheight=button5_params$relheight)

button5.Func <- function(...){
source("app-vdem-dicc.r")
}

tkconfigure(button5,command=button5.Func)

#listbox frame 3
listbox_frame3<-tkframe(countries_frame,height=listbox_frame3_params$height,width=listbox_frame3_params$width)
tkpack(listbox_frame3)

#scrollbar 3
scrollbar3 <- tkscrollbar(listbox_frame3, repeatinterval=scrollbar3_params$repeatinterval,command=scrollbar3_params$command)

#listbox 3
listbox3<-tklistbox(listbox_frame3,selectmode=listbox3_params$selectmode,yscrollcommand=listbox3_params$yscrollcommand)
tkgrid(listbox3,scrollbar3)
tkgrid.configure(scrollbar3,rowspan=scrollbar3_params$rowspan,sticky=scrollbar3_params$sticky)

for(country in levels(as.factor(base$country_name))){
tkinsert(listbox3,"end",country)
}

#listbox frame 4
listbox_frame4<-tkframe(countries_frame,height=listbox_frame4_params$height,width=listbox_frame4_params$width)
tkpack(listbox_frame4)

#scrollbar 4
scrollbar4 <- tkscrollbar(listbox_frame4, repeatinterval=scrollbar4_params$repeatinterval,command=scrollbar4_params$command)

#listbox 4
listbox4<-tklistbox(listbox_frame4,selectmode=listbox4_params$selectmode,yscrollcommand=listbox4_params$yscrollcommand)
tkgrid(listbox4,scrollbar4)
tkgrid.configure(scrollbar4,rowspan=scrollbar4_params$rowspan,sticky=scrollbar4_params$sticky)

#espacio de botones 4
buttons_frame4<-tkframe(countries_frame,height=buttons_frame4_params$height,width=buttons_frame4_params$width,borderwidth=buttons_frame4_params$borderwidth,relief="raised",padx=buttons_frame4_params$padx)
tkpack(buttons_frame4,fill="both",expand="yes",side=buttons_frame4_params$side)

#boton 6
button6_frame<-tkframe(buttons_frame4,height=button6_frame_params$height,width=button6_frame_params$width)
tkpack(button6_frame,side=button6_frame_params$side)

button6<-tkbutton(button6_frame,text=button6_params$text,background=button6_params$background)
tkplace(button6, relx=button6_params$relx,rely=button6_params$rely,relwidth=button6_params$relwidth,relheight=button6_params$relheight)

button6.Func<-function(){
selects3<-as.integer(tkcurselection(listbox3))
for(i in selects3){
if(as.character(tkget(listbox3,i))%in%as.character(tkget(listbox4,0,"end"))==FALSE){
tkinsert(listbox4,"end",tkget(listbox3,i))
}
}
}
tkconfigure(button6,command=button6.Func)

#boton 7
button7_frame<-tkframe(buttons_frame4,height=button7_frame_params$height,width=button7_frame_params$width)
tkpack(button7_frame,side=button7_frame_params$side)

button7<-tkbutton(button7_frame,text=button7_params$text,background=button7_params$background)
tkplace(button7, relx=button7_params$relx,rely=button7_params$rely,relwidth=button7_params$relwidth,relheight=button7_params$relheight)

button7.Func<-function(){
l.selects4<-length(as.integer(tkcurselection(listbox4)))
selects4.aux<-list()
for(j in 1:l.selects4){
selects4.aux[[j]]<-as.integer(tkcurselection(listbox4))
tkdelete(listbox4,selects4.aux[[j]][1])
}
}
tkconfigure(button7,command=button7.Func)

#Espacio de botones 5
buttons_frame5<-tkframe(countries_frame,height=buttons_frame5_params$height,width=buttons_frame5_params$width,borderwidth=buttons_frame5_params$borderwidth,relief="raised",padx=buttons_frame5_params$padx)
tkpack(buttons_frame5,fill="both",expand="yes",side=buttons_frame5_params$side)

#Boton 8
button8_frame <- tkframe(buttons_frame5,height=button8_frame_params$height,width=button8_frame_params$width)
tkpack(button8_frame,side=button8_frame_params$side)

button8 <- tkbutton(button8_frame,text=button8_params$text,background=button8_params$background)
tkplace(button8,relx=button8_params$relx,rely=button8_params$rely,relwidth=button8_params$relwidth,relheight=button8_params$relheight)

button8.Func <- function(...){
variables.selected <<- as.character(tkget(listbox2,0,"end"))
countries.selected <<- as.character(tkget(listbox4,0,"end"))
tkdestroy(window2)
source("app-vdem-3-alt.r")
}

tkconfigure(button8,command=button8.Func)

