# pull base image 
FROM rocker/binder

# --- 1. Install R Packages ---
# Copy the installation script into the image and run it as root
COPY install.R /tmp/install.R
USER root
RUN Rscript /tmp/install.R

# --- 2. Copy your GitHub files into the container ---
# Copy all files from your repo into the jovyan home directory
COPY . /home/jovyan/

# --- 3. Fix File Permissions ---
# Give the 'jovyan' user ownership of the files so you can edit/save them in RStudio.
# NOTE: In Jupyter/Rocker images, the group is named 'users', not 'jovyan'!
RUN chown -R jovyan:users /home/jovyan

# --- 4. Set the active user ---
# Switch back to the normal 'jovyan' user for security when the container runs
USER jovyan