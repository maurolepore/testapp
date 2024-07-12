FROM rocker/r-ver:4
# https://rocker-project.org/images/versioned/r-ver.html#how-to-use
# The advantage of using this script is that if you specify a URL for binary
# installation from Posit Public Package Manager (P3M), it will rewrite the URL and switch to source installation on non-amd64 platforms.
RUN /rocker_scripts/setup_R.sh https://packagemanager.posit.co/cran/__linux__/jammy/2024-07-12

COPY . /app

WORKDIR /app

RUN Rscript -e "install.packages('pak'); pak::pak()"

EXPOSE 8080

ENTRYPOINT ["Rscript","app.R"]
