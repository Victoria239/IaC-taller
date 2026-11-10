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

### Respuestas

La fase 0 no contiene preguntas en la guía.

## Fase 1 - Arranque manual

### Evidencias

Pendiente de ejecución.

Registrar:
- Creación del servidor manual y verificación de la página.
- Error al repetir el mismo nombre.
- Error al usar otro nombre con el mismo puerto.
- Eliminación de los contenedores de prueba.
- Objetivo escrito como pasos imperativos y como frase declarativa.
- Verificación de limpieza y commit de la fase.

### Respuestas

1. ¿Qué error produjo el segundo docker run? ¿Qué dice eso sobre la idempotencia de un comando imperativo?

   Pendiente.

2. Si otro grupo necesitara mañana un servidor idéntico, ¿qué tendrían que contarle y dónde quedó registrado lo que hicieron?

   Pendiente.

3. ¿Cuáles de los cuatro puntos de la diapositiva «Por qué duele» vivieron en esta fase?

   Pendiente.

## Fase 2 - Primer despliegue

### Evidencias

Pendiente de ejecución.

Registrar init, fmt, validate, plan, aprobación del revisor, apply,
terraform output, verificación de la página y docker ps.
Comprobar que se versiona .terraform.lock.hcl y se excluyen state
y .terraform/. Registrar el commit de la fase.

### Respuestas

1. Pidieron un solo servidor. ¿Cuántos recursos creó el plan y por qué?

   Pendiente.

2. El contenedor usa docker_image.nginx.image_id. ¿Qué orden de creación impone esa referencia? Relacionarlo con «Qué ocurre cuando aplicas».

   Pendiente.

3. ¿Qué descargó terraform init, dónde lo guardó y para qué sirve .terraform.lock.hcl?

   Pendiente.

4. De los cuatro bloques de «Cómo se escribe Terraform», ¿cuál no aparece todavía en el archivo?

   Pendiente.

5. Comparando con la fase 1, ¿dónde quedó registrado ahora lo que hicieron?

   Pendiente.

## Fase 3 - Idempotencia y estado

### Evidencias

Pendiente de ejecución.

Registrar:
- Resultado de apply sin cambios.
- terraform state list.
- Información no sensible de terraform state show.
- Valor de serial antes y después del cambio.
- Plan de reemplazo por cambio de imagen y aprobación del revisor.
- Resultado de apply y plan final sin cambios.
- Commit de la fase.

No incorporar el archivo de state al repositorio.

### Respuestas

1. ¿Qué respondió Terraform al aplicar sin cambios y en qué se diferencia del segundo docker run de la fase 1?

   Pendiente.

2. ¿Qué datos guarda el state que no escribieron en main.tf y para qué los necesita Terraform?

   Pendiente.

3. ¿Por qué el cambio de imagen reemplazó el contenedor en lugar de modificarlo? Relacionarlo con infraestructura mutable e inmutable.

   Pendiente.

4. ¿Cómo cambió serial después del apply y qué representa?

   Pendiente.

5. En un proyecto con bases de datos, ¿qué riesgo habría si el state se subiera a Git?

   Pendiente.

## Fase 4 - Drift

### Evidencias

Pendiente de ejecución.

| Experimento | ¿El plan lo detectó? | ¿Qué propuso Terraform? | ¿Cómo quedó corregido? |
|---|---|---|---|
| A - Apagar | Pendiente | Pendiente | Pendiente |
| B - Borrar | Pendiente | Pendiente | Pendiente |
| C - Cambiar por dentro | Pendiente | Pendiente | Pendiente |

Registrar planes, aprobaciones, correcciones, regreso de la página
de bienvenida, plan final sin cambios y commit de la fase.

### Respuestas

1. ¿Por qué Terraform no detectó el experimento C? ¿Qué tipo de herramienta de «Aprovisionar ≠ configurar» atiende ese nivel?

   Pendiente.

2. ¿Por qué -replace es una corrección coherente con infraestructura inmutable?

   Pendiente.

3. ¿Cómo detectarían drift sin esperar a que alguien ejecute plan por casualidad?

   Pendiente.

## Fase 5 - Flexibilidad

### Evidencias

Pendiente de ejecución.

Registrar:
- Separación del código y resolución de los TODO.
- Plan, explicación del reemplazo y aprobación.
- Página personalizada y tres outputs.
- Resultados de terraform console.
- Validación con puerto 9500 y plan con puerto 8085, sin aplicarlos.
- Commit de la fase.

### Respuestas

1. ¿Qué valor gana entre default, terraform.tfvars y -var?

   Pendiente.

2. ¿Qué hizo validation con el puerto 9500 y en qué se parece a Policy as Code?

   Pendiente.

3. ¿Terraform creó la red bridge? ¿Qué le pasará cuando se ejecute destroy?

   Pendiente.

