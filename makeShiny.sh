#!/bin/bash
Rscript makeShiny.R $1
awk 'BEGIN{print "options(bitmapType = ‘cairo’)"} {gsub("png","jpeg"); gsub("PNG","JPG"); print} END{print $0}' shinyApp/ui.R > temp && mv temp shinyApp/ui.R
awk 'BEGIN{print "options(bitmapType = ‘cairo’)"} {gsub("png","jpeg"); gsub("PNG","JPG"); print} END{print $0}' shinyApp/server.R > temp && mv temp shinyApp/server.R
mkdir /srv/shiny-server/$2
mv shinyApp/* /srv/shiny-server/$2