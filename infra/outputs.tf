output "urls" {
  value = {
    for nombre, sitio in module.sitio :
    nombre => sitio.url
  }
}
