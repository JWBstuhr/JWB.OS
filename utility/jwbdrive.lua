local modem = peripheral.find("modem")
while true do
print("JWBDrive")
print("Select an option:")
print("1. Send a file to a Drive")
print("2. Download a file from a Drive")
print("3. Delete a file from a Drive.")
print("4. Exit")
input = read()
if input == "1" then
 term.clear()
 term.setCursorPos(1,1)
 print("What is the ID/channel of the Drive you want to connect to?")
 input = read()
 local sendto = input
 local sendto = tonumber(sendto)
 print("What is the filepath of the file you want to upload?")
 input = read()
 local sfilepath = input
 local sfile = io.open(sfilepath, "rb")
 local sfiledata = sfile:read"*a"
 sfile:close()
 local sfiledata = tostring(sfiledata)
 local sfilename = fs.getName(sfilepath)
 local sfilename = tostring(sfilename)
 modem.transmit(sendto,4,sfilename)
 sleep(2)
 modem.transmit(sendto,1,sfiledata)
 print("File sent. Please double check via Download to see if it is there.")
 break
elseif input == "2" then
 term.clear()
 term.setCursorPos(1,1)
 print("What is the ID/channel of the Drive you want to connect to?")
 input = read()
 local sendto = input
 local sendto = tonumber(sendto)
 print("What is the filepath of the file you want to download?")
 input = read()
 local rfilepath = input
 modem.transmit(sendto,2,rfilepath)
 local awaitfile = "true"
 modem.open(sendto)
 while awaitfile == "true" do
  local event, peripheral_name, channel, replyChannel, message, distance = os.pullEvent("modem_message")
  if replyChannel == 8 then
   rfilename = message
  elseif replyChannel == 7 then
   print(message)
   local awaitfile = "false"
   break
  elseif replyChannel == 6 then
   local received = fs.open(rfilename, "w")
   received.write(message)
   received.close()
   print("File received.")
   local awaitfile = "false"
   break
  end
 end
elseif input == "3" then
 term.clear()
 term.setCursorPos(1,1)
 print("What is the ID/channel of the Drive you want to connect to?")
 input = read()
 local sendto = input
 local sendto = tonumber(sendto)
 print("What is the filepath for the file you want to delete?")
 input = read()
 local dfilepath = input
 modem.transmit(sendto,3,dfilepath)
 print("The file should now be deleted.")
elseif input == "4" then
 break
else
 print("Not an option!")
end
end
