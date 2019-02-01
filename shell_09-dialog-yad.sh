#!/bin/bash

# Aplicações gráficas interativas no terminal e gui fora do terminal com shell script

# Dialog - xdialog, kdialog, gdialog, whiptail, PythonDialog, udpm, ...
# Yad - (evolução do zenity)

# ALTURA=5 LARGURA=50
# dialog --msgbox "Meu primeiro script com Dialog e Shell Script" $ALTURA $LARGURA

while true; do
  distros=$(dialog --stdout --title "Escolha sua Distro" --menu "Qual a sua distro preferida?" 0 0 0 \
    1 "Debian"\
    2 "Red Hat"\
    3 "Gentoo"\
    4 "Slackware"\
    5 "Ubuntu"\
    0 "Sair")

  [ $? -ne 0 ] && echo "Cancelou ou apertou Enter." && break

  case $distros in
    1) dialog --msgbox "Essa é a melhor distro! :)" 5 30 ;;
    2) dialog --title "Red Hat" --infobox "\nEla agora é ENTERPRISE! :|" 6 30 && sleep 1 ;;
    3) dialog --title "Gentoo" --msgbox "\nVocê é psicopata" 6 25 ;;
    4) dialog --yesno "\nVocê sabe do que ta falando?" 6 40;
      if [ $? = 0 ]; then
        dialog --title "Slackware" --infobox "Que bom" 0 0 && sleep 1
      else
        dialog --title "Slackware" --infobox "Sabia que não" 0 0 && sleep 1
      fi
      ;;
    5) dialog --title "Ubuntu" --timebox "Linux nutela. Vou anotar a hora que você disse isso" 0 0 ;;
    0) echo "Você escolheu sair"; break ;;
  esac
done


# Dica: Você pode decidir usar o dialog ou outro comando com interface gráfica dependendo se o script está rodando em modo terminal ou não
# Basta verificar a existencia da variavel $DISPLAY que só é definida quando o X (Xorg) está sendo executado


# Exemplo yad

Saida=$(yad --form --image image.png --image-on-top\
  --title 'Yad com Shell Script'\
  --text 'Exemplo <b>YAD</b> por <big><b>Yuri</b></big>'\
  --field Nome 'Yuri'\
  --field Nascimento:DT 27/07/1993\
  --field 'Há quanto tempo você usa <b>linux?</b>:NUM' '1!0..20!1'\
  --field 'Sites preferido:CB' 'youtube!udemy!google!outros'\
  --field 'Vou passar a usar o YAD:CHK' TRUE\
  --field 'Vou continuar usando o YAD:CHK')

echo $Saida
echo $Saida | tr '|' ',' >> saida.csv
