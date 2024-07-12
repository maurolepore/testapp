FROM rocker/r-ver:4.4

COPY . /app

WORKDIR /app

RUN echo 'options(repos = c(CRAN = "https://p3m.dev/cran/__linux__/jammy/latest"))' > "${R_HOME}/etc/Rprofile.site"

RUN Rscript -e "install.packages('pak'); pak::pak()"

EXPOSE 8080

ENTRYPOINT ["Rscript","app.R"]
