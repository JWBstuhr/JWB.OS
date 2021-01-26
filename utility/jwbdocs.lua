term.clear()
term.setCursorPos(1, 1)
print("Which printer? (top, bottom, left, right, front, back, or printer_0 (replace 0 with the printer number on your network. ))")
input = read()
printer = peripheral.wrap(input)
local ink = printer.getInkLevel()
local paper = printer.getPaperLevel()
local ink = tonumber(ink)
local paper = tonumber(paper)
 
term.clear()
term.setCursorPos(1, 1)
print("Page Title:")
input = read()
local title = input
printer.newPage()
if ink == 0 then
 textutils.slowPrint("No Ink", 15)
 sleep(5)
 os.reboot()
end
if paper == 0 then
 textutils.slowPrint("No Paper", 15)
 sleep(5)
 os.reboot()
end
 
textutils.slowPrint("Use text \"-br\" to add a breakline. Use text \"-fin\" to print the page. 25 characters a line, make a    breakline after. The editor will open shortly.", 15)
sleep(5)
 
output = ""
term.setCursorPos(1, 1)
while true do
 if input == "-fin" then
  break 
 end
 term.clear()
 term.setCursorPos(1, 1)
 print("Page Text:")
 print("(Character Ruler)")
 print("1-3-5-7-9-A-B-C-D-E-N-E-F")
 print(output)
 input = read()
 if input == "-br" then
  output = output .. '\n'
  _,y = printer.getCursorPos()
  printer.setCursorPos(1,y+1) 
 end
 if input == "-br" then
 output = output .. '\n'
 end
 if input ~= "-br" and input ~= "-fin" then
  printer.write(input)
  output = output .. input
 end
end
 
printer.setPageTitle(title)
printer.endPage()
if ink == 1 then
 textutils.slowPrint("Ink Levels Low", 15)
end
if paper == 1 then
 textutils.slowPrint("Paper Levels Low", 15)
end
textutils.slowPrint("Printing...", 15)
print()