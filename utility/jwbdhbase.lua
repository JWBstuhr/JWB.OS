local modem = peripheral.find("modem")
driveid = tonumber(driveid)
modem.open(driveid)

while true do
 local event, peripheral_name, channel, replyChannel, message, distance = os.pullEvent("modem_message")
 if replyChannel == 1 then
  local rfiledata = fs.open(rfilename, "w")
  rfiledata.write(message)
  rfiledata.close()
 elseif replyChannel == 2 then
  local sfilepath = message
  if fs.exists(sfilepath) == true then
   sleep(1)
   local sfilename = fs.getName(sfilepath)
   modem.transmit(driveid,8,sfilename)
   sleep(2)
   local sfile = io.open(sfilepath, "rb")
   local sfiledata = sfile:read"*a"
   sfile:close()
   local sfiledata = tostring(sfiledata)
   modem.transmit(driveid,6,sfiledata)
  else
   modem.transmit(driveid,7,"Error: File does not exist.")
  end
 elseif replyChannel == 3 then
  local dfilepath = message
  shell.run("rm "..dfilepath)
 elseif replyChannel == 4 then
  rfilename = message
 end
end
