#' Create a barchart for average
#'
#' @param 
#' @param 
#' @param resultat_avarage: data.frame of two column where the first is the values of the independent var and the second column is the average associated to the indepedent variable value
#' @details 
#' @return 
#' @examples
#' @export
#'
barchart_average<-function(.data,independent.var.value,result_average,result_min,result_max){
  
  independent.var.value<-enquo(independent.var.value)
  result_average<-enquo(result_average)
  result_min<-enquo(result_min)
  result_max<-enquo(result_max)
  
  theplot <-  ggplot(.data, aes(x = !!independent.var.value , y = !! result_average ))+geom_bar(stat = "identity")+
    theme_tufte()+xlab("")+ylab(get_expr(result_average))+theme(text=element_text(family="Arial Narrow")
    )
  
  
  
  # Add error bar to the plot
  theplot <- theplot + geom_errorbar( aes(x=!!independent.var.value,
                                          ymin=as.numeric(!!result_min),
                                          ymax=as.numeric(!!result_max)),
                                      stat='identity',
                                      width=.1) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust=0.5))

  return(theplot)
}







































