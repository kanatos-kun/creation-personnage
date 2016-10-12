-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- module
local suit = require 'suit'

--table list
data = {}
pC = { "vet01",
       "vet02",
       "vet03",
       "vet04",
       "hair.cut",
       "hair.color",}
--local
local debug = true
local menu_courant = "start_menu" -- "start_menu", "create_character"
local lock = ""
-- Suit local
local show_message = 0
local checkbox ={checked = true,text = "hello world!"}
local input = {text = ""}

function love.load()
  dataReload()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
end

function dataReload()
data = {
  name = "",
  sex = "",
  class = "",
  hair = {
    cut = "",
    color = "" 
  },
  vet01 = "",
  vet02 = "",
  vet03 = "",
  vet04 = "",
  str = "",
  int = "",
  agi = "",
  endu = "",
  dex = "",
  }
end

function updateCreateCharacter(dt)
 
  if suit.Button("Guerrier", 56, 147, 58, 56).hit then
    data.class = "guerrier"
    show_message = 1
  end
  if suit.Button("Archer", 125, 147, 58, 56).hit then
    data.class = "archer"
    show_message = 2
  end
  if suit.Button("Mage", 190, 147, 58, 56).hit then
    data.class = "mage"
    show_message = 3
  end
  if suit.Button("Prêtre", 259, 147, 58, 56).hit then
    data.class = "prêtre"
    show_message = 4
  end
  if suit.Button("Homme", 111, 43, 71, 56).hit then
    data.sex = "homme"
    show_message = 5
  end
    if suit.Button("Femme", 202, 43, 71, 56).hit then
    data.sex = "femme"
    show_message = 6
  end
  -- customisation 
suit.Button("Cheveux",100,299,57,60) 

if suit.Button("Vetement 1",168,299,57,60).hit then
lock = "vet01"
end

if suit.Button("Vetement 2",234,299,57,60).hit then
lock = "vet02"
end

if suit.Button("Vetement 3",100,365,57,60).hit then
lock = "vet03"
end

if suit.Button("Vetement 4",170,365,57,60).hit then
lock = "vet04"
end

suit.Button("Retour",{id= 2},234,365,57,60)

-- couleur
if suit.Button("Rouge",{id=13},61,496,57,60).hit then
end
suit.Button("Violet",{id=14},130,496,57,60)
suit.Button("Marin",{id=15},195,496,57,60)
suit.Button("bleu",{id=16},263,496,57,60)

suit.Button("Cyan",{id=17},61,562,57,60)
suit.Button("Turquoise",{id=18},130,562,57,60)
suit.Button("vert",{id=19},195,562,57,60)
suit.Button("vert-jaune",{id=20},263,562,57,60)

suit.Button("jaune",{id=21},61,627,57,60)
suit.Button("orange",{id=22},130,627,57,60)
suit.Button("marron",{id=23},195,627,57,60)
suit.Button("gris",{id=24},263,627,57,60)

if suit.isHit(13) or suit.isHit(14) or
   suit.isHit(15) or suit.isHit(16) or
   suit.isHit(17) or suit.isHit(18) or
   suit.isHit(19) or suit.isHit(20) or
   suit.isHit(21) or suit.isHit(22) or
   suit.isHit(23) or suit.isHit(24) then
  for n = 1,#pC do 
      while pC[n] == lock do
        if suit.isHit(13) then data[lock] = "rouge" end
        if suit.isHit(14) then data[lock] = "violet" end
        if suit.isHit(15) then data[lock] = "marin" end
        if suit.isHit(16) then data[lock] = "bleu" end
        if suit.isHit(17) then data[lock] = "cyan" end
        if suit.isHit(18) then data[lock] = "turquoise" end
        if suit.isHit(19) then data[lock] = "vert" end
        if suit.isHit(20) then data[lock] = "vert-jaune" end
        if suit.isHit(21) then data[lock] = "jaune" end
        if suit.isHit(22) then data[lock] = "orange" end
        if suit.isHit(23) then data[lock] = "marron" end
        if suit.isHit(24) then data[lock] = "gris" end
        break
      end
  end

