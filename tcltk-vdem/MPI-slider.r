    
MPI_slider_entry <- tcl("frame",paste0(as.character(framel),".mpisle"),width=500)

MPI_slider_label <- tcl("label",paste0(as.character(MPI_slider_entry),".mpisll"),text="MPI")

MPI_slider_frame <- tcl("frame",paste0(as.character(MPI_slider_entry),".mpislf"),width=100)

MPI_slider_val <- tclVar()

MPI_slider <- tcl("scale",paste0(as.character(MPI_slider_frame),".mpisl"),from=0,to=100,tickinterval=10,orient="horizontal",length=450,variable=MPI_slider_val)

tkgrid(MPI_slider_entry,sticky="n")

tkpack(MPI_slider_label,side="left")

tkpack(MPI_slider_frame,side="left")

tkpack(MPI_slider,side="left")
