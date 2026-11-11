# Bitácora del taller de Infraestructura como Código

## Información del grupo

- Curso: Arquitectura de Software II, 2026-2.
- Número de grupo: pendiente de asignación.
- Marcador provisional: N.
- Fecha de inicio: 10 de noviembre de 2026.
- Fecha límite: 12 de noviembre de 2026.
- Integrantes:
  - Isabela Arias Lemus
  - Nicolas Cuervo
  - Maria Victoria Giraldo
  - Valentina Hoyos
- Entorno: un computador con Windows y PowerShell.
- Repositorio local: C:\Users\victo\Documents\iac-taller-gN
- Repositorio en GitHub: pendiente de crear.
- Grupo para auditoría: pendiente de asignación.

## Rotación de roles

Distribución planificada. Se confirmará o ajustará al cerrar cada fase
para reflejar los roles realmente desempeñados.

| Fase | Operador/a | Navegante | Revisor/a del plan | Bitácora |
|---|---|---|---|---|
| 0 y 1 | Maria Victoria Giraldo | Nicolas Cuervo | Valentina Hoyos | Isabela Arias Lemus |
| 2 | Nicolas Cuervo | Valentina Hoyos | Isabela Arias Lemus | Maria Victoria Giraldo |
| 3 | Valentina Hoyos | Isabela Arias Lemus | Maria Victoria Giraldo | Nicolas Cuervo |
| 4 | Isabela Arias Lemus | Maria Victoria Giraldo | Nicolas Cuervo | Valentina Hoyos |
| 5 | Maria Victoria Giraldo | Nicolas Cuervo | Valentina Hoyos | Isabela Arias Lemus |
| 6 | Nicolas Cuervo | Valentina Hoyos | Isabela Arias Lemus | Maria Victoria Giraldo |
| 7 | Valentina Hoyos | Isabela Arias Lemus | Maria Victoria Giraldo | Nicolas Cuervo |
| 8 | Isabela Arias Lemus | Maria Victoria Giraldo | Nicolas Cuervo | Valentina Hoyos |
| 9 | Maria Victoria Giraldo | Nicolas Cuervo | Valentina Hoyos | Isabela Arias Lemus |

## Registro de evidencias

- Las salidas de comandos se registran como texto en bloques de código.
- Antes de cada apply o destroy se registra el plan y la aprobación del revisor.
- No se incluyen contraseñas ni archivos de state.
- Se realiza un commit al cerrar cada fase.
- Las actividades pendientes se completan únicamente después de ejecutarlas.

## Fase 0 - Preparación del entorno

### Evidencias

Se instaló Terraform y se verificó que Docker responde con las secciones
Client y Server. Se descargaron las tres imágenes requeridas por el taller.
Se creó el repositorio local, la carpeta infra y el archivo .gitignore.

#### Verificación de Terraform

```text
PS C:\Windows\System32> terraform -version
Terraform v1.17.0
on windows_amd64

Your version of Terraform is out of date! The latest version
is 1.17.1. You can update by downloading from https://developer.hashicorp.com/terraform/install
```

#### Verificación de Docker

```text
PS C:\Windows\System32> docker version
Client:
 Version:           28.5.1
 API version:       1.51
 Go version:        go1.24.8
 Git commit:        e180ab8
 Built:             Wed Oct  8 12:19:16 2025
 OS/Arch:           windows/amd64
 Context:           desktop-linux

Server: Docker Desktop 4.50.0 (209931)
 Engine:
  Version:          28.5.1
  API version:      1.51 (minimum version 1.24)
  Go version:       go1.24.8
  Git commit:       f8215cc
  Built:            Wed Oct  8 12:17:24 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.27
  GitCommit:        05044ec0a9a75232cad458027ca83437aae3f4da
 runc:
  Version:          1.2.5
  GitCommit:        v1.2.5-0-g59923ef
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

#### Verificación de Git

```text
PS C:\Users\victo\Documents\iac-taller-gN> git --version
git version 2.42.0.windows.2
```

#### Descarga de imágenes

Extractos de las salidas reales. Se omiten los mensajes de progreso
de descarga de las capas.

```text
PS C:\Windows\System32> docker pull nginx:1.27-alpine
1.27-alpine: Pulling from library/nginx
Digest: sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10
Status: Downloaded newer image for nginx:1.27-alpine
docker.io/library/nginx:1.27-alpine

PS C:\Windows\System32> docker pull nginx:1.28-alpine
1.28-alpine: Pulling from library/nginx
Digest: sha256:a8b39bd9cf0f83869a2162827a0caf6137ddf759d50a171451b335cecc87d236
Status: Downloaded newer image for nginx:1.28-alpine
docker.io/library/nginx:1.28-alpine

PS C:\Windows\System32> docker pull postgres:17-alpine
17-alpine: Pulling from library/postgres
Digest: sha256:3540c0362c809df084ffac0ae69fe794515f9de92692f02178bcdce0ef0302ac
Status: Downloaded newer image for postgres:17-alpine
docker.io/library/postgres:17-alpine
```

Filas del taller obtenidas con docker image ls:

```text
REPOSITORY   TAG           IMAGE ID       CREATED         SIZE
postgres     17-alpine     3540c0362c80   4 days ago      423MB
nginx        1.28-alpine   a8b39bd9cf0f   7 months ago    92.5MB
nginx        1.27-alpine   65645c7bb6a0   19 months ago   73.6MB
```

#### Creación del repositorio

Comandos ejecutados:

```powershell
cd "$HOME\Documents"
mkdir iac-taller-gN
cd iac-taller-gN
git init
mkdir infra
```

Salida de inicialización:

```text
Initialized empty Git repository in C:/Users/victo/Documents/iac-taller-gN/.git/
```

Contenido del archivo .gitignore:

```gitignore
.terraform/
*.tfstate
*.tfstate.*
*.tfplan
crash.log
```

Estado observado antes de agregar esta bitácora:

```text
PS C:\Users\victo\Documents\iac-taller-gN> git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .gitignore

