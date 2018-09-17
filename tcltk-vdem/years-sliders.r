year1_slider_entry <- tcl("frame",paste0(as.character(framel),".y1sle"),width=500)

year1_slider_label <- tcl("label",paste0(as.character(year1_slider_entry),".y1sll"),text="Año Inicial")

year1_slider_frame <- tcl("frame",paste0(as.character(year1_slider_entry),".y1slf"),width=100)

year1_slider_val <- tclVar()

year1_slider <- tcl("scale",paste0(as.character(year1_slider_frame),".y1sl"),from=min(base$year),to=max(base$year),tickinterval=25,orient="horizontal",length=450,variable=year1_slider_val)

tkgrid(year1_slider_entry,sticky="n")

tkpack(year1_slider_label,side="left")

tkpack(year1_slider_frame,side="left")

tkpack(year1_slider,side="left")

year2_slider_entry <- tcl("frame",paste0(as.character(framel),".y2sle"),width=500)

year2_slider_label <- tcl("label",paste0(as.character(year2_slider_entry),".y2sll"),text="Año Final")

year2_slider_frame <- tcl("frame",paste0(as.character(year2_slider_entry),".y2slf"),width=100)

year2_slider_val <- tclVar()

year2_slider <- tcl("scale",paste0(as.character(year2_slider_frame),".y2sl"),from=min(base$year),to=max(base$year),tickinterval=25,orient="horizontal",length=450,variable=year2_slider_val)

tkgrid(year2_slider_entry,sticky="n")

tkpack(year2_slider_label,side="left")

tkpack(year2_slider_frame,side="left")

tkpack(year2_slider,side="left")
