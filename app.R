options(list(
  shiny.port = 8080,
  shiny.host = "0.0.0.0"
))

pkgload::load_all()
run_app()
