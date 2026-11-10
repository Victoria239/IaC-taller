output "urls" {
  value = {
    tienda = module.tienda.url
    blog   = module.blog.url
    docs   = module.docs.url
  }
}
