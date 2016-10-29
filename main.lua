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
              },
  body      = {
               (love.graphics.newImage("images/bouton_body.png")),
               (love.graphics.newImage("images/bouton_body_hover.png")),
              },
  hair      = {
               (love.graphics.newImage("images/bouton_hair.png")),
               (love.graphics.newImage("images/bouton_hair_hover.png")),
              },
  eye       = {
               (love.graphics.newImage("images/bouton_eye.png")),
               (love.graphics.newImage("images/bouton_eye_hover.png")),
              },
  vetement  = {
               (love.graphics.newImage("images/bouton_vetement.png")),
               (love.graphics.newImage("images/bouton_vetement_hover.png")),
              },
  retour    = {
               (love.graphics.newImage("images/bouton_retour.png")),
               (love.graphics.newImage("images/bouton_retour_hover.png")),
              },
  head      = {
               (love.graphics.newImage("images/bouton_head.png")),
               (love.graphics.newImage("images/bouton_head_hover.png")),
              },
  color      = {}              
}

local button_state = "" --"face", "outfit","nose","mouth","hairCut","eye"
local debug = false
menu_courant = "start_menu" -- "start_menu", "create_character" , "load"
lock = ""
local quit = true
-- Suit local
local show_message = 0
local checkbox ={checked = true,text = "hello world!"}
local input = {text = ""}

function love.load()
  database.load()
  dataReload()
  local nColor
  for nColor= 1,9 do
    table.insert(imgButton.color,love.graphics.newImage("images/bouton_circle0"..nColor..".png"))
    table.insert(imgButton.color,love.graphics.newImage("images/bouton_circle0"..nColor.."_hover.png"))
  end
  for nColor= 10,20 do
    table.insert(imgButton.color,love.graphics.newImage("images/bouton_circle"..nColor..".png"))
    table.insert(imgButton.color,love.graphics.newImage("images/bouton_circle"..nColor.."_hover.png"))
  end

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
  eye   = "",
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
  end
  if suit.ImageButton(imgButton.archer[1],{hovered = imgButton.archer[2]}, 128, 150).hit then
    data.class = "archer"
  end
  if suit.ImageButton(imgButton.mage[1],{hovered = imgButton.mage[2]}, 198, 150).hit then
    data.class = "mage"
  end
  if suit.ImageButton(imgButton.pretre[1],{hovered = imgButton.pretre[2]}, 268, 150).hit then
    data.class = "pretre"
  end
  if suit.ImageButton(imgButton.sex_men[1],{hovered =imgButton.sex_men[2]}, 104, 36).hit then
    data.sex = "homme"
  end
    if suit.ImageButton(imgButton.sex_women[1],{hovered =imgButton.sex_women[2]}, 197, 36).hit then
    data.sex = "femme"
  end
  -- customisation


if button_state == "" then
-- Si on retourne au début--------------------------
suit.ImageButton(imgButton.body[1],{hovered = imgButton.body[2]},100,299) 

  if suit.ImageButton(imgButton.head[1],{hovered = imgButton.head[2]},168,299).hit then
  button_state ="face"
  end

  if suit.ImageButton(imgButton.vetement[1],{hovered = imgButton.vetement[2]},234,299).hit then
    button_state ="outfit"
  end
  
-----------------------------------------------------
  
-- Si on clique sur le bouton vetement---------------
elseif button_state == "outfit" then
  if suit.ImageButton(imgButton.retour[1],{hovered = imgButton.retour[2]},234,367).hit then
  button_state = ""
  lock = ""
end

    if suit.ImageButton(imgButton.vetement[1],{hovered = imgButton.vetement[2],id=200},100,299).hit then
  lock = "vet01"
  end

    if suit.ImageButton(imgButton.vetement[1],{hovered = imgButton.vetement[2],id=201},234,299).hit then
  lock = "vet02"
end

    if suit.ImageButton(imgButton.vetement[1],{hovered = imgButton.vetement[2],id=202},168,299).hit then
  lock = "vet03"
  end
-----------------------------------------------------


----placer d'autre état de button ici ---------------

-----------------------------------------------------

-- Si on clique sur le bouton body-------------------
elseif button_state == "body" then


-----------------------------------------------------

-- Si on clique sur le bouton eye-------------------
elseif button_state == "eye" then

-----------------------------------------------------

-- Si on clique sur le bouton hair-------------------
elseif button_state == "hair" then
  if suit.ImageButton(imgButton.hair[1],{hovered = imgButton.hair[2],id=203},100,299).hit then
  lock = "hair"
  end

  if suit.ImageButton(imgButton.hair[1],{hovered = imgButton.hair[2],id=204},168,299).hit then
  lock = "hair"
  end

  if suit.ImageButton(imgButton.hair[1],{hovered = imgButton.hair[2],id=205},234,299).hit then
  lock = "hair"
  end

  if suit.ImageButton(imgButton.retour[1],{hovered = imgButton.retour[2]},234,367).hit then
  button_state = "face"
  lock = ""
  end
