#!/usr/bin/env bash
set -e

echo "1. Verificando formato"
terraform -chdir=infra fmt -check -recursive

echo "2. Validando configuracion"
terraform -chdir=infra validate

echo "3. Ejecutando pruebas del modulo"
terraform -chdir=infra/modules/sitio_web test

echo "4. Comprobando politica de acceso publico"
checkov -d seguridad --compact --check CKV_AWS_53,CKV_AWS_54,CKV_AWS_55,CKV_AWS_56

echo "Validación completa: el cambio puede pasar a revisión"
