library(renderthis)
library(tidyverse)

fs::dir_ls("slides", regexp = "html$") |> 
  walk(function(fn = "slides/01-R-Rstudio-copy-paste.html"){
    
    cli::cli_progress_step(fn)
    
    renderthis::to_pdf(fn)
    
  })
