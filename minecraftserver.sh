#!/bin/bash
# 
#
# 
# ---------------------------------------------------------------------------------------------
# Name:    - Gameserververwaltungsscript 
# Version: - 0.2.5-Beta2
# Autor:  -  Jonas
# Lizenz:  - GPLv3
# E-Mail:  - ermert.jonas@yahoo.de
# Web:     - http://jonasermert.de
# Datum:   - 23.10.2010
#
#
#
#    Copyright (C) © 2010-2011 by JonasErmert.de
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# 
#
# ---------------------------------------------------------------------------------------------

clear

SERVER="Servername"
IP="IP-Adresse"
PORT="Port"

cd $(dirname $0)

 case "$1" in
start)
if [[ `screen -ls |grep $SERVER` ]]; then
 clear; echo "Server laeuft bereits."
 exit
 else sleep 0
fi

screen -dmSL $SERVER java -Xmx512M -Xms512M -jar minecraft_server.jar 
clear
echo "Server gestartet."
;;

stop)
if [[ `screen -ls |grep $SERVER` ]]; then
 screen -dr $SERVER -X stuff $'\n'
 screen -dr $SERVER -X stuff "save-all"
 screen -dr $SERVER -X stuff $'\n'
 sleep 5
 screen -dr $SERVER -X quit
 echo "Server gestoppt."
 else
 echo "Keine Screensession gefunden."
fi
;;

status)
if [[ `screen -ls |grep $SERVER` ]]; then
 clear; echo "Server laeuft."
 else echo "Server laeuft nicht."
fi
;;

save)
if [[ `screen -ls |grep $SERVER` ]]; then
 screen -dr $SERVER -X stuff $'\n'
 screen -dr $SERVER -X stuff "save-all"
 screen -dr $SERVER -X stuff $'\n'
 echo "Befehl wurde an den Server uebergeben"
 else echo "Server laeuft nicht."
fi

;;

*)
echo "Usage: $0 {start|stop|restart|status|save}"
;;

esac
exit