nothing added to commit but untracked files present (use "git add" to track)
```

La carpeta infra está vacía en esta etapa. Git no registra carpetas vacías.

#### Cierre de la fase

- Pendiente: confirmar los roles realmente desempeñados.
- Pendiente: realizar el commit fase-0.
- Pendiente: registrar el identificador del commit y el estado posterior de Git.

## Fase 1 - Arranque manual

### Evidencias

Se creó un servidor nginx mediante un comando imperativo:

```powershell
docker run -d --name clickops-gN -p 8090:80 nginx:1.27-alpine
```

Se abrió http://localhost:8090 y se verificó que apareció
la página «Welcome to nginx!».

#### Repetición con el mismo nombre

Se ejecutó nuevamente el mismo comando:

```powershell
docker run -d --name clickops-gN -p 8090:80 nginx:1.27-alpine
```

Fragmentos relevantes del error:

```text
Conflict. The container name "/clickops-gN" is already in use
You have to remove (or rename) that container to be able to reuse that name.
```

#### Otro nombre con el mismo puerto

```powershell
docker run -d --name clickops-gN-2 -p 8090:80 nginx:1.27-alpine
```

Fragmento relevante del error:

```text
Bind for 0.0.0.0:8090 failed: port is already allocated
```

Docker creó el segundo contenedor, pero no pudo iniciarlo
porque el puerto 8090 ya estaba asignado al primero.

#### Limpieza

```text
PS C:\Users\victo\Documents\iac-taller-gN> docker rm -f clickops-gN clickops-gN-2
clickops-gN
clickops-gN-2
```

Comprobación posterior:

```text
PS C:\Users\victo\Documents\iac-taller-gN> docker ps -a --filter "name=clickops-gN"
CONTAINER ID   IMAGE   COMMAND   CREATED   STATUS   PORTS   NAMES
```

La consulta no devolvió contenedores del experimento.

#### Objetivo expresado de forma imperativa

1. Usar la imagen nginx:1.27-alpine.
2. Crear un contenedor llamado clickops-gN.
3. Publicar el puerto 80 del contenedor en el puerto 8090 del computador.
4. Iniciar el contenedor en segundo plano.
5. Abrir http://localhost:8090 para comprobar su funcionamiento.

#### Objetivo expresado de forma declarativa

Quiero un servidor nginx:1.27-alpine en ejecución, llamado
clickops-gN y accesible mediante http://localhost:8090.

### Respuestas

1. ¿Qué error produjo el segundo docker run? ¿Qué dice eso sobre la idempotencia de un comando imperativo?

   Docker informó que el nombre clickops-gN ya estaba en uso.
   En este experimento, docker run no fue idempotente: al repetirlo,
   intentó crear otro contenedor en lugar de reconocer que el servidor
   solicitado ya existía. Al cambiar el nombre, apareció otro conflicto,
   porque el puerto 8090 seguía ocupado.

2. Si otro grupo necesitara mañana un servidor idéntico, ¿qué tendrían que contarle y dónde quedó registrado lo que hicieron?

   Tendríamos que indicar la imagen y su versión, el nombre del
   contenedor, la relación de puertos y el comando de ejecución.
   Inicialmente esas instrucciones quedaron en la terminal; ahora
   también están registradas en esta bitácora. Todavía no existe
   una configuración declarativa que gestione el servidor.

3. ¿Cuáles de los cuatro puntos de la diapositiva «Por qué duele» vivieron en esta fase?

   Observamos directamente la posibilidad de errores y la dificultad
   de repetir el procedimiento sin considerar el estado existente:
   aparecieron conflictos de nombre y puerto.

   Los comandos ejecutados tampoco quedaron registrados automáticamente
   en el historial de Git. Tuvimos que documentarlos en esta bitácora.
   Sin ese registro, el conocimiento del procedimiento dependería de
   quien lo ejecutó.

   En esta práctica breve no comprobamos una lentitud significativa.
   Además, un procedimiento manual puede reproducirse con suficiente
   documentación y un entorno preparado, pero exige coordinar esos
   detalles manualmente.


## Fase 2 - Primer despliegue

### Evidencias

Se creó infra/main.tf con el provider kreuzwerker/docker,
la imagen nginx:1.27-alpine, el contenedor web-gN y el output url.

#### Inicialización

Se ejecutó terraform init correctamente. Fragmentos de la salida:

```text
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above.

Terraform has been successfully initialized!
```

#### Formato y validación

```text
PS C:\Users\victo\Documents\iac-taller-gN\infra> terraform fmt
PS C:\Users\victo\Documents\iac-taller-gN\infra> terraform validate
Success! The configuration is valid.
```

terraform fmt terminó sin mostrar archivos modificados.

#### Plan

Se ejecutó terraform plan. Propuso crear docker_image.nginx
y docker_container.web:

```text
Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + url = "http://localhost:8080"
```

Revisión humana: pendiente de registrar quién revisó el plan
y la aprobación realmente expresada antes del apply.

#### Aplicación

Se ejecutó terraform apply y se confirmó con yes.

Extractos de la salida:

```text
docker_image.nginx: Creation complete after 23s
docker_container.web: Creation complete after 31s

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

