--[ Run 'wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/JWB.OS-WGet-Installer.lua jwbos-installer.lua' to get Installer ]--

print("Installing...")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/startup.lua startup.lua")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/.back.lua .back")
shell.run("mkdir os")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/os/.files.lua os/.files")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/os/.cmd.lua os/.cmd")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/os/.programs.lua os/.programs")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/os/.chath.lua os/.chath")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/os/.chatj.lua os/.chatj")
shell.run("wget https://raw.githubusercontent.com/JWBstuhr/JWB.OS/main/os/.uninstall.lua os/.uninstall")
print("Done. Rebooting...")
sleep(2)
