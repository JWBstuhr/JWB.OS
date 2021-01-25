os.pullEvent = os.pullEventRaw
 
local w,h = term.getSize()
 
function printCentered(y,s)
 local x = math.floor((w - string.len(s)) /2)
 term.setCursorPos(x,y)
 term.clearLine()
 term.write(s)
end
 
local nOption = 1
 
local function drawMenu()
 term.clear()
 term.setCursorPos(1,1)
 term.write("JWB.OS")
 term.setCursorPos(w-11,1)
 if nOption == 1 then
  term.write("Chat Host")
 elseif nOption == 2 then
  term.write("Chat Join")
 elseif nOption == 3 then
  term.write("Worm")
 elseif nOption == 4 then
  term.write("Falling")
 elseif nOption == 5 then
  term.write("Adventure")
 elseif nOption == 6 then
  term.write("Back")
 else
 end
end
 
term.clear()
local function drawFrontend()
 printCentered(math.floor(h/2) - 3, "")
 printCentered(math.floor(h/2) - 2, "Easy Program Menu")
 printCentered(math.floor(h/2) - 1, "")
 printCentered(math.floor(h/2) + 0, ((nOption == 1) and "[ Chat Host ]") or "Chat Host")
 printCentered(math.floor(h/2) + 1, ((nOption == 2) and "[ Chat Join ]") or "Chat Join")
 printCentered(math.floor(h/2) + 2, ((nOption == 3) and "[ Worm      ]") or "Worm     ")
 printCentered(math.floor(h/2) + 3, ((nOption == 4) and "[ Falling   ]") or "Falling  ")
 printCentered(math.floor(h/2) + 4, ((nOption == 5) and "[ Adventure ]") or "Adventure")
 printCentered(math.floor(h/2) + 5, ((nOption == 6) and "[ Back      ]") or "Back     ")
end
 
drawMenu()
drawFrontend()
 
while true do
 local e,p = os.pullEvent("key")
  if e == "key" then
   local key = p
   if key == keys.w or key == keys.up then
    if nOption > 1 then
     nOption = nOption - 1
     drawMenu()
     drawFrontend()
    end
   elseif key == keys.s or key == keys.down then
    if nOption < 6 then
     nOption = nOption + 1
     drawMenu()
     drawFrontend()
    end
   elseif key == keys.enter then
    break
   end
  end
 end
term.clear()
 
if nOption == 1 then
 shell.run("os/.chath")
elseif nOption == 2 then
 shell.run("os/.chatj")
elseif nOption == 3 then
 shell.run("fg worm")
 shell.run(".back")
elseif nOption == 4 then
 if fs.exists("falling") == false then
  shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/falling.lua falling")
 end
 shell.run("fg falling")
 shell.run(".back")
elseif nOption == 5 then
 shell.run("fg adventure")
 shell.run(".back")
else
 shell.run(".back")
end