url = "http://localhost:8080"
```

La imagen terminó de gestionarse antes de crear el contenedor.

#### Verificación del servidor

```text
PS C:\Users\victo\Documents\iac-taller-gN\infra> terraform output
url = "http://localhost:8080"
```

docker ps --filter "name=web-gN" mostró el contenedor web-gN
en ejecución, con el puerto 0.0.0.0:8080->80/tcp.

Se abrió http://localhost:8080 y apareció «Welcome to nginx!».

#### Comprobación de archivos

```text
PS C:\Users\victo\Documents\iac-taller-gN\infra> git status --short --untracked-files=all
?? .terraform.lock.hcl
?? main.tf
```

```text
PS C:\Users\victo\Documents\iac-taller-gN\infra> git check-ignore .terraform terraform.tfstate
.terraform
terraform.tfstate
```

Se comprobó que main.tf y .terraform.lock.hcl pueden versionarse,
mientras que el directorio .terraform y el state están ignorados.

### Respuestas

1. Pidieron un solo servidor. ¿Cuántos recursos creó el plan y por qué?

   Creó dos recursos gestionados por Terraform: docker_image.nginx
   y docker_container.web. Uno representa la imagen utilizada y el
   otro el contenedor que ejecuta el servidor. No son dos servidores.
   Aunque la imagen ya estaba descargada, Terraform comenzó a
   gestionarla como un recurso de esta configuración.

2. El contenedor usa docker_image.nginx.image_id. ¿Qué orden de creación impone esa referencia? Relacionarlo con «Qué ocurre cuando aplicas».

   La referencia establece una dependencia implícita: Terraform debe
   gestionar primero la imagen y obtener su identificador para crear
   el contenedor. Terraform interpreta el código, calcula el plan
   y utiliza el provider para ejecutar las operaciones contra Docker.

3. ¿Qué descargó terraform init, dónde lo guardó y para qué sirve .terraform.lock.hcl?

   Inicializó la configuración e instaló el provider kreuzwerker/docker
   dentro del directorio .terraform. El archivo .terraform.lock.hcl
   registra la versión seleccionada del provider y sus comprobaciones
   de integridad, para mantener selecciones consistentes entre
   inicializaciones. Ese archivo sí se incluye en Git.

4. De los cuatro bloques de «Cómo se escribe Terraform», ¿cuál no aparece todavía en el archivo?

   Falta variable. La configuración ya incluye provider, resource
   y output, pero todavía utiliza valores fijos.

5. Comparando con la fase 1, ¿dónde quedó registrado ahora lo que hicieron?

   La infraestructura deseada está descrita en infra/main.tf.
   El archivo .terraform.lock.hcl registra la selección del provider.
   Ambos se incorporarán al historial de Git con el commit de esta fase.
   Las evidencias y explicaciones quedan en BITACORA.md.


## Fase 3 - Idempotencia y estado

### Evidencias

#### Aplicación sin cambios

Se ejecutó terraform apply sin modificar la configuración:

```text
No changes. Your infrastructure matches the configuration.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

url = "http://localhost:8080"
```

#### Consulta del state

```text
> terraform state list
docker_container.web
docker_image.nginx
```

terraform state show docker_container.web mostró información del
contenedor, incluyendo su identificador, imagen, hostname, IP,
comando de inicio, red y puertos.

Valores iniciales consultados:

```text
serial: 4
lineage: 007623a2-3a5e-36fe-a9a3-49a38040e69a
```

#### Recuperación después de reiniciar el computador

Al retomar el taller, Docker mostró web-gN detenido:

```text
Exited (255)
```

Terraform detectó must_run = false -> true y cambios de puertos
que forzaban el reemplazo:

```text
Plan: 1 to add, 0 to change, 1 to destroy.
```

Se ejecutó terraform apply y se confirmó con yes:

```text
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

El plan posterior no mostró cambios. El serial quedó en 7 y
lineage permaneció igual.

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

#### Actualización de nginx

Se cambió en main.tf:

```hcl
name = "nginx:1.28-alpine"
```

El plan marcó ambos recursos con -/+ y forces replacement:

```text
docker_container.web must be replaced
docker_image.nginx must be replaced

Plan: 2 to add, 0 to change, 2 to destroy.
```

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

Después de la actualización, terraform plan mostró:

```text
docker_image.nginx: Refreshing state... [id=sha256:a8b39bd9cf0f83869a2162827a0caf6137ddf759d50a171451b335cecc87d236nginx:1.28-alpine]
docker_container.web: Refreshing state... [id=531bc04ca6a4c18d49c2ecc81fbd1e75e2f3c8ae7ca0cb09b0bfc38e4ef85839]

No changes. Your infrastructure matches the configuration.
```

Valores posteriores:

```text
serial: 12
lineage: 007623a2-3a5e-36fe-a9a3-49a38040e69a
```

Pendiente: incorporar la salida final del apply de actualización
si se conserva en la terminal.

### Respuestas

1. ¿Qué respondió Terraform al aplicar sin cambios y en qué se diferencia del segundo docker run de la fase 1?

   Respondió que no había diferencias y terminó con cero recursos
   creados, modificados o destruidos. Terraform reconoció que el
   estado deseado ya estaba satisfecho. El segundo docker run
   intentó crear otro contenedor y falló por conflicto de nombre.

