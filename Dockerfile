# pull base image 
FROM rocker/binder:latest

# install some R packages for the workshop
# RUN sudo apt-get install libfontconfig1-dev -y
RUN R -e "install.packages(c( \
  'broom', 'cowplot', 'ggbeeswarm', 'GGally', 'ggcorrplot', \
  'RColorBrewer', 'viridis', 'here', 'readxl', \
  'FactoMineR', 'factoextra', 'performance', 'FSA', \
  'infer', 'Rmisc', 'quarto', 'remotes', 'ragg'  \
), repos='https://cloud.r-project.org')"

# --- Metadata ---
LABEL maintainer = "Ben Marwick <bmarwick@uw.edu>"  \
  org.opencontainers.image.description="Dockerfile for the SCU-UIP 2026 workshop" \
  org.opencontainers.image.created="2022-11" \
  org.opencontainers.image.authors="Ben Marwick" \
  org.opencontainers.image.url="https://github.com/benmarwick/SCU-UIP-2026" \
  org.opencontainers.image.documentation="https://github.com/benmarwick/SCU-UIP-2026" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.label-schema.description="Reproducible workflow image (license: Apache 2.0)"