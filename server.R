library(shiny)
library(ggplot2)
library(reshape2)

library(rsconnect)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  #Upload rice genotype data
  #data.geno <- read.csv("./RiceSNPData/Rice_44K_genotypes.csv.gz",
  #row.names=1, #this tells R to use the first column as row names
  #na.strings=c("NA","00")) #this tells R that missing data is denoted as "NA" or "00"
  
  #data.geno.2500 <- sample(data.geno, 2500)
  #geno.numeric <- data.matrix(data.geno.2500)
  #geno.mds <- as.data.frame(cmdscale(genDist))
  
  #Merged genotype with phenotype
  #data.pheno <- read.csv("./RiceSNPData/RiceDiversity.44K.MSU6.Phenotypes.csv",row.names=1,na.strings=c("NA","00"))
  #data.geno.pheno <- merge(geno.mds, data.pheno, by=0, All = T)
  
  #Take only traits of interest and make a new file
  #dataofinterest<-data.geno.pheno[,c(6,18,24,32,39)]
  #dataofinterest.melt<- melt(dataofinterest, id.var="Region")
  
  output$plot1 <- renderPlot({
    
    datafile <- dataofinterest.melt[dataofinterest.melt$variable==input$Traits,]
    
    # set up the plot
    pl <- ggplot(data = datafile, 
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x = "Region", y = "value", color = "Region", size = "value"
                 )
    )
    
    # draw the graph for the specified trait
    if(input$Graph == "boxplot"){
      pl + geom_boxplot()
    } else if (input$Graph == "violin"){
      pl + geom_violin()
    } else if (input$Graph == "point"){
      pl + geom_point()
    }
  })
})
