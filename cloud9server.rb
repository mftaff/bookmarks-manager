# This file will launch the cloud9 local host
# Type: rails s -p $PORT -b $IP into the console to manually start the server 
# run this file with: ruby <filename>
exec(%Q{ rails s -p $PORT -b $IP })
