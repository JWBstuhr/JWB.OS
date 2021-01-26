term.clear()
term.setCursorPos(1,1)
print("When the editor opens, sending \"-fin\" will exit.")
print("File name:")
input = read()
local title = input
term.clear()
term.setCursorPos(1,1)
content = "term.clear()\nterm.setCursorPos(1,1)"
while true do
 input = read()
 if input == "-fin" then
  break
 end
 content = content .. "print(\"" .. input .. '\")' .. '\n'
end
term.clear()
term.setCursorPos(1,1)
print("Saving...")
filepath = title .. ".txt.lua"
local file = fs.open(filepath, "w")
file.write(content)
file.close()
print("Saved as "..filepath)