2. ¿Qué datos guarda el state que no escribieron en main.tf y para qué los necesita Terraform?

   Guarda identificadores de los recursos y atributos obtenidos
   del provider, como hostname, IP y datos de red. Vincula las
   direcciones del código, como docker_container.web, con los
   recursos reales para consultarlos y planificar sus cambios.

3. ¿Por qué el cambio de imagen reemplazó el contenedor en lugar de modificarlo?

   El provider considera que cambiar la imagen requiere reemplazar
   el contenedor. Terraform destruyó el anterior y creó uno basado
   en la nueva imagen, siguiendo el enfoque de infraestructura
   inmutable en lugar de actualizar software dentro del contenedor.

4. ¿Cómo cambió serial después del apply y qué representa?

   Inicialmente era 4. Después de recuperar el servidor tras el
   reinicio pasó a 7. Tras actualizar nginx pasó de 7 a 12.
   Es un contador de revisiones del state: puede incrementarse
   varias veces durante una operación, por lo que no equivale
   al número de comandos apply ejecutados.
   Lineage se mantuvo igual e identifica la misma historia del state.

5. En un proyecto con bases de datos, ¿qué riesgo habría si el state se subiera a Git?

   Puede contener contraseñas, cadenas de conexión y otros datos
   sensibles. Subirlo a Git podría exponerlos y conservarlos en el
   historial incluso después de borrarlos de la versión actual.
   Por eso se excluye del repositorio.


## Fase 4 - Drift

### Evidencias

Se realizaron tres modificaciones manuales permitidas por la guía
para comprobar qué cambios detecta Terraform.

| Experimento | ¿El plan lo detectó? | ¿Qué propuso Terraform? | ¿Cómo quedó corregido? |
|---|---|---|---|
| A - Apagar | Sí | Reemplazar el contenedor: 1 a crear y 1 a destruir | Se aplicó el plan y el plan posterior quedó sin cambios |
| B - Borrar | Sí | Crear el contenedor faltante: 1 a crear, sin destrucciones | Se recreó y se verificó la página de nginx y el plan sin cambios |
| C - Cambiar por dentro | No | No propuso cambios | Se forzó el reemplazo con -replace; el plan posterior quedó sin cambios |

#### Experimento A - Apagar el servidor

```powershell
docker stop web-gN
terraform plan
```

El plan detectó must_run = false -> true y atributos de puertos
marcados con forces replacement:

```text
Plan: 1 to add, 0 to change, 1 to destroy.
```

Se ejecutó terraform apply y se confirmó con yes:

```text
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

El plan posterior respondió:

```text
No changes. Your infrastructure matches the configuration.
```

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

#### Experimento B - Borrar el servidor

```powershell
docker rm -f web-gN
terraform plan -refresh-only
terraform plan
```

El plan refresh-only informó:

```text
Note: Objects have changed outside of Terraform

# docker_container.web has been deleted
```

Este plan solo mostró cómo había cambiado la infraestructura respecto
al state; no propuso recrear el contenedor.

El plan normal propuso recuperar el recurso definido en el código:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

Después de la recuperación, el plan respondió:

```text
No changes. Your infrastructure matches the configuration.
```

Se verificó que localhost:8080 mostraba la bienvenida de nginx.

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

#### Experimento C - Cambiar contenido interno

```powershell
docker exec web-gN sh -c "echo '<h1>Cambio manual</h1>' > /usr/share/nginx/html/index.html"
terraform plan
```

La página mostró «Cambio manual», pero Terraform respondió:

```text
No changes. Your infrastructure matches the configuration.
```

Para restaurar el contenido mediante infraestructura inmutable,
se solicitó el reemplazo completo.

El primer intento sin comillas produjo:

```text
Error: Invalid force-replace address "docker_container"
Resource specification must include a resource type and name.
```

Se corrigió pasando el argumento completo entre comillas en PowerShell:

```powershell
terraform apply "-replace=docker_container.web"
```

Se confirmó con yes y el resultado fue:

```text
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

url = "http://localhost:8080"
```

El plan posterior respondió:

```text
No changes. Your infrastructure matches the configuration.
```

Aprobación del revisor y resumen del plan previo al reemplazo:
pendiente de registrar lo ocurrido realmente.

Verificación final de la bienvenida de nginx en el navegador:
pendiente de confirmar.

### Respuestas

1. ¿Por qué Terraform no detectó el experimento C? ¿Qué tipo de herramienta de «Aprovisionar ≠ configurar» atiende ese nivel?

   La configuración gestiona la imagen y el contenedor, pero no
   comprueba el contenido del archivo HTML dentro de él. Modificar
   ese archivo no cambió los atributos que el provider compara
   en este caso. Las herramientas de gestión de configuración,
   como Ansible, Chef o Puppet, pueden gestionar archivos y
   configuración dentro de los servidores.

2. ¿Por qué -replace es una corrección coherente con la infraestructura inmutable?

   Porque elimina el contenedor modificado y crea uno nuevo desde
   la imagen declarada, recuperando su contenido original.
   No intenta reparar manualmente el contenedor existente.

3. ¿Cómo detectarían el drift sin esperar a que alguien ejecute plan por casualidad?

   Programaríamos planes periódicos en un pipeline y notificaciones
   cuando aparezcan diferencias, para revisarlas antes de aplicar.
   Complementaríamos esos planes con verificaciones de configuración
   y monitoreo para cambios internos que Terraform no detecta.


## Fase 5 - Flexibilidad

### Evidencias

Se organizó la configuración en main.tf, variables.tf, locals.tf,
data.tf, outputs.tf y terraform.tfvars.

Se completaron los cinco TODO:
- Variable mensaje de tipo string y sin default.
- Mapa local.etiquetas.
- Bloque dynamic "labels".
- Output contenedor.
- Output red_driver.

Se utiliza grupo = 0 provisionalmente porque el docente todavía
no ha asignado el número del grupo.

#### Formato, validación y plan

terraform fmt terminó sin mostrar archivos modificados.

```text
Success! The configuration is valid.
```

El plan propuso reemplazar el contenedor por el cambio de nombre,
las etiquetas y el contenido HTML:

```text
name = "web-gN" -> "web-g0" # forces replacement

