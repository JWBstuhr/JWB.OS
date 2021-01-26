function proglist()
 print("x - Back")
 print("List of Programs:")
 print("(* Programs are Bundles, add - before the number for individual options if provided.)")
 print("1. JWBTools* - Basic Tools for Computers")
 print("2. JWBDrive Host - Makes a Computer Host for JWBDrive")
 print("3. Digital Lock - Turns a Computer into a Lock")
end
function dprog(pnum)
term.clear()
term.setCursorPos(1,1)
print("Download (1) or Reinstall (2)?")
input = read()
if input == "1" then
 reinst = "0"
elseif input == "2" then
 reinst = "1"
else
 print("Not an option!")
 sleep(2)
end
if pnum == "x" then
 sleep(0.1)
elseif pnum == "1" then
 if reinst == "1" then rprog("1") end
 print("Downloading JWBTools package...")
 shell.run("pastebin get w9rUWxzi jwbdocs")
 shell.run("pastebin get DTN5GVAm jwbnote")
 shell.run("pastebin get ZE75dMFz jwbtransfer")
 shell.run("pastebin get F6JRfcMg jwbdrive")
 print("Downloaded JWBDocs, JWBNote, JWBTransfer, and JWBDrive (Client).")
 sleep(2)
elseif pnum == "2" then
 if reinst == "1" then shell.run("rm jwbdrive-host-installer") end
 print("Downloading JWBDrive Host Installer...")
 shell.run("pastebin get zAqQxWrZ jwbdrive-host-installer")
 print("Downloaded JWBDrive Host Installer.")
 sleep(2)
elseif pnum == "3" then
 if reinst == "1" then shell.run("rm doorlock-installer") end
 print("Downloading JWB's Digital Lock Installer...")
 shell.run("pastebin get Exq8UvTW doorlock-installer")
 print("Downloaded Door Lock Installer.")
 sleep(2)
else
 print("Not a program!")
 sleep(2)
end
end
function rprog(pnum)
term.clear()
term.setCursorPos(1,1)
if pnum == "x" then
 sleep(0.1)
elseif pnum == "1" then
 print("Removing JWBTools package...")
 shell.run("rm jwbdocs")
 shell.run("rm jwbnote")
 shell.run("rm jwbtransfer")
 shell.run("rm jwbdrive")
 print("Removed JWBDocs, JWBNote, JWBTransfer, and JWBDrive (Client).")
 sleep(2)
elseif pnum == "2" then
 print("Remove the Host Program (1) or Installer (2)?")
 input = read()
 if input == "1" then
  print("Removing JWBDrive Host...")
  shell.run("rm startup.lua")
  print("Removed JWBDrive Host.")
  sleep(2)
 elseif input == "2" then
  print("Removing JWBDrive Host Installer...")
  shell.run("rm jwbdrive-host-installer")
  print("Removed JWBDrive Host Installer.")
  sleep(2)
 else
  print("Not an option!")
  sleep(2)
 end
elseif pnum == "3" then
 print("Remove the Program (1) or Installer (2)?")
 input = read()
 if input == "1" then
  print("Removing Digital Lock...")
  shell.run("rm startup.lua")
  print("Removed Digital Lock.")
  sleep(2)
 elseif input == "2" then
  print("Removing JWB's Digital Lock Installer...")
  shell.run("rm doorlock-installer")
  print("Removed JWB's Digital Lock Installer.")
  sleep(2)
 else
  print("Not an option!")
  sleep(2)
 end
else
 print("Not a program!")
 sleep(2)
end
end
 
while true do
 term.clear()
 term.setCursorPos(1,1)
 print("JWBUtility Manager")
 print("Download, remove, update, and reinstall!")
 print("")
 print("Please select an option.")
 print("1. Download/Reinstall/Update")
 print("2. Remove")
 print("3. Update JWBUtility")
 print("4. Exit")
 input = read()
 if input == "1" then
  term.clear()
  term.setCursorPos(1,1)
  print("Input the number of the program you want to download/reinstall/update.")
  proglist()
  input = read()
  dprog(input)
 elseif input == "2" then
  term.clear()
  term.setCursorPos(1,1)
  print("Input the number of the program you want to remove.")
  proglist()
  input = read()
  rprog(input)
 elseif input == "3" then
  term.clear()
  term.setCursorPos(1,1)
  print("Updating JWBUtility...")
  shell.run("rm jwbutility")
  shell.run("pastebin get uemBxNKV jwbutility")
  print("Updated. Exiting program...")
  sleep(2)
  term.clear()
  term.setCursorPos(1,1)
  break
 elseif input == "4" then
  term.clear()
  term.setCursorPos(1,1)
  break
 else
  print("Don't understand!")
  sleep(2)
 end
end
