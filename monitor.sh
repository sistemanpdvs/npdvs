#!/bin/bash
validateIPVFOUR(){
  local  ip=$1;
  local  stat=1;
  if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    OIFS=$IFS;
    IFS='.';
    ip=($ip);
    IFS=$OIFS;
    if [[ ${ip[0]} -le 255 ]]  && [[ ${ip[1]} -le 255 ]] && [[ ${ip[2]} -le 255 ]] && [[ ${ip[3]} -le 255 ]]; then
      return 0;
    fi
  fi
  return 1;
}

listIPs(){
  clear
  printf "Lista de endereços IP\n";
  for ip in $data; do
    printf "$ip\n";
  done
  printf "\n";
}

addHosts(){
  listIPs
  printf "Insira os endereços IP individualmente, e logo após digite [e], para continuar.\n";
  while true; do
    read input;
    if [ "$input" == "e" ]; then
      break;
    fi
    if validateIPVFOUR $input ; then
      printf "IP adicionado com sucesso.$input\n";
      sh -c "echo '$input ' >> '$PWD/$filename'"; 
    else
      printf "IP inválido $input, Por favor, tente novamente.\n";
    fi
  done
  data=$(cat $PWD/$filename);
}

removeHosts(){
  listIPs
  printf "Insira os endereços IP a serem deletados, e logo após digite [d], para confirmar.\n";
  while true; do
    read input;
    if [ "$input" == "d" ]; then
      break;
    fi
    sed -i "/$input /d" $PWD/$filename  
  done
  data=$(cat $PWD/$filename);
}

pingHosts(){
  for ip in $data; do
    result="$(ping -q -n -s 2 -W 2 -c 4 $ip)";
    result="${result##*-}";
    for part in $result; do
      if [[ "$part" == *"%"* ]]; then
        result=${part:0:(${#part}-1)};
        if [ "$result" -gt 25 ] && [ "$result" -lt 100 ]; then
          result="??";
        elif [ "$result" -eq 100 ]; then
          result="DOWN";
        else
          result="UP";  
        fi
        break;
      fi
    done
    statusarray[statuscounter]="$result";
    statuscounter=$((statuscounter+1));
  done
}

#Initializing global variables

configfilename="hoststatus.conf";
configdata="";
sendLogs="0";
filename="hostIPs";
data="";

#Load config file

if [ -f $PWD/$configfilename ]; then
  printf "O arquivo de configuração existe\n Importando dados do arquivo.\n";
  configdata=$(cat $PWD/$configfilename);
  printf "Feito\n";
else
  printf "O arquivo de configuração não existe. \nCriando o arquivo ...\n";
  touch $PWD/$configfilename
  printf "Concluído. \n Anexando as configurações padrão.\n";
  sh -c "echo 'hostIPs_FileName=hostIPs ' >> '$PWD/$configfilename'";
  sh -c "echo 'writeLogsToSyslog=false ' >> '$PWD/$configfilename'";
  configdata=$(cat $PWD/$configfilename);
  printf "Done\n";
fi

#Load config settings

for config in $configdata; do
  pre=${config%=*};
  val=${config#*=};
  case $pre in
    hostIPs_FileName)
      filename="$val";
      ;;
    writeLogsToSyslog)
      if [ "$val" == "true" ] || [ "$val" == "1" ]; then
        sendLogs="1";
      fi
      ;;
    *)
      printf "Configuração inválida: $pre\n";
      ;;
  esac
done
printf "\n";  

#Load host ips

if [ -f $PWD/$filename ]; then
  printf "$filename O Arquivo já existe. \n Importando dados de $filename...\n";
  data=$(cat $PWD/$filename);

  #Check if the user wants to add more host ips 

  printf "Concluído.\n\nVocê deseja adicionar mais ips de arquivo host? [y/n]\n";
  read -t 10 input;
  if [ "$input" == "y" ]; then
    addHosts
  fi
else
  printf "$filename O Arquivo não existe. \nCriando. $filename...\n";
  touch $PWD/$filename
  printf "Feito\n";
  addHosts
fi

#Check if user wants to remove host ips

printf "\nVocê quer remover os um ou mais ips do arquivo host? [y/n]\n";
read -t 10 input;
if [ "$input" == "y" ]; then
  removeHosts
fi
clear

#Validating host ips

printf "Validando todos os ips contidos no arquivo\n\n";
for ip in $data; do
  if ! validateIPVFOUR $ip ; then
    printf "IP INVÁLIDO!!! = $ip\n\nSaindo!\n";
    exit;
  fi
  printf "$ip\n";
done
printf "\nValidando IPs...\n\nColetando dados iniciais...\nPor favor aguarde...";

#Start pinging hosts and output results to console

while true; do
  statusarray=();
  statuscounter=0;
  pingHosts 
  statuscounter=0;
  clear;
  printf "\e[32;1m   _   _ ____  ______     __    \e[0m\n";
  printf "\e[32;1m  | \ | |  _ \|  _ \ \   / /__  \e[0m\n";
  printf "\e[32;1m  |  \| | |_) | | | \ \ / / __| \e[0m\n";
  printf "\e[32;1m  | |\  |  __/| |_| |\ V /\__ \ \e[0m\n";
  printf "\e[32;1m  |_| \_|_|   |____/  \_/ |___/ \e[0m\n";
  printf "\e[32;1m             © 2020  \e[0m\n";
  printf "         By \e[32;1mNilsonlinux.    \e[0m\n\n";
  printf " -------------------------------------  \e[0m\n";
  printf " HOST            STATUS\n\n";
  for ip in $data; do
    printf " ";
    printf "%-5s" "$ip";
    printf "     ";
    if [ "$sendLogs" == "1" ]; then
      logger [HOSTSTATUS]: $ip is ${statusarray[$statuscounter]}    
    fi
    case ${statusarray[$statuscounter]} in
      UP)
        printf "\e[32;1mUP\e[0m\n";
        ;;
      DOWN)
        printf "\e[31;1mDOWN\e[0m\n";
        ;;
      ??)
        printf "\e[33;1m??\e[0m\n";
        ;;
    esac
    statuscounter=$((statuscounter+1));
  done
  date="$(date +'%H:%M:%S %D')";  
  printf "\n Ultima atualização: $date\n\n"
    printf " -------------------------------------  \e[0m\n";
  printf "\n Digite ´e´ para sair e aguarde o fechamento do script... ";

  read -t 2 input;
  if [ "$input" == "e" ]; then
    break;
  fi    
  sleep 1;
done

printf "\n Feito!\n\n "
