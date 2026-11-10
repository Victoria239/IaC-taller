variable "grupo" {
  description = "Número del grupo; 0 es provisional hasta su asignación"
  type        = number
}

variable "puerto" {
  description = "Puerto externo del servidor web"
  type        = number
  default     = 8080

  validation {
    condition     = var.puerto >= 8000 && var.puerto <= 8999
    error_message = "El puerto debe estar entre 8000 y 8999."
  }
}

variable "imagen" {
  description = "Imagen de nginx a desplegar"
  type        = string
  default     = "nginx:1.28-alpine"
}

variable "mensaje" {
  description = "Mensaje mostrado en la página web"
  type        = string
}
