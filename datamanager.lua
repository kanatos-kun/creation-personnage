-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")
data = {str = 10, int = 5, agility = 40, vie = 105,name = "kanatos"}
local suit = require 'suit'
-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end


file = love.filesystem.newFile(data.name..".txt")
file:open("r")
dataRead = file:read()
file:close()
-- use the data ...
file:open("w")
file:write(
              data.name.."\n"..
  "  str : "..data.str.."\n"..
  "  int : "..data.int.."\n"..
  "  agi : "..data.agility.."\n"..
  "  vie : "..data.vie.."\n"
  )
file:close()

-- data load
dataLoad = {}
for line in love.filesystem.lines(data.name..".txt") do
table.insert(dataLoad, line)
end


isFile = love.filesystem.isFile(dataLoad[1]..".txt")

keyIsDown = false
    if isFile and not keyIsDown then
  print("un fichier portant ce nom existe déjà".."\n"..
        "Voulez vous écraser le fichier existant?".."\n"..
        " Taper 'o' pour OUI, taper 'n' pour NON")
    end

function love.keypressed (key)
  if key == "d" then
    print( keyIsDown )
  elseif key == "o" and not keyIsDown then
    print("le fichier a été écrasé avec succées")
    love.filesystem.newFileData(dataLoad[1]..".txt")
    file = love.filesystem.newFile(dataLoad[1]..".txt")
    overWrite()
    keyIsDown = true
  elseif key == "n" and not keyIsDown then
    print("le fichier n'a pas été écrasé")
    keyIsDown = true  
  end
end


function overWrite()
data = newData
newData = {str = 44, int = 44, agility = 44, vie = 999,name = "kanatos"}
file:open("r")
data = file:read()
file:close()
file:open("w")
file:write(
              tostring(newData.name).."\n"..
  "  str : "..tostring(newData.str).."\n"..
  "  int : "..tostring(newData.int).."\n"..
  "  agi : "..tostring(newData.agility).."\n"..
  "  vie : "..tostring(newData.vie).."\n"
  )
file:close()

dataLoad = {}
for line in love.filesystem.lines("kanatos"..".txt") do
table.insert(dataLoad, line)
end

end

function love.load()
  
end

function love.update(dt)

end

function love.draw()
  love.graphics.print(dataLoad[1].."\n"..
                      dataLoad[2].."\n"..
                      dataLoad[3].."\n"..
                      dataLoad[4].."\n"..
                      dataLoad[5].."\n",100,100)
end
