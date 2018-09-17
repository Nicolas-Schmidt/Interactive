window3 <<- tktoplevel()
tkwm.title(window3,window3_params$title)

variables<-as.character(colnames(base)[grep("v2x",colnames(base))])
reference.Func <- function(x){
    if(as.character(x)=="v2x_freexp_thick"){
return("Expanded freedom of expression index")
        }
    if(as.character(x)=="v2x_frassoc_thick"){
return("Freedom of association index")
        }
    if(as.character(x)=="v2x_suffr"){
return("Share of population with suffrage")
    }
    if(as.character(x)=="v2xel_frefair"){
return("Clean elections index")
    }
    if(as.character(x)=="v2x_elecoff"){
return("Elected officials index")
    }
    if(as.character(x)=="v2xcl_rol"){
return("Equality before the law and individual liberty index")
    }
    if(as.character(x)=="v2x_jucon"){
return("Judicial constraints on the executive index")
    }
    if(as.character(x)=="v2xlg_legcon"){
return("Legislative constraints on the executive index")
    }
    if(as.character(x)=="v2xeg_eqprotec"){
return("Equal protection index")
    }
    if(as.character(x)=="v2xeg_eqaccess"){
return("Equal access index")
    }
    if(as.character(x)=="v2xeg_eqdr"){
return("Equal distribution of resources index")
    }
    if(as.character(x)=="v2x_cspart"){
return("Civil society participation index")
    }
    if(as.character(x)=="v2xdd_dd"){
return("Direct popular vote index")
    }
    if(as.character(x)=="v2xel_locelec"){
return("Local government index")
    }
    if(as.character(x)=="v2xel_regelec"){
return("Regional government index")
    }
    if(as.character(x)=="v2xel_elecparl"){
return("Legislative or constituent assembly election")
    }
    if(as.character(x)=="v2xlg_leginter"){
return("Legislature closed down or aborted")
    }
    if(as.character(x)=="v2xel_elecpres"){
return("Presidential election")
    }
    if(as.character(x)=="v2x_hosinter"){
return("Chief executive no longer elected")
    }
    if(as.character(x)=="v2x_hosabort"){
return("Presidential election aborted")
    }
    if(as.character(x)=="v2x_legabort"){
return("Legislative or constituent assembly election aborted")
    }
    if(as.character(x)=="v2x_pubcorr"){
return("Public sector corruption index")
    }    
    if(as.character(x)=="v2x_execorr"){
return("Executive corruption index")
    }        
    }

references <- as.character(sapply(variables,reference.Func))

dicc_table <- cbind.data.frame(variables,references)
dicc_table <- apply(dicc_table,2,as.character)
dicc_table[1,] <- c("Variable","Reference")

col1_frame <- tkframe(window3,height=50,width=500,borderwidth=2,relief="raised")
tkpack(col1_frame,side="left")

col2_frame <- tkframe(window3,height=50,width=500,borderwidth=2,relief="raised")
tkpack(col2_frame,side="right")

for(i in 1:nrow(dicc_table)){
    assign(paste("var",i,"_frame",sep=""),tkframe(col1_frame,height=50,width=150,padx=5,relief="raised"))
    assign(paste("var",i,"_text",sep=""),tklabel(eval(as.name(paste("var",i,"_frame",sep=""))),text=as.character(dicc_table[i,1])))
    assign(paste("ref",i,"_frame",sep=""),tkframe(col2_frame,height=50,width=350,padx=5,relief="raised"))
    assign(paste("ref",i,"_text",sep=""),tklabel(eval(as.name(paste("ref",i,"_frame",sep=""))),text=as.character(dicc_table[i,2])))
    tkpack(eval(as.name(paste("var",i,"_frame",sep=""))))
    tkpack(eval(as.name(paste("var",i,"_text",sep=""))))
    tkpack(eval(as.name(paste("ref",i,"_frame",sep=""))))
    tkpack(eval(as.name(paste("ref",i,"_text",sep=""))))
    }