end
-- bouton retour et accepter
if suit.Button("Retour",{id = 1},827,640,133,34).hit then
menu_courant = "start_menu"
end
if suit.Button("Accepter",998,640,133,34).hit then
-- sauvegarde des données
data.name = input.text
menu_courant = "start_menu"
end
-- Bouton statistique
suit.Button("-",{id =3},1100,296,14,14)
suit.Button("+",{id =4},1119,296,14,14)
suit.Button("-",{id =5},1100,319,14,12)
suit.Button("+",{id =6},1119,319,14,14)
suit.Button("-",{id =7},1100,339,14,14)
suit.Button("+",{id =8},1119,339,14,14)
suit.Button("-",{id =9},1100,362,14,14)
suit.Button("+",{id =10},1119,362,14,14)
suit.Button("-",{id =11},1100,382,14,14)
suit.Button("+",{id =12},1119,382,14,14)

-- Choix du nom du personnage
suit.Input(input,543,638,132,36)

      if show_message == 1 then
        suit.Label("Classe guerrier choisis", 840,58, 244,26)
      elseif show_message == 2 then
        suit.Label("Classe archer choisis", 840,58, 244,26)
      elseif show_message == 3 then
        suit.Label("Classe mage choisis", 840,58, 244,26)
      elseif show_message == 4 then
        suit.Label("Classe prêtre choisis", 840,58, 244,26)
      elseif show_message == 5 then
        suit.Label("Sexe homme choisis", 840,58, 244,26)
      elseif show_message == 6 then
        suit.Label("Sexe femme choisis", 840,58, 244,26)        
    end
end

function updateStartMenu(dt)
  suit.Button("<=",872,563,69,54)
  suit.Button("Load",948,563,108,54)
  suit.Button("=>",1061,563,74,54)
  if suit.Button("New",949,633,108,54).hit then
  dataReload()
  menu_courant = "create_character"
  end
  suit.Button("",{id=1},873,166,259,48)
  suit.Button("",{id=2},873,220,259,48)
  suit.Button("",{id=3},873,275,259,48)
  suit.Button("",{id=4},873,329,259,48)
  suit.Button("",{id=5},873,384,259,48)
  suit.Button("",{id=6},873,437,259,48)
  suit.Button("",{id=7},873,492,259,48)
  end

function updateSuit(dt)
  if menu_courant == "start_menu" then
  updateStartMenu()
  elseif menu_courant == "create_character" then
  updateCreateCharacter()
  end
end

--forward keyboard events 
function love.textinput(t)
    suit.textinput(t)
end

function love.keypressed(key)
    suit.keypressed(key)
end

function love.update(dt)
  updateSuit(dt) 
end

function color(n)
   if n == 1 then
  love.graphics.setColor(150,150,150)
   elseif n == 2 then
  love.graphics.setColor(0,150,200)
  elseif n == 3 then
   love.graphics.setColor(0,0,0)
   end
end

function drawBackGuiStartMenu()
 --Draw rectangle GUI
love.graphics.setLineWidth( 5 )
color( 1 )
love.graphics.rectangle("fill",864,131,280,494,10,10)
color( 2 )
love.graphics.rectangle("line",864,131,280,494,10,10)
color( 1 )
love.graphics.rectangle("fill",872,562,71,55)
color( 2 )
love.graphics.rectangle("line",872,562,71,55)
color( 1 )
love.graphics.rectangle("fill",1061,562,71,55)
color( 2 )
love.graphics.rectangle("line",1061,562,71,55)
color( 1 )
love.graphics.rectangle("fill",947,562,110,55)
color( 2 )
love.graphics.rectangle("line",947,562,110,55)
color( 1 ) 
love.graphics.rectangle("fill",947,632,110,55)
color( 2 ) 
love.graphics.rectangle("line",947,632,110,55)
color( 1 )
love.graphics.rectangle("fill",92,304,307,211,10,10)
color( 2 )
love.graphics.rectangle("line",92,304,307,211,10,10)
love.graphics.rectangle("fill",92,324,307,6)
love.graphics.rectangle("fill",92,357,307,6)
love.graphics.rectangle("fill",92,487,307,6)
color( 3 )
love.graphics.print("Classe :",190,307)
love.graphics.print("Statistique :",203,335)
love.graphics.print("Force :",122,371)
love.graphics.print("Intelligence :",122,390)
love.graphics.print("Agilité :",122,411)
love.graphics.print("Dextérité :",122,432)
love.graphics.print("Endurance :",122,453)
love.graphics.print("Level :",218,492)
love.graphics.print("Character",979,141)
end

