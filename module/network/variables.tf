variable "project_name" {
  type        = string
  description = "Variavel usada para especificar o nome do projeto"
}

variable "tags" {
  type        = map(any)
  description = "Lista de tags padroes"
}

variable "region" {
  type        = string
  description = "Regiao padrao do projeto"
}

variable "cidr" {
  type        = string
  description = "CIDR do projeto"
}