Plan: 1 to add, 0 to change, 1 to destroy.
```

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

Después del despliegue se obtuvieron las tres salidas:

```text
> terraform output
contenedor = "web-g0"
red_driver = "bridge"
url = "http://localhost:8080"
```

El plan posterior respondió:

```text
No changes. Your infrastructure matches the configuration.
```

Verificación del mensaje personalizado en el navegador:
pendiente de confirmar y registrar.

#### Consultas de consola

```text
> local.nombre
"web-g0"

> upper(var.mensaje)
"HOLA DESDE NUESTRO GRUPO - NUMERO PENDIENTE"

> format("web-g%02d", var.grupo)
"web-g00"

> local.etiquetas
{
  "curso" = "arquitectura-sw-2"
  "grupo" = "0"
}

> data.docker_network.bridge.driver
"bridge"
```

#### Validación del puerto

```text
> terraform plan "-var=puerto=9500"

Planning failed. Terraform encountered an error while generating this plan.

Error: Invalid value for variable
var.puerto is 9500

El puerto debe estar entre 8000 y 8999.
```

Con un puerto dentro del rango:

```text
> terraform plan "-var=puerto=8085"

external = 8080 -> 8085 # forces replacement

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ url = "http://localhost:8080" -> "http://localhost:8085"
```

Estos planes de prueba no se aplicaron. El servidor conservó el puerto 8080.

### Respuestas

1. puerto tiene un default, puede venir de terraform.tfvars y se pasó con -var. ¿Qué valor gana cuando hay varios?

   Entre estas tres fuentes, -var tiene prioridad sobre
   terraform.tfvars, y terraform.tfvars sobre el default.
   En la prueba, -var permitió planificar con 8085 sin cambiar
   el default 8080 ni modificar los archivos.

2. ¿Qué hizo validation con el puerto 9500? ¿En qué se parece a Policy as Code?

   Detuvo la generación del plan porque el valor estaba fuera
   del rango permitido. Se parece a Policy as Code porque expresa
   una regla en código y bloquea automáticamente configuraciones
   que no la cumplen antes de aplicar cambios.

3. ¿Terraform creó la red bridge? ¿Qué le pasará cuando el grupo ejecute destroy?

   No la creó. El data source consultó una red existente.
   Terraform no destruirá esa red porque no es un recurso
   gestionado por esta configuración.

4. ¿Qué ganan con local.nombre frente a escribir "web-gN" en cada lugar?

   Centralizamos la regla para construir el nombre a partir
   del número del grupo. Evitamos repetir valores y reducimos
   el riesgo de inconsistencias al cambiarlo.


## Fase 6 - Módulos

### Evidencias

Se creó el módulo reutilizable infra/modules/sitio_web con:
- versions.tf: origen del provider kreuzwerker/docker.
- variables.tf: nombre, mensaje, imagen y puerto, con validación.
- main.tf: imagen, contenedor y contenido HTML.
- outputs.tf: URL y nombre real del contenedor.

Desde la raíz se invocó el mismo módulo tres veces:
tienda, blog y docs. Se eliminaron los recursos anteriores
de la raíz y las variables, locales y outputs que ya no se usaban.

#### Inicialización y validación

```text
Terraform has been successfully initialized!

