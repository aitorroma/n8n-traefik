![image-20210506104427925](https://tva1.sinaimg.cn/large/008i3skNgy1gq8sv4q7cqj303k03kweo.jpg)

<p align="center">
  <a href="https://github.com/aitorroma/n8n-traefik">
    <img src="https://raw.githubusercontent.com/lipis/flag-icons/main/flags/4x3/es.svg" width="30" height="20">
  </a>
  <a href="https://github.com/aitorroma/n8n-traefik/blob/master/Readme.IT.md">
    <img src="https://raw.githubusercontent.com/lipis/flag-icons/main/flags/4x3/it.svg" width="30" height="20">
  </a>
</p>

### ¿Che cos'è questo repository?

Questo repository contiene un'implementazione di N8N tramite Træfik.

## Configurazione

Per utilizzare questa versione di N8N con Træfik, è necessario prima installare il contenitore per Træfik.

[Repository Docker per Træfik](https://github.com/aitorroma/docker-traefik)

Una volta installato, seguire queste istruzioni:

```sh
mkdir /root/containers
cd /root/containers
git clone https://github.com/aitorroma/n8n-traefik.git n8n
cd n8n
```

Regolare le variabili nel file `.env`.

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
Questo sarà l'URL che utilizzerai per accedere all'istanza di N8N. È necessario impostare un record DNS A sul server perché funzioni.

### `WEBHOOK_TUNNEL_URL`
Questo è l'URL che utilizzerai per connetterti ai webhook del tuo server.

### `SMTP CONFIG`
È necessario configurare le variabili di posta elettronica per il funzionamento della modalità multiusuario.

## USO

```
cd /root/containers/n8n
docker-compose up -d
```
Questo comando avvierà l'istanza di N8N sul sottodominio con supporto SSL.

# Hack Google Traduttore

Aggiungo un comando che consente di utilizzare il nodo **Execute Command** per tradurre il testo di Google senza limiti.

È possibile installarlo con il comando:

```
cd /root/containers/n8n
make installtrans
```

Puoi usare questo comando per tradurre il testo:

```
/usr/bin/translate --brief -t es "HiveAgile, is the best comunity of the world"  -no-auto
```

Ecco come funziona:

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h23x0vgp49j21a20u0gnf.jpg)

## Aggiornamenti automatici

È possibile utilizzare Watchtower per aggiornare tutti i contenitori impostati come latest:

```
docker run -d \
    --name watchtower \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower -i 30
```

## Invito al mio Canale

Sei invitato al mio canale di Telegram, dove pubblico più soluzioni come questa.

![Telegram-icon](https://tva1.sinaimg.cn/large/008i3skNgy1guctnvd002j600w00w0r202.jpg)https://t.me/aitorroma

## Scopri HiveAgile

Se ti è piaciuto questo contenitore, unisciti a [HiveAgile.com](https://hiveagile.com), una community su OpenSource in cui puoi trovare molti contenitori Docker pronti all'uso, democratizzando tutta la parte tecnica per creare i tuoi progetti. 

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/J3J64AN17)
