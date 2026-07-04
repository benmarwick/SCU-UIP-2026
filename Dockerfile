# pull base image 
FROM rocker/binder:latest

# Copy the installation script into the image
COPY install.R /tmp/install.R

# Run the script
RUN Rscript /tmp/install.R