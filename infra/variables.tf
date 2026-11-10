variable "grupo" {
  description = "Número del grupo; 0 es provisional"
  type        = number
}

variable "imagen" {
  description = "Imagen de nginx"
  type        = string
  default     = "nginx:1.28-alpine"
}
