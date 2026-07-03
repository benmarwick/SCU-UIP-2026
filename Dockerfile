FROM rocker/binder:4.4.0

## Declares build arguments with safe defaults for local testing
ARG NB_USER=rstudio
ARG NB_UID=1000

ENV DEBIAN_FRONTEND=noninteractive
USER root

## Install system dependencies for spatial packages AND tidyverse networking
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libudunits2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

## Install R packages for the workshop. The base image uses RSPM for binaries.
RUN R -e "install.packages(c( \
    'tidyverse', \
    'ggcorrplot', \
    'broom', \
    'FactoMineR', \
    'factoextra', \
    'GGally' \
    ))"