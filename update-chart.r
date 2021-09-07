source('download-process.r')
# devtools::install_github("munichrocker/DatawRappr",ref="master")

library(DatawRappr)

print("Starting chart updater")

fl$date <- as.Date(fl$date)

updateDateFormat <- gsub(
  pattern = " 0",
  replacement = ' ',
  x = format(
    x = max(fl$date),
    format = "%B %d, %Y"
  )
)

chartIDs <- c(
  'ULrmv' # new deaths reported
)

apikey <- Sys.getenv("DATAWRAPPER_API")

for (id in chartIDs) {
  print(id)
  dw_edit_chart(
    chart_id = id,
    api_key = apikey,
    annotate = paste0("As of ",updateDateFormat,'. Daily estimates are calculated based on numbers reported weekly by Florida\'s health department and daily by the U.S. Centers for Disease Control and Prevention.')
  )
  print("Publishing chart")  
  dw_publish_chart(
    chart_id = id,
    api_key = apikey,
    return_urls = TRUE
  )  
}