Success! The configuration is valid.
```

terraform fmt -recursive terminó sin mostrar archivos modificados.

#### Plan de migración a módulos

```text
Plan: 6 to add, 0 to change, 2 to destroy.
```

Se propuso eliminar docker_container.web y docker_image.nginx,
porque ya no estaban declarados en la raíz. Se propuso crear
una imagen gestionada y un contenedor dentro de cada módulo.

Los tres recursos docker_image utilizan la misma imagen
nginx:1.28-alpine; no representan tres servidores adicionales.

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

La salida final del apply no se conservó en las evidencias
compartidas. El despliegue se verificó mediante las páginas,
los outputs y el plan posterior.

#### Verificación de páginas

Se comprobaron las tres páginas en el navegador:

| Sitio | URL | Mensaje observado |
|---|---|---|
| Tienda | http://localhost:8081 | Tienda del grupo 0 |
| Blog | http://localhost:8082 | Blog del grupo 0 |
| Documentación | http://localhost:8083 | Documentacion del grupo 0 |

El número 0 continúa siendo provisional.

#### Outputs

```text
> terraform output urls
{
  "blog" = "http://localhost:8082"
  "docs" = "http://localhost:8083"
  "tienda" = "http://localhost:8081"
}
```

#### Plan posterior

El refresco consultó los recursos de module.tienda, module.blog
y module.docs. El resultado fue:

```text
No changes. Your infrastructure matches the configuration.
```

El reto opcional de migración con for_each y moved no se ha realizado.

### Respuestas

1. Anoten la línea Plan: del paso 8. ¿Qué se destruyó, qué se creó y por qué?

   El plan fue: 6 to add, 0 to change, 2 to destroy.
   Se eliminaron los dos recursos anteriores de la raíz y se
   crearon seis recursos dentro de tres módulos: una imagen
   gestionada y un contenedor por sitio. Terraform distingue
   los recursos por su dirección en la configuración; los
   recursos nuevos están dentro de module.tienda, module.blog
   y module.docs.

2. ¿Qué error obtendrían si el módulo no tuviera versions.tf?

   Sin otra declaración equivalente de required_providers,
   Terraform intentaría buscar hashicorp/docker en lugar de
   kreuzwerker/docker. La inicialización fallaría porque el
   provider Docker utilizado no pertenece a HashiCorp.

3. Si mañana hay que agregar una etiqueta a todos los sitios, ¿cuántos archivos tocan con módulo? ¿Cuántos bloques habrían tocado copiando y pegando?

   Para una etiqueta común bastaría modificar el recurso del
   módulo en un archivo: modules/sitio_web/main.tf.
   Con recursos copiados habría que modificar tres bloques
   de contenedor y mantenerlos consistentes.

4. ¿Qué necesitaría otro grupo para usar su módulo sin copiar la carpeta?

   Acceso a un repositorio Git que publique el módulo y una
   referencia a su ubicación mediante source, preferiblemente
   fijada a una versión o commit. También necesitaría configurar
   el provider, suministrar las variables y ejecutar terraform init.



## Fase 7 - State remoto y ambientes

### Evidencias

El número de grupo sigue pendiente de asignación. Se utiliza 0
como valor provisional.

#### Backend PostgreSQL

Se creó el contenedor tf-state-g0 con postgres:17-alpine,
publicando el puerto 5433 del computador hacia el 5432 del contenedor.

La contraseña se generó en una variable de PowerShell y se pasó
a Docker mediante una variable de entorno. La conexión de Terraform
se definió en PG_CONN_STR, sin escribir sus credenciales en archivos
del repositorio.

Comprobación de disponibilidad:

```text
> docker exec tf-state-g0 pg_isready -U terraform -d terraform_backend
/var/run/postgresql:5432 - accepting connections
```

#### Migración del state

Se agregó al bloque terraform:

```hcl
backend "pg" {}
```

Se ejecutó:

```powershell
terraform init -migrate-state
```

Terraform detectó el state local y preguntó si debía copiarlo
al backend pg. Se respondió yes.

La inicialización terminó correctamente y reutilizó el provider
kreuzwerker/docker v4.6.0.

```text
> terraform state list
data.docker_network.bridge
module.blog.docker_container.this
module.blog.docker_image.this
module.docs.docker_container.this
module.docs.docker_image.this
module.tienda.docker_container.this
module.tienda.docker_image.this
```

La primera consulta a PostgreSQL mostró:

```text
 id |  name
----+---------
  1 | default
(1 row)
```

#### Prueba de bloqueo

Se abrió una segunda terminal que heredó PG_CONN_STR.

En la primera se ejecutó:

```powershell
terraform apply "-replace=module.tienda.docker_container.this"
```

Se dejó esperando la confirmación, sin aplicar el reemplazo.
Se utilizó esta propuesta para mantener una operación abierta,
porque un apply sin cambios no se detendría a pedir confirmación.

En la segunda terminal se ejecutó terraform plan:

```text
Error: Error acquiring the state lock
Error message: Workspace is already locked: default
```

Se canceló la operación de la primera terminal:

```text
Apply cancelled.
```

Después se ejecutó terraform plan y terminó sin error de bloqueo:

```text
No changes. Your infrastructure matches the configuration.
```

No se aplicó el reemplazo de prueba.

#### Limpieza del workspace default

Antes de configurar los nuevos ambientes, se revisó:

```text
Plan: 0 to add, 0 to change, 6 to destroy.
```

Se destruyeron los tres contenedores y los tres recursos de imagen
gestionados en default:

```text
Destroy complete! Resources: 6 destroyed.
```

terraform state list no mostró recursos. Se comprobó que el backend
tf-state-g0 seguía en ejecución.

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

#### Configuración de ambientes

Se definieron los ambientes en locals.tf y una llamada al módulo
sitio con for_each.

| Ambiente | Sitios | Puertos | Imagen |
|---|---|---|---|
| dev | tienda | 8101 | nginx:1.28-alpine |
| staging | tienda, blog y docs | 8201, 8202 y 8203 | nginx:1.28-alpine |
| prod | tienda, blog y docs | 8301, 8302 y 8303 | nginx:1.27-alpine |

Se completaron los tres TODO:
- Imagen diferenciada por ambiente.
- Uso de local.amb.imagen en la llamada al módulo.
- Output urls construido recorriendo module.sitio.

#### Despliegue de dev

Se creó y seleccionó el workspace dev.
terraform validate respondió que la configuración era válida.

```text
Plan: 2 to add, 0 to change, 0 to destroy.

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

```text
> terraform output urls
{
  "tienda" = "http://localhost:8101"
}
```

El plan posterior no mostró cambios.

Aprobación del revisor: pendiente de registrar lo ocurrido realmente.
Verificación HTTP de dev: pendiente de registrar su comprobación.

#### Despliegue de staging

