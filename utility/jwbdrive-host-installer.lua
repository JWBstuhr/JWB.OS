term.clear()
term.setCursorPos(1,1)
print("Welcome to JWBDrive Serverside Installer!")
print("This will set up a JWBDrive to store files.")
print("These settings are final. You will have to reinstall if you want to change them.")
print("What channel will other computers connect with?")
input = read()
local driveid = input
local driveid = tonumber(input)
print("When setup finishes, anyone with the channel will be able to add, remove, and download files from this drive.")
print("Beginning setup.")

shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/utility/jwbdhbase.lua jwbdhbase")

local getbase = io.open("/jwbdhbase", "rb")
local base = getbase:read"*a"
getbase:close()

local config1 = "local driveid = "
local product = config1 .. driveid .. .. '\n' .. base
local createfile = fs.open("/startup.lua", "w")
createfile.write(product)
createfile.close()

print("Setup complete.")
print("This computer will reboot with JWBDrive active.")

shell.run("rm jwbdhbase")
fs.delete(shell.getRunningProgram())
os.reboot()
