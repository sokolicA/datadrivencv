# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.


# English -----------------------------------------------------------------


# Knit the HTML version
rmarkdown::render(here::here("02_report", "cv_en.rmd"),
                  params = list(pdf_mode = FALSE),
                  output_file = "andrej_sokolic_cv_en.html")

# Knit the PDF version to temporary html location
tmp_html_cv_en_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(here::here("02_report", "cv_en.rmd"),
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_en_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_en_loc,
                       output = here::here("02_report", "andrej_sokolic_cv_en.pdf")
)



# Slovenian ---------------------------------------------------------------

# Knit the HTML version
rmarkdown::render(here::here("02_report", "cv_slo.rmd"),
                  params = list(pdf_mode = FALSE),
                  output_file = "andrej_sokolic_cv_slo.html")

# Knit the PDF version to temporary html location
tmp_html_cv_slo_loc <- fs::file_temp(ext = ".html")
rmarkdown::render(here::here("02_report", "cv_slo.rmd"),
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_slo_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_slo_loc,
                       output = here::here("02_report", "andrej_sokolic_cv_slo.pdf")
)