function drawBackGuiCharacterCreate()
-- Draw rectangle GUI 
love.graphics.setLineWidth( 5 )
color(1)
love.graphics.rectangle("fill",23,110,339,116)
color(2)
love.graphics.rectangle("line",23,110,339,116)
color(1)
love.graphics.rectangle("fill",23,241,338,460)
color(2)
love.graphics.rectangle("line",23,241,338,460)
color(1)
love.graphics.rectangle("fill",106,40,80,60)
color(2)
love.graphics.rectangle("line",106,40,80,60)
color(1)
love.graphics.rectangle("fill",198,40,80,60)
color(2)
love.graphics.rectangle("line",198,40,80,60)
color(1)
love.graphics.rectangle("fill",532,634,154,44)
color(2)
love.graphics.rectangle("line",532,634,154,44)
color(1)
love.graphics.rectangle("fill",833,250,306,196)
color(2)
love.graphics.rectangle("line",833,250,306,196)
color(1)
love.graphics.rectangle("fill",821,636,143,43)
color(2)
love.graphics.rectangle("line",821,636,143,43)
color(1)
love.graphics.rectangle("fill",992,636,143,43)
color(2)
love.graphics.rectangle("line",992,636,143,43)
love.graphics.rectangle("fill",30,133,324,5)
love.graphics.rectangle("fill",30,273,324,5)
love.graphics.rectangle("fill",30,455,324,5)
love.graphics.rectangle("fill",30,485,324,5)
love.graphics.rectangle("fill",845,284,283,4)

-- Draw Text
color(3)
love.graphics.print("Classe",160,114)
love.graphics.print("Customisation",150,253)
love.graphics.print("Couleur",157,464)
love.graphics.print("Statistique",941,255)
love.graphics.print("Force : ",863,293)
love.graphics.print("Intelligence : ",863,311)
love.graphics.print("Agilité : ",863,333)
love.graphics.print("Dexterité : ",863,354)
love.graphics.print("Endurance : ",863,375)
love.graphics.print("Points restants : ",871,409)
love.graphics.print("Retour",875,648)
love.graphics.print("Accepter",1032,648)
end

function drawDebug()
  if debug then
  color( 2 )
  love.graphics.print("Name : "         ..data.name.."\n"..
                      "Sex : "         ..data.sex.."\n"..
                      "Class : "         ..data.class.."\n"..
                      "hair-Cut :"..data.hair.cut.."\n"..
                      "hair-Color :"..data.hair.color.."\n"..
                      "vet01 :"..data.vet01.."\n"..
                      "vet02 :"..data.vet02.."\n"..
                      "vet03 :"..data.vet03.."\n"..
                      "vet04 :"..data.vet04.."\n"..
                      "str :"..data.str.."\n"..
                      "int :"..data.int.."\n"..
                      "agi :"..data.agi.."\n"..
                      "dex :"..data.dex.."\n"..
                      "endu :"..data.endu.."\n"

    ,500,0)
  end
end

function love.draw()
  if menu_courant == "start_menu" then
   drawBackGuiStartMenu()
   suit.draw()
   elseif menu_courant == "create_character" then
   drawBackGuiCharacterCreate()
   suit.draw()
 end
 drawDebug()
end
  