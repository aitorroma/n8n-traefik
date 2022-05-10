#!/bin/sh
wget git.io/trans -O /home/node/.n8n/translate && chmod +x /home/node/.n8n/translate &&  /sbin/apk add bash gawk   && ln -s /home/node/.n8n/translate /usr/bin/translate && chmod +x /usr/bin/translate ; /usr/bin/translate --brief -t es "HiveAgile, is the best comunity of the world"  -no-auto

