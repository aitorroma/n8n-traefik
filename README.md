![image-20210506104427925](https://tva1.sinaimg.cn/large/008i3skNgy1gq8sv4q7cqj303k03kweo.jpg)



### ¿Que es este repositorio?

En este repositorio realizaremos una implementación de N8N mediante Træfik 


## Configuración

Para hacer funcionar esta versión de n8n con traefik debes instalar primero el contenedor que cree para traefik.

https://github.com/aitorroma/docker-traefik

Una vez desplegado seguir estas instrucciones.

```sh
mkdir /root/containers
cd /root/containers
git clone https://github.com/aitorroma/n8n-traefik.git n8n
cd n8n
```

Ajustar las variables del fichero `.env` .

```
N8N_HOST=n8n.hiveagile.club

N8N_PROTOCOL=https
WEBHOOK_TUNNEL_URL=https://${N8N_HOST}
WEBHOOK_URL=${WEBHOOK_TUNNEL_URL}

EXECUTIONS_DATA_PRUNE=true
EXECUTIONS_DATA_MAX_AGE=336
GENERIC_TIMEZONE=Europe/Madrid

#### SMTP CONFIG #####

N8N_EMAIL_MODE=smtp
N8N_SMTP_HOST=smtp.eu.mailgun.org
N8N_SMTP_PORT=465
N8N_SMTP_USER=user@domain.com
N8N_SMTP_PASS=lapassword
N8N_SMTP_SSL=true
N8N_SMTP_SENDER=user@domain.com
```



### `N8N_HOST`

Está será la url que usaras para acceder a tu instancia de N8N, debes apuntar el registro dns **A** a tu servidor para que funcione.

### `WEBHOOK_TUNNEL_URL`

Está es la ur que usaras para conectar los webhooks con tu servidor.

### `SMTP CONFIG`

Debes configurar las variables de correo electrónico para que funcione el modo multiusuario.

## Uso

```sh
cd /root/containers/n8n
docker-compose up -d
```

Este comando levantara la instancia de n8n en el subdominio marcado con soporte para SSL.

## Hack Google translate

Añado un comando que permite usar el nodo **Execute Command** para traducir texto de Google sin limites

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

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h23x0vgp49j21a20u0gnf.jpg)

## Actualizaciones automáticas

Puedes usar watchtower que actualiza todos los contenedores que estan como latest

```
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower -i 30
```

## Invitación a mi Canal.

Estás invitado a mi canal de telegram, donde publico más soluciones como esta.

![Telegram-icon](https://tva1.sinaimg.cn/large/008i3skNgy1guctnvd002j600w00w0r202.jpg)https://t.me/aitorroma

## Descubre HiveAgile

Sí te ha gustado este contenedor unete a [HiveAgile.com](https://hiveagile.com) una comunidad sobre OpenSource donde puedes encontrar muchos contenedores de docker listos para usar, democratizando toda la parte técnica para crear tus propios proyectos. 

----------------------------------------------------------

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J3J64AN17)

