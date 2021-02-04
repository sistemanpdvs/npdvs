#!/bin/bash
#
# NPDVs.sh
# Automatização sobre demanda
# Nilsonlinux 23/07/2020
# Colabore com o projeto
# https://github.com/nilsonlinux/npdvs
# -------------------------------------------------------
#Variáveis
pdvs_ips='139 131 122 123 124 25 102 103 104 105 107 120 140 133 110 11 112 113 114 130 116 55 59 117 225 132 138 128' #FINAL dos IPS DOS PDVS...
GW="100"
version="3.5"
192.168.6.36="GMCORE"
GMCORE='6.36'
IPSERV='192.168'
RES="1920x1030"
export DIR="$(dirname "$(readlink -f "$0")")"
spath="$( cd "$( dirname $0 )" && pwd )"
a='\033[1;33m'       # Amarelo
p='\033[0;35m'       # Purple
v="\033[0;31m"       #vermelho
vr="\033[01;32m"      #Verde
br="\033[0;37m"      #Branco
b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
end='\033[0m'
# (1) Reiniciar PDVs
painel () {
echo -e "
-------------------------------------${end}
LOJA  | ${c}CIDADE ${endc}               |${vr}FAIXA${endc}|
-------------------------------------${end}
  3   | ${c}SUPER SANTA INES${endc}      |${vr}3    ${endc}|
  32  | ${c}MIX TIMON${endc}             |${vr}46   ${endc}|
  39  | ${c}MIX CHAPADINHA${endc}        |${vr}114  ${endc}|
  40  | ${c}SUPER BARRA DO CORDA${endc}  |${vr}231  ${endc}|
  41  | ${c}MIX CAXIAS${endc}            |${vr}11   ${endc}|
  47  | ${c}MIX BACABAL${endc}           |${vr}115 ${endc} |
  48  | ${c}MIX PEDREIRAS${endc}         |${vr}93 ${endc}  |
  91  | ${c}MIX SANTA INES${endc}        |${vr}91 ${endc}  |
  99  | ${c}MIX PINHEIRO${endc}          |${vr}117 ${endc} |
  55  | ${c}PRESIDENTE DULTRA${endc}     |${vr}55 ${endc}  |
  65  | ${c}ELETRO SANTA INES${endc}     |${vr}65 ${endc}  |
  68  | ${c}ELETRO SANTA LUZIA${endc}    |${vr}68 ${endc}  |
  69  | ${c}ELETRO PEDREIRAS${endc}      |${vr}69 ${endc}  |
  79  | ${c}ELETRO LAGO DA PEDRA${endc}  |${vr}79 ${endc}  |
  131 | ${c}ELETRO BACABAL${endc}        |${vr}131 ${endc} |
  163 | ${c}ELETRO COROATÁ${endc}        |${vr}37 ${endc}  |
  164 | ${c}ELETRO TIMON${endc}          |${vr}166 ${endc} |
  165 | ${c}ELETRO VIANA${endc}          |${vr}167 ${endc} |
  170 | ${c}ELETRO SÃO MATEUS${endc}     |${vr}168 ${endc} |
  173 | ${c}ELETRO COROTA 2${endc}       |${vr}191 ${endc} |
  176 | ${c}ELETRO CODÓ 2${endc}         |${vr}185 ${endc} |
  202 | ${c}SUPER CODÓ${endc}            |${vr}142 ${endc} |
  251 | ${c}MIX PARNAIBA${endc}          |${vr}118 ${endc} |
  252 | ${c}MIX TERESINA${endc}          |${vr}161 ${endc} |
  431 | ${c}CAMINO LAGO DA PEDRA${endc}  |${vr}144 ${endc} |
  433 | ${c}CAMINO VIANA${endc}          |${vr}136 ${endc} |
  434 | ${c}CAMINO BARREIRINHAS${endc}   |${vr}000 ${endc} |
  435 | ${c}CAMINO COROATÁ${endc}        |${vr}41 ${endc}  |
  436 | ${c}CAMINO SANTA INES${endc}     |${vr}169 ${endc} |
  439 | ${c}CAMINO MIRANDA${endc}        |${vr}170 ${endc} |
  445 | ${c}CAMINO ITAPECURÚ${endc}      |${vr}170 ${endc} |
  447 | ${c}CAMINO TUTÓIA${endc}         |${vr}146 ${endc} |
------------------------------------- ${end}"
}
# NPDVs Logo
logoNPDVs () {
  clear
  echo -e "${vr} 
   _   _ ____  ______     __   
  | \ | |  _ \|  _ \ \   / /__ 
  |  \| | |_) | | | \ \ / / __|
  | |\  |  __/| |_| |\ V /\__ \ 
  |_| \_|_|   |____/  \_/ |___/
             © 2020
          ${y}Versão :${end}${bu} ${version}${end}"
    echo
}
# Exit NPDVss
NPDVsExit () {
  logoNPDVs 
  echo -e " Obrigado por utilizar o ${b}NPDVs${end}
 Desenvolvido por: Nilsonlinux
 ${b}Telegram -➤ ${bu}https://t.me/nilsonlinux${end}"
  echo && sleep 1
  exit
}
# APT Update
#aptgupd () {
#  echo && echo -e " ${y}Preparing To Perform APT Update${endc}"
#  echo " It Is Recommended To Perform APT Update"
#  echo " Before You Install Any Application."
#  echo -en " ${y}Would You Like To Perform APT Update Now ? {y/n}${endc} "
#  read option
#  case $option in
#    y) ;;
#    n) echo " Skiping APT Update"; sleep 1; return 1 ;;
#    *) echo " \"$option\" Is Not A Valid Option"; sleep 1; aptgupd ;;
#  esac
#  echo && echo -e " Performing ${b}APT Update${end}"
#  apt -y update &>/dev/null
#  echo -e " ${b}APT Update${end} Completed"
#  echo && echo -en " ${y}Press Enter To Continue"
#  read input
#}
# Internet Check
checkinternet () {
  if ping -c 1 google.com &>/dev/null; then
    echo -e " Checando conexão com a internet: ${vr}CONECTADO ✅${endc}"
    NPDVsCheck
  else
    echo -e " Checando conexão com a internet: ${r}DESCONECTADO ❌${endc}
 ${y}Você precisa está conectado para a utilização do CliPDVs${endc}"
    echo -e " ${b}O Script está sendo${end} encerrado..."
    echo && sleep 5
    NPDVsExit
  fi
}
##################
NPDVsStart () {
  $spath/npdvs.sh
  exit
}
# New Version Check & Update
NPDVsupdate () {
  logoNPDVs
  echo -e " Preparando atualização ${b}NPDVs${end}"
  echo && echo -en " ${y}Precione ENTER para continuar${endc}"
  read input
  echo && echo -e " Atualizando ${b}NPDVs${end}, Por favor aguarde..."
  wget https://raw.githubusercontent.com/sistemanpdvs/npdvs/master/npdvs.sh -O $spath/npdvs.sh &>/dev/null
  sleep 1 && echo -e " ${b}NPDVs${end} Atualização aplicada com sucesso "
  sleep 1 && echo -e " Restartando ${b}NPDVs${end}..."
  sleep 2
  NPDVsStart
}
# New Version Check & Update
NPDVsCheck () {
  changelog=$(curl --silent -q https://raw.githubusercontent.com/sistemanpdvs/npdvs/master/changelog.txt)
  uversion=$(curl --silent -q https://raw.githubusercontent.com/sistemanpdvs/npdvs/master/version.txt)
  if [[ $uversion > $version ]]; then
    echo -e " Checando atualização: ${r}Nova versão disponível"
    echo && echo -e " Versão em uso: ${y}$version${endc} ${g} ➤  Nova versão: ${endc}${y}$uversion${endc}"
    echo -e " ${bu}Changelog:${endc}\n$changelog"
    echo && echo -en " ${y}Continuar com a atualização? {s/n}${endc} "
    read option
    case $option in
      s) NPDVsupdate ;;
      n) echo -e " ${y}Ok, Iniciando NPDVs.${endc}"; sleep 1; aptgupd ;;
      *) echo " \"$option\" Opção inválida, tente outra opção."; sleep 1; NPDVsCheck ;;
    esac
  else
    echo -e " Checando novas atualizações: ${g}NPDVs está atualizado${endc}"
    aptgupd
  fi
}
##################
# INICIALIZAÇÃO DO SCRIPT
logoNPDVs && echo -e " ${y}Inicializando NPDVs...${endc}" && checkinternet
# -------------------------------------------------------

