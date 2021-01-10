echo -en "figlet name \e[92m?\e[0m "
read fn
echo -en "author name \e[92m?\e[0m "
read an
echo -en "enter name \e[92m?\e[0m "
read name

echo "
apt install figlet tmate -y
figlet $fn
echo 'by $an'
tmate -F | grep 'web session:'
" > ../$name