El plan propuso:

```text
Plan: 6 to add, 0 to change, 0 to destroy.
```

Después del despliegue:

```text
> terraform output urls
{
  "blog" = "http://localhost:8202"
  "docs" = "http://localhost:8203"
  "tienda" = "http://localhost:8201"
}
```

```text
No changes. Your infrastructure matches the configuration.
```

Se verificó en el navegador la página de documentación en 8203,
con el mensaje de STAGING.

La salida final del apply no se conservó en las evidencias compartidas.
Aprobación del revisor: pendiente de registrar lo ocurrido realmente.
Verificación HTTP de tienda y blog: pendiente de registrar.

#### Despliegue de prod

El plan propuso:

```text
Plan: 6 to add, 0 to change, 0 to destroy.
```

Después del despliegue:

```text
> terraform workspace show
prod

> terraform output urls
{
  "blog" = "http://localhost:8302"
  "docs" = "http://localhost:8303"
  "tienda" = "http://localhost:8301"
}
```

```text
No changes. Your infrastructure matches the configuration.
```

Se verificaron las tres páginas en el navegador:
Tienda - PROD - grupo 0, Blog - PROD - grupo 0
y Docs - PROD - grupo 0.

La salida final del apply no se conservó en las evidencias compartidas.
Aprobación del revisor: pendiente de registrar lo ocurrido realmente.

#### Verificación conjunta

```text
> terraform workspace list
  default
  dev
* prod
  staging
```

docker ps mostró los siete sitios y el backend:

```text
NAMES               IMAGE                PORTS
tienda-g0-prod      65645c7bb6a0         0.0.0.0:8301->80/tcp
docs-g0-prod        65645c7bb6a0         0.0.0.0:8303->80/tcp
blog-g0-prod        65645c7bb6a0         0.0.0.0:8302->80/tcp
tienda-g0-staging   a8b39bd9cf0f         0.0.0.0:8201->80/tcp
docs-g0-staging     a8b39bd9cf0f         0.0.0.0:8203->80/tcp
blog-g0-staging     a8b39bd9cf0f         0.0.0.0:8202->80/tcp
tienda-g0-dev       a8b39bd9cf0f         0.0.0.0:8101->80/tcp
tf-state-g0         postgres:17-alpine   0.0.0.0:5433->5432/tcp, [::]:5433->5432/tcp
```

Consulta de los states:

```text
> docker exec tf-state-g0 psql -U terraform -d terraform_backend -c "SELECT id, name FROM terraform_remote_state.states ORDER BY id;"
 id |  name
----+---------
  1 | default
  4 | dev
  6 | staging
  9 | prod
(4 rows)
```

#### Protección contra uso de default

Se seleccionó default y se ejecutó terraform plan:

```text
Error: Invalid index

22: amb = local.ambientes[local.entorno]

local.ambientes is object with 3 attributes
local.entorno is "default"

The given key does not identify an element in this collection value.
```

Después se volvió a prod.

La búsqueda de la contraseña de ejemplo con git grep no produjo
resultados. Esta búsqueda comprueba esa cadena concreta, no constituye
un escaneo general de secretos.

### Respuestas

1. ¿Qué respondió la terminal 2 en la prueba de bloqueo? ¿Qué problema de trabajo en equipo evita?

   Informó que default ya estaba bloqueado. Evita operaciones
   concurrentes sobre el mismo state que puedan provocar
   inconsistencias o sobrescrituras.

2. ¿Dónde quedó la contraseña del backend y por qué no debe estar en main.tf?

   Para Terraform, la conexión quedó en PG_CONN_STR de la terminal.
   Docker recibió la contraseña mediante una variable de entorno
   al crear PostgreSQL. No se escribió en main.tf ni en la bitácora
   porque Git conservaría el secreto en su historial.

3. ¿Qué filas tiene ahora la tabla states y cómo se relacionan con los workspaces?

   Tiene default, dev, staging y prod. Cada fila corresponde al
   state de un workspace. Default conserva su registro, aunque
   sus recursos fueron destruidos antes de crear los ambientes.

4. ¿Qué error da terraform plan en default y por qué es útil que falle?

   Produce Invalid index porque default no está definido en
   local.ambientes. Obliga a elegir explícitamente un ambiente
   válido antes de planificar.

5. ¿Por qué dev tiene un solo sitio y staging replica a prod? ¿Por qué prod usa otra versión de imagen?

   Dev utiliza menos recursos para facilitar las pruebas.
   Staging reproduce la composición de prod para validar cambios
   antes de promoverlos. Dev y staging prueban nginx 1.28,
   mientras prod conserva 1.27 hasta validar la nueva versión.

6. Los tres ambientes comparten código y backend. ¿Qué riesgo tiene eso frente a usar carpetas separadas por ambiente?

   Un cambio en el código compartido puede afectar a varios
   ambientes al aplicarse en ellos. También existe el riesgo
   de seleccionar el workspace equivocado. Los states están
   separados, pero los workspaces no constituyen por sí solos
   una separación de permisos ni eliminan la dependencia del
   backend compartido.


## Fase 8 - Testing y calidad

### Evidencias

#### Pruebas del módulo

Se creó modules/sitio_web/tests/sitio_web.tftest.hcl con
cuatro pruebas:

```text
run "url_coherente_con_puerto"... pass
run "rechaza_puerto_fuera_de_rango"... pass
run "despliegue_real"... pass
run "nombre_coherente"... pass

tests\sitio_web.tftest.hcl... tearing down
tests\sitio_web.tftest.hcl... pass

Success! 4 passed, 0 failed.
```