4. ¿Qué aporta local.nombre frente a repetir el nombre literal?

   Pendiente.

## Fase 6 - Módulos

### Evidencias

Pendiente de ejecución.

Registrar:
- Archivos del módulo y TODO completos.
- terraform init.
- Línea Plan: y explicación de creaciones y destrucciones.
- Aprobación y resultado del despliegue.
- Verificación de tienda, blog y docs.
- terraform output urls.
- Commit de la fase.

Si se realiza el reto opcional, documentar la migración con for_each
y moved sin destrucciones.

### Respuestas

1. ¿Cuál fue la línea Plan: del paso 8? ¿Qué se destruyó, qué se creó y por qué?

   Pendiente.

2. ¿Qué error aparecería si el módulo no tuviera versions.tf?

   Pendiente.

3. Para agregar una etiqueta a todos los sitios, ¿cuántos archivos se modifican con un módulo? ¿Cuántos bloques se modificarían copiando y pegando?

   Pendiente.

4. ¿Qué necesitaría otro grupo para usar el módulo sin copiar la carpeta?

   Pendiente.

## Fase 7 - State remoto y ambientes

### Evidencias

Pendiente de ejecución.

Registrar:
- Creación del backend PostgreSQL sin revelar credenciales.
- Migración del state y terraform state list.
- Consulta de la tabla states.
- Prueba de bloqueo con dos terminales y cancelación de la operación.
- Plan y aprobación de destrucción del workspace default.
- Creación y despliegue de dev, staging y prod.
- Workspace y aprobación antes de cada apply.
- Verificación de siete sitios y versiones de imagen por ambiente.
- Filas de states después de crear los ambientes.
- Comprobación de ausencia de secretos.
- Commit de la fase.

### Respuestas

1. ¿Qué respondió la terminal 2 durante la prueba de bloqueo y qué problema evita?

   Pendiente.

2. ¿Dónde quedó la contraseña del backend y por qué no debe estar en main.tf?

   Pendiente.

3. ¿Qué filas tiene states y cómo se relacionan con los workspaces?

   Pendiente.

4. ¿Qué error produce plan en default y por qué es útil que falle?

   Pendiente.

5. ¿Por qué dev tiene un sitio, staging replica prod y prod utiliza otra versión de imagen?

   Pendiente.

6. ¿Qué riesgo implica compartir código y backend frente a utilizar carpetas separadas por ambiente?

   Pendiente.

## Fase 8 - Testing y calidad

### Evidencias

Pendiente de ejecución.

Registrar:
- Resultados de fmt y validate.
- Cuatro pruebas aprobadas.
- Observación del contenedor temporal durante despliegue_real.
- Escaneo completo antes y después de la corrección.
- Identificadores y cantidad de controles fallidos.
- Ejecución exitosa de validar.sh.
- Fallo del script al introducir formato incorrecto.
- Fallo del script al permitir acceso público al bucket.
- Restauración del código correcto.
- Commit de la fase.

El archivo de AWS solo se escanea; no se aplica.

### Respuestas

1. ¿Qué encontró cada nivel de validación que los demás no podían encontrar?

   Pendiente.

2. ¿Qué se observó con docker ps durante despliegue_real y por qué sirve un entorno desechable?

   Pendiente.

3. ¿Qué controles fallaron, cuántos quedaron después de corregir y cuáles corresponden a «sin buckets públicos»?

   Pendiente.

4. ¿Qué ventaja tiene detectar problemas antes del apply frente a encontrarlos en la nube?

   Pendiente.

5. ¿En qué etapa del pipeline va validar.sh y qué paso humano viene después?

   Pendiente.

## Fase 9 - Auditoría y cierre

### Evidencias

Pendiente de ejecución y de asignación del grupo para auditoría.

Registrar:
- Grupo y repositorio auditados.
- AUDITORIA.md con los seis anti-patrones evaluados con evidencia.
- Dos hallazgos concretos con archivo y línea.
- Una recomendación aplicable.
- Entrega del informe al grupo auditado.
- Observaciones recibidas sobre nuestro repositorio.
- Planes y aprobaciones de destrucción de dev, staging y prod.
- Verificación de que solo queda el backend del taller.
- Eliminación del backend después de destruir los ambientes.
- Verificación de que no quedan contenedores del grupo.
- Commit fase-9 y publicación en GitHub.

### Respuestas

1. ¿Qué anti-patrón encontraron en el otro grupo y cuál les señalaron a ustedes?

   Pendiente.

2. ¿Qué habría pasado si eliminaban el backend antes de ejecutar los destroy?

   Pendiente.

3. ¿Por qué destroy exige la misma disciplina de lectura que apply?

   Pendiente.

## Socialización

Pendiente.

Preparar una intervención de tres minutos sobre:
- Un hallazgo técnico que sorprendió al grupo.
- El anti-patrón más importante encontrado en la auditoría.
