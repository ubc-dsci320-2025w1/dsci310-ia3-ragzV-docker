# Dockerfile for DSCI 310 IA3
FROM rocker/rstudio:4.4.2

# Copy renv files
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json


USER root


RUN Rscript -e 'install.packages("renv", repos = "https://cloud.r-project.org")'
RUN Rscript -e 'renv::restore()'


COPY hello.R hello.R
