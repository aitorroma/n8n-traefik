![image-20210506104427925](https://tva1.sinaimg.cn/large/008i3skNgy1gq8sv4q7cqj303k03kweo.jpg)



### ¿Que es este repositorio?

En este repositorio realizaremos una implementación de N8N mediante Træfik 


## Configuración

Para hacer funcionar esta versión de n8n con traefik debes instalar primero el contenedor que cree para traefik.

https://github.com/aitorroma/docker-traefik

Una vez desplegado seguir estas instrucciones.

```sh
cd /opt
git clone https://github.com/aitorroma/n8n-traefik.git n8n
cd n8n
```

Ajustar las variables del fichero `.env` .

```
N8N_HOST=n8n.domain.com
N8N_PROTOCOL=https
WEBHOOK_TUNNEL_URL=https://n8n.domain.com/
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=ChangeMe!
EXECUTIONS_DATA_PRUNE=true
EXECUTIONS_DATA_MAX_AGE=336
GENERIC_TIMEZONE=Europe/Madrid
```



### `N8N_HOST`

Está será la url que usaras para acceder a tu instancia de N8N, debes apuntar el registro dns **A** a tu servidor para que funcione.

### `WEBHOOK_TUNNEL_URL`

Está es la ur que usaras para conectar los webhooks con tu servidor.

### `N8N_BASIC_AUTH_PASSWORD`

Está es la contraseña para acceder a tu instancia de n8n.

## Uso

```sh
cd /opt/n8n
docker-compose up -d
```

Este comando levantara la instancia de n8n en el subdominio marcado con soporte para SSL.

## Hack Google translate
Añado un comando que permite usar el nodo de comando de sistema para traducir texto de Google sin limites
Puedes instalarlo con el comando

```
cd /opt/n8n
make installtrans
```
Podrás usar este comando para traducir texto.
```
/usr/bin/translate --brief -t es "HiveAgile, is the best comunity of the world"  -no-auto
```
Aquí puedes ver como funciona:

![n8n](https://tva1.sinaimg.cn/large/e6c9d24egy1h23wumyhvdj21a20u0abv.jpg)

## Actualizaciones automáticas

Puedes usar watchtower que actualiza todos los contenedores que estan como latest

```
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower n8n
```





## Invitación a mi Canal.

Estás invitado a mi canal de telegram, donde publico más soluciones como esta.

![Telegram-icon](https://tva1.sinaimg.cn/large/008i3skNgy1guctnvd002j600w00w0r202.jpg)https://t.me/aitorroma

----------------------------------------------------------

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J3J64AN17)

