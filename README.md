# APACHE, MARIADB & WORDPRESS CON DOCKER

---

## **DOCKERFILES**

Para construir una imagen para Docker haciendo uso del Dockerfile, deberá situarse en el directorio donde se
encuentra el Dockerfile y ejecutar el siguiente comando:

```bash
docker build -t (ImageName) .
```

El punto(".") hace indica que el Dockerfile se encuentra en la ruta actual.

---

## **DOCKER COMPOSE**

Para ejecutar el Docker Compose, nos iremos al directorio donde se encuentra dicho fichero y ejecutaremos el
siguiente comando:

```bash
docker compose up .
```
El Docker Compose está listo para ser ejecutado, sólo se debe cambiar el nombre de las imágenes si es que este
no coincide. Por defecto crea una red para los contenedores y unos volúmenes para la persistencia de los
mismos. Si se desea cambiar alguno de estos parámetros es libre de modificar el fichero a su gusto.
La imagen de MariaDB cuenta con las siguientes variables de entorno, las cuáles pueden ser modificadas en el
Docker Compose, en el Dockerfile, o al ejecutar la imagen con el comando "docker run" haciendo uso del 
parámetro "-e":

>ROOT_PASSWD (Contraseña para usuario root de MariaDB. Por defecto: "toor")
>NEW_USER (Nombre para nuevo usuario de MariaDB. Por defecto: "wordpress")
>NEW_USER_HOST (Host del nuevo usuario. Por defecto: "%")
>NEW_USER_PASSWD (Contraseña para el nuevo usuario. Por defecto: "Passw0rd!")
>NEW_DATABASE (Nombre de la nueva base de datos. Por defecto: "wordpress")

---

## **DOCKER IMAGES**

Para bajar las imágenes directamente desde mi Docker Hub podéis ejecutar el
siguiente comando:

```bash
docker push ffrias9/wordpress:latest
docker push ffrias9/mariadb:latest
```
