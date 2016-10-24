-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- module
local suit = require 'Suit'
local database = require 'database'
--table list
data = {}
pC = { "vet01",
       "vet02",
       "vet03",
       "vet04",
       "hair.cut",
       "hair.color",}
--local
local imgDrawBackGUIChara = love.graphics.newImage("images/backGUI_character.png")
local imgButton = {
  sex_women = {
              (love.graphics.newImage("images/bouton_fem.png")),
              (love.graphics.newImage("images/bouton_hover_fem.png"))
              },
  sex_men   = {
              (love.graphics.newImage("images/bouton_male.png")),
              (love.graphics.newImage("images/bouton_hover_male.png"))
              },
  knight    = {
              (love.graphics.newImage("images/bouton_knight.png")),
              (love.graphics.newImage("images/bouton_hover_knight.png")),
              },
  archer    = {
              (love.graphics.newImage("images/bouton_archer.png")),
              (love.graphics.newImage("images/bouton_hover_archer.png")),
              },
  mage      = {
               (love.graphics.newImage("images/bouton_mage.png")),
               (love.graphics.newImage("images/bouton_hover_mage.png")),
               },
  pretre    = {
               (love.graphics.newImage("images/bouton_pretre.png")),
               (love.graphics.newImage("images/bouton_hover_pretre.png")),
              }
}

local debug = true
local menu_courant = "start_menu" -- "start_menu", "create_character"
lock = ""
local quit = true
-- Suit local
local show_message = 0
local checkbox ={checked = true,text = "hello world!"}
local input = {text = ""}

function love.load()
  database.load()
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
   color ( 4 )
  if suit.ImageButton(imgButton.knight[1],{hovered = imgButton.knight[2]}, 59, 150).hit then
    data.class = "chevalier"
    show_message = 1
  end
  if suit.ImageButton(imgButton.archer[1],{hovered = imgButton.archer[2]}, 128, 150).hit then
    data.class = "archer"
    show_message = 2
  end
  if suit.ImageButton(imgButton.mage[1],{hovered = imgButton.mage[2]}, 198, 150).hit then
    data.class = "mage"
    show_message = 3
  end
  if suit.ImageButton(imgButton.pretre[1],{hovered = imgButton.pretre[2]}, 268, 150).hit then
    data.class = "pretre"
    show_message = 4
  end
  if suit.ImageButton(imgButton.sex_men[1],{hovered =imgButton.sex_men[2]}, 104, 36).hit then
    data.sex = "homme"
    show_message = 5
  end
    if suit.ImageButton(imgButton.sex_women[1],{hovered =imgButton.sex_women[2]}, 197, 36).hit then
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
        if suit.isHit(20) then data[lock] = "vert-limon" end
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
dataReload()
menu_courant = "start_menu"
end
if suit.Button("Accepter",998,640,133,34).hit then
-- sauvegarde des données
data.name = input.text
dataReload()
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

function love.quit()
love.event.quit()
    if quit then
        print("We are not ready to quit yet!")
        quit = not quit
    else
        print("Thanks for playing. Please play again soon!")
        return quit
    end
    return true
end

function updateStartMenu(dt)
  suit.Button("<=",872,563,69,54)
  suit.Button("Load",948,563,108,54)
  suit.Button("=>",1061,563,74,54)
  if suit.Button("New",1032,633,108,54).hit then
  dataReload()
  menu_courant = "create_character"
end
if suit.Button("quit",867,633,108,54).hit then
love.quit()
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
 elseif n == 4 then
   love.graphics.setColor(255,255,255)
 elseif n == "rouge" then
   --rouge
   love.graphics.setColor(237,22,11)
 elseif n == "violet" then
   --violet
   love.graphics.setColor(189,22,201)
 elseif n == "marin" then 
   --marin
   love.graphics.setColor(19,62,87)
 elseif n == "bleu" then 
   --bleu
   love.graphics.setColor(31,21,232)
 elseif n == "cyan" then 
   --cyan
   love.graphics.setColor(33,197,227)
 elseif n == "turquoise" then 
   --turquoise
   love.graphics.setColor(33,227,167)
 elseif n == "vert" then 
   --vert
   love.graphics.setColor(23,207,62)
 elseif n == "vert-limon" then 
   --vert-limon
   love.graphics.setColor(181,218,24)
 elseif n == "jaune" then 
   --jaune
   love.graphics.setColor(235,218,24)
 elseif n == "orange" then 
   --orange
   love.graphics.setColor(221,125,23)
 elseif n == "marron" then 
   --marron
   love.graphics.setColor(106,66,31)
 elseif n == "gris" then 
   --gris
   love.graphics.setColor(126,126,126)
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
--quit
color( 1 ) 
love.graphics.rectangle("fill",867,633,108,57)
color( 2 ) 
love.graphics.rectangle("line",867,633,108,57)
--new
color( 1 ) 
love.graphics.rectangle("fill",1032,633,108,57)
color( 2 ) 
love.graphics.rectangle("line",1032,633,108,57)
--statistique
color( 1 )
love.graphics.rectangle("fill",92,304,307,211,10,10)
color( 2 )
love.graphics.rectangle("line",92,304,307,211,10,10)
----
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
-- Draw GUI 
color ( 4 )
love.graphics.draw(imgDrawBackGUIChara,0,0)
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
database.draw()
 drawDebug()
end
  