# (7-2) Install Mozilla Firefox
installfirefox () {
  logoNPDVs
  echo -e " Preparing To Install ${b}Mozilla Firefox${end}" && echo
  echo -e " ${bu}From Mozilla: Mozilla Firefox is a fast, full-featured Web browser.
 Firefox includes pop-up blocking, tab-browsing,
 integrated Google search, simplified privacy controls,
 a streamlined browser window that shows you more of
 the page than any other browser and a number of additional
 features that work with you to help you get the most out of
 your time online.
 Read more about it here: ${b}https://www.mozilla.org/${end}"
  echo && echo -e " ${b}${r}CLOSE ALL YOUR FIREFOX WINDOWS BEFORE UPDATING ${end}"
  echo && echo -en " ${y}Do You Want To Continue? {y/n}${endc} "
  read option
  case $option in
    y) echo && echo -e " Installing ${b}Firefox${end}"; apt -y install firefox-esr &>/dev/null; Comando_feito_ok "Firefox" ;;
    n) echo -e " ${y}OK. Returning To Menu${endc}"; sleep 1; showwebapps ;;
    *) echo " \"$option\" Is Not A Valid Option"; sleep 1; installfirefox ;;
  esac
}

# -------------------------------------------------------
# Script Menus
# (1) Reiniciar PDVs
reiniciar_pdvs () {
  logoNPDVs
echo -e " ${r}REINICIALIZAÇÃO DOS TERMINAIS (CliPDVs)${end}"
 painel
echo -e "DIGITE A ${y}FAIXA${end} ${r}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
logoNPDVs
echo -e " ${r}REINICIALIZAÇÃO DOS TERMINAIS (NPDVs) ${end}"
loja
echo -e "DIGITE O ${y}FINAL DO IP${end} ${r}QUE DESEJA REINICIAR: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${r}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛${end}"
sleep 1
if ! ping -c 1 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@192.168.$FX.$IP "reboot";
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end -$bu $IPSERV.$FX.$IP $end- $vr Conectado ✔$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
# --------------
# (1) Atualizar PDVs
atualizar_pdvs () {
  logoNPDVs
echo -e " ${c}ATUALIZAÇÃO DOS TERMINAIS (NPDVs)${end}"
painel
echo -e "DIGITE A ${c}FAIXA${end} ${br}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
logoNPDVs
echo -e " ${c}ATUALIZAÇÃO DOS TERMINAIS (NPDVs) ${end}"
loja
echo -e "DIGITE O ${c}FINAL DO IP${end} ${br}QUE DESEJA ATUALIZAR: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${c}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛ ${end}"
sleep 1
if ! ping -c 2 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@192.168.$FX.$IP "it-update-pdv.sh";
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end - $bu $IPSERV.$FX.$IP $end - $vr Conectado$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
# (3) Reiniciar todos os PDVs
wait
reiniciar_todos () {
logoNPDVs
echo -e " ${v}REINICIALIZAÇÃO DOS TERMINAIS (NPDVs)"
echo -e "${v}---------------------------------------------------${end}
  ${br}Reinicialização dos terminais 
  por faixa.${end}
${v}--------------------------------------------------- ${end}"
echo -e " DIGITE A${y} FAIXA DA FILIAL${end} ${v}QUE DESEJA REINICIALIZAR OS TERMINAIS: ${end}"
echo -e " Caso queira desistir${y}, apenas deixe o campo em branco e dê enter... ${end}"
read -p " $IPSERV." $read FX
clear
echo -e "${v}--------------------------------------------------- ${end}"
echo -e "${y}⌛Aguarde enquanto executo o comando 
${v}reboot${end} ${y}em todos os terminais ⌛ ${end}
${v}--------------------------------------------------- ${end}"
##############
${pdv_ips}
for pdvs_ips in ${pdvs_ips}
do
    echo -e "${v}Reiniciando terminal${end} ${g}IP${end} - ${vr}${IPSERV}.${FX}.${pdvs_ips}${endc} ⌛"
    sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@${IPSERV}.${FX}.${pdvs_ips} "reboot";
    echo -e '\n'
done
#############
clear
echo -e "$v======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$v======================================== $end"
#############
echo && echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
}
##########
# (1) Desligar PDVs
desligar_pdvs () {
  logoNPDVs
echo -e " ${r}🚨 DESLIGAMENTO DOS TERMINAIS (NPDVs) 🚨 ${end}"
painel
echo -e "DIGITE A ${y}FAIXA${end} ${r}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
logoNPDVs
echo -e " ${r}🚨 DESLIGAMENTO DOS TERMINAIS (CliPDVs) 🚨 ${end}"
loja
echo -e "DIGITE O ${y}FINAL DO IP${end} ${r}QUE DESEJA DESLIGAR: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${r}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛${end}"
sleep 1
if ! ping -c 1 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@192.168.$FX.$IP "halt";
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end -$bu $IPSERV.$FX.$IP $end- $vr Conectado ✔$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
# -------------
################################### (4) Atualizar todos os PDVs ######################################
wait
atualizar_todos () {
  logoNPDVs
echo -e " ${bu}ATUALIZAÇÃO DOS TERMINAIS (NPDVs)"
echo -e "${bu}---------------------------------------------------${end}
  ${br}Atualização dos terminais 
  por faixa de sua filial${end}
${bu}--------------------------------------------------- ${end}"
echo -e " DIGITE A${y} FAIXA DA FILIAL${end} ${bu}QUE DESEJA ATUALIZAR: ${end}"
echo -e " Caso queira desistir${y}, apenas deixe o campo em branco e dê enter... ${end}"
read -p " $IPSERV." $read FX
clear
echo -e "${bu}--------------------------------------------------- ${end}"
echo -e "${y}⌛Aguarde enquanto executo o comando 
${bu}it-update-pdv.sh${end} ${y}em todos os terminais ⌛ ${end}
${bu}--------------------------------------------------- ${end}"
##############
${pdvs_ips}
for pdvs_ips in ${pdvs_ips}
do
    echo -e "${bu}Atualizando terminal${end} ${g}IP${end} - ${vr}${IPSERV}.${FX}.${pdvs_ips}${endc} ⌛"
    sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@${IPSERV}.${FX}.${pdvs_ips} "it-update-pdv.sh";
    echo -e '\n'
done
#############
clear
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
#############
echo && echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
}
################################### (4) Atualizar todos os PDVs ######################################
################################### (4) Desligar todos os PDVs ######################################
wait
desligar_todos () {
  logoNPDVs
echo -e "${v}---------------------------------------------------${end}"
echo -e "${r}🚨 DESLIGAMENTO DOS TERMINAIS (NPDVs) 🚨"
echo -e "${v}--------------------------------------------------- ${end}"
echo -e " DIGITE A${y} FAIXA DA FILIAL${end} ${v}QUE DESEJA DESLIGAR: ${end}"
echo -e " Caso queira desistir${y}, apenas deixe o campo em branco e dê enter... ${end}"
read -p " $IPSERV." $read FX
clear
echo -e "${v}--------------------------------------------------- ${end}"
echo -e "${y}⌛Aguarde enquanto executo o comando 
${v}halt${end} ${y}em todos os terminais ⌛ ${end}
${v}--------------------------------------------------- ${end}"
##############
${pdv_ips}
for pdvs_ips in ${pdvs_ips}
do
    echo -e "${bu}Desligando terminal${end} ${g}IP${end} - ${vr}${IPSERV}.${FX}.${pdvs_ips}${endc} ⌛"
    sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@${IPSERV}.${FX}.${pdvs_ips} "halt";
    echo -e '\n'
done
#############
clear
echo -e "$v======================================== $end"
echo -e "$v    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$v======================================== $end"
#############
echo && echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
}
# (1) Atualizar PDVs
atualizar_imagem () {
  logoNPDVs
echo -e " ${c}ATUALIZAÇÃO DE IMAGEM DOS TERMINAIS (NPDVs)"
painel
echo -e "DIGITE A ${c}FAIXA${end} ${br}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
  logoNPDVs
echo -e " ${c}ATUALIZAÇÃO DE IMAGEM DOS TERMINAIS (NPDVs)"
loja
echo -e "DIGITE O ${c}FINAL DO IP${end} ${br}QUE DESEJA ATUALIZAR IMAGEM: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${bu}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛ ${end}"
sleep 1
if ! ping -c 2 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@192.168.$FX.$IP "it-update-imagens.sh";
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end - $bu $IPSERV.$FX.$IP $end - $vr Conectado$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
################################### ATUALIZAR IMAGEM PDVs ######################################
wait
atualizar_imagem_todos () {
  logoNPDVs
echo -e " ${bu}ATUALIZAÇÃO DE IMAGEM DOS TERMINAIS (NPDVs)"
echo -e "${bu}---------------------------------------------------${end}
  ${br}Atualização dos terminais 
  por faixa de sua filial${end}
${bu}--------------------------------------------------- ${end}"
echo -e " DIGITE A${y} FAIXA DA FILIAL${end} ${bu}QUE DESEJA ATUALIZAR: ${end}"
echo -e " Caso queira desistir${y}, apenas deixe o campo em branco e dê enter... ${end}"
read -p " $IPSERV." $read FX
clear
echo -e "${bu}--------------------------------------------------- ${end}"
echo -e "${y}⌛Aguarde enquanto executo o comando 
${bu}it-update-imagens.sh${end} ${y}em todos os terminais ⌛ ${end}
${bu}--------------------------------------------------- ${end}"
##############
${pdv_ips}
for pdvs_ips in ${pdvs_ips}
do
    echo -e "${bu}Atualizando imagem do terminal${end} ${g}IP${end} - ${vr}${IPSERV}.${FX}.${pdvs_ips}${endc} ⌛"
    sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@${IPSERV}.${FX}.${pdvs_ips} "it-update-imagens.sh";
    echo -e '\n'
done
#############
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
#############
echo && echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
}
################################### (6) Atualizar imagens MaxiPOS Todos #############################
################################### (11) Reiniciar Maxipos PDVs ######################################
reiniciar_maxipos () {
  logoNPDVs
echo -e " ${r}REINICIALIZAÇÃO DO MAXIPOS (NPDVs)"
painel
echo -e "DIGITE A ${y}FAIXA${end} ${r}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
logoNPDVs
echo -e " ${r}REINICIALIZAÇÃO DO MAXIPOS (NPDVs)"
loja
echo -e "DIGITE O ${y}FINAL DO IP${end} ${r}QUE DESEJA REINICIAR O MAXIPOS: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${r}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛${end}"
sleep 1
if ! ping -c 1 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@192.168.$FX.$IP "it-restart-application.sh";
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end -$bu $IPSERV.$FX.$IP $end- $vr Conectado ✔$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
# --------------
# (5) Teste de ping PDVs
ping_test () {
  logoNPDVs
echo -e " ${bu}🌐 TESTE DE CONEXÕES (NPDVs) 🌐
---------------------------------------------------${end}
  ${br}Faça o teste de conexão de um determinado IP
  com faixa + final de seu endereçamento...${end}
${bu}--------------------------------------------------- ${end}"
echo -e "DIGITE A ${a}FAIXA${end} ${bu}DO IP QUE DESEJA FAZER O TESTE DE CONEXÃO: ${end}"
read -p "$IPSERV." $read FX
##########
clear
logoNPDVs
echo -e " ${bu}🌐 TESTE DE CONEXÕES (NPDVs) 🌐
---------------------------------------------------${end}
  ${br}Faça o teste de conexão de um determinado IP
  com faixa + final de seu endereçamento...${end}
${bu}--------------------------------------------------- ${end}"
echo -e "DIGITE O ${a}FINAL DO IP${end} ${bu}QUE DESEJA FAZER O TESTE DE CONEXÃO: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${bu}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛${end}"
sleep 2
if ! ping -c 1 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       $IPSERV.FX.$IP DESCONECTADO.     $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================= $end"  
echo -e "$vr       $IPSERV.$FX.$IP CONECTADO.        $end"
echo -e "$vr======================================= $end"  
echo -e "$vr======[ $br Status da requisição $ec $vr]======     $end"
echo -e "$a IP $end - $bu $IPSERV.$FX.$IP $end - $vr Conectado ✔$end"      
echo -e "$vr======================================= $end"
ping -c 5 $IPSERV.$FX.$IP
echo && echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
fi
}
# --------------
# (5) Teste de ping link ou IP
ping_test_ip_link () {
  logoNPDVs
echo -e " ${bu}🌐 TESTE DE CONEXÕES (NPDVs) 🌐
---------------------------------------------------${end}
${br}Faça o teste de conexão de um determinado IP...${end}
${bu}--------------------------------------------------- ${end}"
echo -e "DIGITE O ${y}IP${end} ${bu}OU LINK QUE DESEJA FAZER O TESTE DE CONEXÃO: ${end}"
read -p "http://"$read IP_LINK
echo -e "${y}⌛Aguarde enquanto testamos conexão com o servidor ⌛${end}"
##########
if ! ping -c 1 $IP_LINK >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IP_LINK $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================= $end"  
echo -e "$vr         SERVIDOR CONECTADO.  $end "
echo -e "$vr======================================= $end"  
echo -e "$vr======[ $br Status da requisição $ec $vr]======     $end"
echo -e "$a IP $end - $bu $IP_LINK $end - $vr Conectado ✔$end"      
echo -e "$vr======================================= $end"
ping -c 5 $IP_LINK
echo && echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
fi
}
# (1) GMCORE
gmcore () {
  logoNPDVs
echo -e " ${vr}ACESSO GMCORE (NPDVs)
---------------------------------------------------${end}
  ${br}Acesso ao gmcore.${end}
${vr}--------------------------------------------------- ${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o servidor ⌛${end}"
sleep 1
if ! ping -c 1 ${IPSERV}.${GMCORE} >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       SERVIDOR DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu ${IPSERV}.${GMCORE} $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         SERVIDOR CONECTADO.  $end "
echo -e "$vr======================================== $end"
rdesktop -g ${RES} ${IPSERV}.${GMCORE}
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end -$bu ${IPSERV}.${GMCORE} $end- $vr Conectado ✔$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EFETUADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
###################################  (10) DELETAR PASTA /TMP #/mpos/maxipos/tmp ######################################
dell_past_temp () {
  logoNPDVs
echo -e " ${r}APAGAR ARQUIVOS TEMPORÁRIOS MAXIPOS (NPDVs)"
painel
echo -e "DIGITE A ${y}FAIXA${end} ${r}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
logoNPDVs
echo -e " ${r}APAGAR ARQUIVOS TEMPORÁRIOS MAXIPOS (NPDVs)"
loja
echo -e "DIGITE O ${y}FINAL DO IP${end} ${r}QUE DESEJA APAGAR A PASTA TEMPORÁRIA: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${r}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛${end}"
sleep 1
if ! ping -c 1 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@$IPSERV.$FX.$IP "rm -rf /mpos/maxipos/tmp/*";
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end -$bu $IPSERV.$FX.$IP $end- $vr Conectado ✔$end"
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 5
fi
}
# --------------
# (1) Acesso SSH PDVs
ssh_pdvs () {
  logoNPDVs
echo -e " ${c}ACESSO SSH TERMINAIS (NPDVs)${end}"
painel
echo -e "DIGITE A ${c}FAIXA${end} ${br}REFERÊNTE A SUA FILIAL: ${end}"
read -p "$IPSERV." $read FX
clear
##########
  clear
logoNPDVs
echo -e " ${c}ACESSO SSH TERMINAIS (NPDVs)${end}"
loja
echo -e "DIGITE O ${c}FINAL DO IP${end} ${br}ACESSAR VIA SSH: ${end}"
read -p "$IPSERV.$FX." $read IP
echo -e "${c}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com o terminal ⌛ ${end}"
sleep 1
if ! ping -c 2 $IPSERV.$FX.$IP >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       TERMINAL DESCONECTADO.           $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$a IP $end-$bu $IPSERV.$FX.$IP $end- $v Sem conexão ✗$end" 
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr         TERMINAL CONECTADO.  $end "
echo -e "$a IP $end - $bu $IPSERV.$FX.$IP $end - $vr Conectado$end"
echo -e "$vr======================================== $end"
sshpass -p 1 ssh -o "StrictHostKeyChecking no" root@$IPSERV.$FX.$IP
echo -e "$vr=======[ $br Status da requisição $ec $vr]=======$end"
echo -e "$a IP $end - $bu $IPSERV.$FX.$IP $end - $vr Conectado$end"
clear
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Retornando para o menu principal.
⌛Por favor aguarde ⌛${endc}"
sleep 3
fi
}
# Show About
sobre () {
  clear
  echo -e "
    ###########################################################
    #                  Sobre o NPDVs                        #
    #     Script para automatização de tarefas CPDs Regional. #
    ###########################################################
    #    -- Op-System  :   Linux / Termux                     #
    #    -- Codename   :   CliPDVs                            #
    #    -- Version    :   V-build ($version)                      #
    #    -- Coder      :   GitHub                             #
    ###########################################################
     ${b}Descrição${end}
    Este script visa proporcionar um fácil acesso
    para automatização de tarefas interna
    dos CPDs da regional.
     ${b}Nota${end}
    Você precisa está conectado na rede interna 
    de sua filial, para o funcionamento.
    Se tentar utilizar o script sem conexão, você
    não terá acesso.
     ${b}Reports${end}
    Você pode está acompanhando o desenvolvimento
    através de nossa página no GitHub:
    ${u}${blue}https://github.com/nilsonlinux/NPDVs${end}.
    Correção de bugs, implemento de código, e
    caso você pretenda utilizar e precisar mexer no código,
    favor manter os créditos."
  echo && echo -en " ${yellow}Precione enter para retornar ao Menu.${endc}"
  read input
}
# links úteis
links () {
  logoNPDVs
  echo -e "
     ${vr}Links úteis.${end}"
  echo -e " ${g}  -----------------------------------------${end}
    ${bu}http://pdv.mateus/maxipos_backoffice/app
    ${bu}http://armateus.com.br
    ${bu}http://b2b.crednosso.com.br/garantia/loginGarantia.jsf
    ${bu}https://sitefconciliacao.softwareexpress.com.br/sitefweb/pages/inicial.zeus
    ${bu}https://telegram.org/dl/desktop/linux
    ${bu}${blue}https://github.com/nilsonlinux/NPDVs${end}"
  echo -e " ${g}  -----------------------------------------${end}"
  echo && echo -en " ${yellow}Precione enter para retornar ao Menu.${endc}"
  read input
}
# ADM ###############################################
adm () {
  logoNPDVs
echo -e " ${r}ACESSO ADMINISTRATIVO (NPDVs)"
echo -e "DIGITE O NOME DE ${y}USUÁRIO E SENHA${end} ${r}, PARA ACESSO: ${end}"
  clear
logoNPDVs
echo -e "${r}---------------------------------------------------${end}"
echo -e "${y}⌛Aguarde enquanto testamos conexão com a internet ⌛${end}"
sleep 1
if ! ping -c 1 8.8.8.8 >> /dev/null ; then
clear
echo -e "$v======================================= $end"
echo -e "$v       VOCÊ ESTÁ DESCONECTADO.          $end"
echo -e "$v======================================= $end"
echo -e "$v      _____ ____  ____   ___    _       $end"
echo -e "$v     | ____|  _ \|  _ \ / _ \  | |      $end"
echo -e "$v     |  _| | |_) | |_) | | | | | |      $end"
echo -e "$v     | |___|  _ <|  _ <| |_| | |_|      $end"
echo -e "$v     |_____|_| \_\_| \_\\____/  (_)     $end"
echo && echo -e "$v======================================= $end"
echo -e "$v======[ $br Status da requisição $ec $v]======= $end"
echo -e "$v======================================= $end"
echo -en "${y}Precione enter para retornar para o manu.${endc}"
read input
echo -e "$v=======================================$end" 
else
clear
echo -e "$vr======================================== $end"
echo -e "$vr  DIGITE O USUÁRIO E SENHA PARA ACESSO.  $end "
echo -e "$vr======================================== $end"
git clone https://github.com/sistemanpdvs/npdvs_admin.git && chmod +x ./npdvs_admin/*
echo -e "$vr======================================== $end"
echo -e "$vr    COMANDO EXECUTADO COM SUCESSO... $end"
echo -e "$vr======================================== $end"
echo -e "${y}Você está sendo encaminhado para o menu principal do acesso administrativo.
⌛Por favor aguarde ⌛${endc}"
NPDVsADMstart
sleep 3
fi
}
# ADM ###############################################
NPDVsADMstart () {
  ./npdvs_admin/npdvs.sh
  exit
}
# ADM
# NPDVs Status Host Monitor
monitor () {
  clear
  logoNPDVs
  $spath/monitor.sh
  exit
}
# NPDVs Status Host Monitor
# Infinite Loop To Show Menu Untill Exit
while :
do
logoNPDVs
echo -e "${g}------[ MENU PRINCIPAL NPDVs ]-------${end}
${g}[ ${y}1 ${end}${g}]${end} ${vr} REINICIAR PDVs${end}
${g}[ ${y}2 ${end}${g}]${end} ${vr} ATUALIZAR PDVs${end}
${g}[ ${y}3 ${end}${g}]${end} ${vr} DESLIGAR PDVs${end}
${g}[ ${y}4 ${end}${g}]${end} ${vr} ATUALIZAR IMAGEM MaxiPOS${end}
${g}[ ${y}5 ${end}${g}]${end} ${vr} REINICIAR MaxiPOS${end}
${g}[ ${y}6 ${end}${g}]${end} ${vr} REINICIAR PDVs${end} ${r}(Todos)${end}
${g}[ ${y}7 ${end}${g}]${end} ${vr} ATUALIZAR PDVs${end} ${r}(Todos)${end}
${g}[ ${y}8 ${end}${g}]${end} ${vr} DESLIGAR PDVs${end} ${r}(Todos)${end}
${g}[ ${y}9 ${end}${g}]${end} ${vr} ATUALIZAR IMAGEM PDVs${end} ${r}(Todos)${end}
${g}[ ${y}10${end}${g}]${end} ${vr} DELETAR ARQUIVOS DA PASTA /tmp${end}
${g}[ ${y}11${end}${g}]${end} ${vr} ACESSO SSH PDVs${end}
${g}----------------------------------------- ${end}
${g}[ ${y}12${end}${g}]${end} ${vr} GMCORE${end} ${y}(Desktop)${end}
${g}----------------------------------------- ${end}
${g}[ ${y}13${end}${g}]${end} ${vr} TESTE DE CONEXÃO${end} ${vr}(PING)${end}
${g}[ ${y}14${end}${g}]${end} ${vr} TESTE DE CONEXÃO${end} ${vr}(LINK-IP)${end}
${g}[ ${y}15${end}${g}]${end} ${vr} MONITOR DE HOSTS${end}
${g}[ ${y}16${end}${g}]${end} ${vr} LINKS ÚTEIS${end}
${g}----------------------------------------- ${end}
${g}[ ${y}17${end}${g}]${end} ${v} ACESSO ADMINISTRATIVO T.I${end}
${g}----------------------------------------- ${end}
${g}[ ${y}s ${end}${g}]${end} ${vr} SOBRE${end}
${g}[ ${y}0 ${end}${g}]${end} ${vr} SAIR${end}"
echo -e "${g}-----------------------------------------${end}"
  echo -en "  Selecione uma das opções e tecle ENTER: ➤ "
read option
case $option in
1) reiniciar_pdvs ;;
2) atualizar_pdvs ;;
3) desligar_pdvs ;;
4) atualizar_imagem ;;
5) reiniciar_maxipos ;;
6) reiniciar_todos ;;
7) atualizar_todos ;;
8) desligar_todos ;;
9) atualizar_imagem_todos ;;
10) dell_past_temp ;;
11) ssh_pdvs ;;
12) gmcore ;;
13) ping_test ;;
14) ping_test_ip_link ;;
15) monitor ;;
16) links ;;
17) adm ;;
s) sobre ;;
0) NPDVsExit ;;
*) echo -e " \"$option\" ${v} OPÇÃO INVÁLIDA ${end}"; sleep 1 ;;
esac
done
# -------------------------------------------------------
# Script End
