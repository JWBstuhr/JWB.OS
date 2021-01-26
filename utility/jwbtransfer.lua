term.clear()
term.setCursorPos(1,1)
print("Select Option:")
print("1. Send File")
print("2. Receive File")
input = read()
if input == "1" then
 term.clear()
 term.setCursorPos(1,1)
 print("Make sure recieving end is set up first.")
 print("What channel should the program be sent on?")
 print("(Select any Number)")
 input = read()
 local sendon = input
 term.clear()
 term.setCursorPos(1,1)
 print("What file is to be sent?")
 print("(Put the file directory)")
 input = read()
 local filepath = input
 local file = io.open(filepath, "rb")
 local filedata = file:read"*a"
 file:close()
 local modem = peripheral.find("modem")
 local nsendon = tonumber(sendon)
 local filesend = tostring(filedata)
 modem.transmit(nsendon,0,filesend)
 print("File sent. Check receiving computer.")
elseif input == "2" then
 term.clear()
 term.setCursorPos(1,1)
 print("What channel will the file be sent on?")
 print("(This should be told to you by the sender!")
 input = read()
 local receiveon = input
 term.clear()
 term.setCursorPos(1,1)
 print("What name will the file be saved as?")
 input = read()
 local filename = input
 local modem = peripheral.find("modem")
 local nreceiveon = tonumber(receiveon)
 modem.open(nreceiveon)
 while true do
  local event, peripheral_name, channel, replyChannel, message, distance = os.pullEvent("modem_message")
  local received = fs.open(filename, "w")
  received.write(message)
  received.close()
  break
 end
 print("File transfer complete. Saved as "..filename)
else
 print("Error: Not an option.")
end