La prueba despliegue_real creó infraestructura temporal y Terraform
completó su limpieza al terminar.

Observación directa con docker ps durante la prueba:
pendiente de registrar si se realizó.

#### Escaneo de seguridad

Se instaló Checkov 3.4.4 y se creó seguridad/bucket.tf como
ejemplo de AWS destinado exclusivamente al análisis estático.
No se aplicó ni se utilizó una cuenta de AWS.

Inicialmente los cuatro atributos de bloqueo público estaban
en false.

```text
Passed checks: 4, Failed checks: 11, Skipped checks: 0
```

Controles fallidos iniciales:

```text
CKV_AWS_53
CKV_AWS_54
CKV_AWS_55
CKV_AWS_56
CKV2_AWS_62
CKV2_AWS_61
CKV_AWS_18
CKV_AWS_144
CKV2_AWS_6
CKV_AWS_21
CKV_AWS_145
```

Se cambiaron a true:

```hcl
block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true
```

El segundo escaneo completo mostró:

```text
Passed checks: 9, Failed checks: 6, Skipped checks: 0
```

Fallos restantes:

| Control | Aspecto pendiente |
|---|---|
| CKV2_AWS_62 | Notificaciones de eventos |
| CKV2_AWS_61 | Configuración de ciclo de vida |
| CKV_AWS_18 | Registro de accesos |
| CKV_AWS_144 | Replicación entre regiones |
| CKV_AWS_21 | Versionado |
| CKV_AWS_145 | Cifrado predeterminado con KMS |

También pasó CKV2_AWS_6 al corregir las protecciones de acceso público.

Se ejecutó el escaneo limitado a la política del taller:

```powershell
checkov -d seguridad --compact --check CKV_AWS_53,CKV_AWS_54,CKV_AWS_55,CKV_AWS_56
```

```text
Passed checks: 4, Failed checks: 0, Skipped checks: 0
```

#### Mini pipeline

Se creó validar.sh con set -e para encadenar:
1. terraform fmt -check -recursive.
2. terraform validate.
3. terraform test del módulo.
4. Checkov con los cuatro controles de acceso público.

Se ejecutó desde la raíz mediante Git Bash:

```powershell
& "C:\Program Files\Git\bin\bash.exe" validar.sh
```

Resultado:

```text
1. Verificando formato
2. Validando configuracion
Success! The configuration is valid.

3. Ejecutando pruebas del modulo
Success! 4 passed, 0 failed.

4. Comprobando politica de acceso publico
Passed checks: 4, Failed checks: 0, Skipped checks: 0

Validación completa: el cambio puede pasar a revisión
```

#### Fallo intencional de formato

Se desordenó la declaración de tipo numérico en variables.tf
y se ejecutó el pipeline:

```text
1. Verificando formato
variables.tf
Codigo de salida por formato: 3
```

El script se detuvo en el primer paso. Se restauró el formato
con terraform -chdir=infra fmt.

#### Fallo intencional de seguridad

Se cambió temporalmente block_public_acls a false.

Formato, validación y las cuatro pruebas aprobaron, pero
el escaneo produjo:

```text
Passed checks: 3, Failed checks: 1, Skipped checks: 0

Check: CKV_AWS_53
FAILED for resource: aws_s3_bucket_public_access_block.evidencias

Codigo de salida por seguridad: 1
```

El script no mostró su mensaje final de validación completa.

Se restauró bucket.tf con los cuatro valores en true y se
repitió el escaneo de la política:

```text
Passed checks: 4, Failed checks: 0, Skipped checks: 0
```

El reto opcional de GitHub Actions no se ha realizado.

### Respuestas

1. ¿Qué encontró cada nivel que los otros no podían encontrar?

   El análisis estático comprobó formato y validez de la
   configuración. Las pruebas verificaron outputs, rechazo de
   entradas inválidas y un despliegue real del módulo. El escaneo
   detectó configuraciones de seguridad que pueden ser válidas
   sintácticamente y aun así incumplir políticas.

2. ¿Qué vio quien observaba docker ps durante despliegue_real? ¿Por qué vale la pena un entorno desechable?

   Observación directa: pendiente de registrar si se realizó.
   La salida de terraform test confirmó la ejecución de la prueba
   real y su limpieza posterior. Un entorno desechable permite
   comprobar el despliegue sin modificar los ambientes existentes
   y elimina los recursos de prueba al terminar.

3. ¿Qué controles fallaron y cuántos quedaron después de corregir? ¿Cuáles corresponden a «sin buckets públicos»?

   Inicialmente fallaron 11 controles y después quedaron 6.
   CKV_AWS_53, CKV_AWS_54, CKV_AWS_55 y CKV_AWS_56 verifican
   las cuatro protecciones de acceso público utilizadas como
   política del pipeline. Los cuatro aprobaron tras la corrección.

4. ¿Qué ventaja tiene detectar un problema antes del apply?

   Permite corregirlo antes de desplegar infraestructura con una
   configuración insegura, reduciendo exposición, retrabajo y
   posibles costos. Estas comprobaciones no garantizan por sí
   solas que toda la infraestructura sea segura.

5. ¿En qué paso del pipeline va validar.sh y qué paso humano viene después?

   Corresponde a la etapa Validar. Después viene la revisión
   humana del cambio y del plan propuesto antes de autorizar
   su aplicación.