-----------------------------------------------------
-- Si on clique sur le bouton face-------------------
elseif button_state == "face" then

  if suit.ImageButton(imgButton.hair[1],{hovered = imgButton.hair[2]},100,299).hit then
    button_state = "hair"
  end

  if suit.ImageButton(imgButton.eye[1],{hovered = imgButton.eye[2]},168,299).hit then
  lock = "eye"
  end

  if suit.ImageButton(imgButton.retour[1],{hovered = imgButton.retour[2]},234,367).hit then
  button_state = ""
  end
end
-----------------------------------------------------



-- couleur
if button_state == "" then
else
suit.ImageButton(imgButton.color[1],{hovered=imgButton.color[2], id=13},54,510) --rouge
suit.ImageButton(imgButton.color[3],{hovered=imgButton.color[4],id=14},110,510) --violet
suit.ImageButton(imgButton.color[5],{hovered=imgButton.color[6],id=15},166,510) -- marin
suit.ImageButton(imgButton.color[7],{hovered=imgButton.color[8],id=16},222,510) -- bleu
suit.ImageButton(imgButton.color[9],{hovered=imgButton.color[10],id=17},278,510) -- bleu

suit.ImageButton(imgButton.color[11],{hovered=imgButton.color[12],id=18},54,563) -- cyan
suit.ImageButton(imgButton.color[13],{hovered=imgButton.color[14],id=19},110,563) -- turquoise
suit.ImageButton(imgButton.color[15],{hovered=imgButton.color[16],id=20},166,563) -- vert
suit.ImageButton(imgButton.color[17],{hovered=imgButton.color[18],id=21},222,563) -- vert-jaune
suit.ImageButton(imgButton.color[19],{hovered=imgButton.color[20],id=22},278,563) -- bleu

suit.ImageButton(imgButton.color[21],{hovered=imgButton.color[22],id=23},54,616) -- jaune
suit.ImageButton(imgButton.color[23],{hovered=imgButton.color[24],id=24},110,616) -- orange
suit.ImageButton(imgButton.color[25],{hovered=imgButton.color[26],id=25},166,616) -- marron
suit.ImageButton(imgButton.color[27],{hovered=imgButton.color[28],id=26},222,616) -- gris
suit.ImageButton(imgButton.color[29],{hovered=imgButton.color[30],id=27},278,616) -- bleu

end
if suit.isHit(13) or suit.isHit(14) or
   suit.isHit(15) or suit.isHit(16) or
   suit.isHit(17) or suit.isHit(18) or
   suit.isHit(19) or suit.isHit(20) or
   suit.isHit(21) or suit.isHit(22) or
   suit.isHit(23) or suit.isHit(24) then
  for n = 1,#pC do 
      while pC[n] == lock do
        if suit.isHit(13) then data[lock] = 13 end --rouge
        if suit.isHit(14) then data[lock] = 14 end --violet
        if suit.isHit(15) then data[lock] = 15 end --marin
        if suit.isHit(16) then data[lock] = 16 end --bleu
        if suit.isHit(17) then data[lock] = 17 end -- cyan
        if suit.isHit(18) then data[lock] = 18 end --turquoise
        if suit.isHit(19) then data[lock] = 19 end --vert
        if suit.isHit(20) then data[lock] = 20 end -- vert-limon
        if suit.isHit(21) then data[lock] = 21 end -- jaune
        if suit.isHit(22) then data[lock] = 22 end --orange
        if suit.isHit(23) then data[lock] = 23 end --marron
        if suit.isHit(24) then data[lock] = 24 end --gris
        break
      end
  end

end
-- bouton retour et accepter
if suit.Button("Retour",{id = 1},827,640,133,34).hit then
dataReload()
button_state = ""
menu_courant = "start_menu"
end
if suit.Button("Accepter",998,640,133,34).hit then
-- sauvegarde des données
data.name = input.text
dataReload()
button_state = ""
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
  menu_courant = "load"
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
  elseif menu_courant == "load" then
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
  database.update(dt)
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
 elseif n == 13 then
   --rouge
   love.graphics.setColor(237,22,11)
 elseif n == 14 then
   --violet
   love.graphics.setColor(189,22,201)
 elseif n == 15 then 
   --marin
   love.graphics.setColor(19,62,87)
 elseif n == 16 then 
   --bleu
   love.graphics.setColor(31,21,232)
 elseif n == 17 then 
   --cyan
   love.graphics.setColor(33,197,227)
 elseif n == 18 then 
   --turquoise
   love.graphics.setColor(33,227,167)
 elseif n == 19 then 
   --vert
   love.graphics.setColor(23,207,62)
 elseif n == 20 then 
   --vert-limon
   love.graphics.setColor(181,218,24)
 elseif n == 21 then 
   --jaune
   love.graphics.setColor(235,218,24)
 elseif n == 22 then 
   --orange
   love.graphics.setColor(221,125,23)
 elseif n == 23 then 
   --marron
   love.graphics.setColor(106,66,31)
 elseif n == 24 then 
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
  
