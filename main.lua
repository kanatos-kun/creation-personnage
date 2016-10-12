-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local suit = require 'suit'
local show_message = 0
local checkbox ={checked = true,text = "hello world!"}
local input = {text = ""}

function love.load()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
end


function updateSuit(dt)
  
  if suit.Button("Guerrier", 56, 147, 58, 56).hit then
    show_message = 1
  end
  if suit.Button("Archer", 125, 147, 58, 56).hit then
    show_message = 2
  end
  if suit.Button("Mage", 190, 147, 58, 56).hit then
    show_message = 3
  end
  if suit.Button("Prêtre", 259, 147, 58, 56).hit then
    show_message = 4
  end
  if suit.Button("Homme", 111, 43, 71, 56).hit then
    show_message = 5
  end
    if suit.Button("Femme", 202, 43, 71, 56).hit then
    show_message = 6
  end
  -- customisation 
suit.Button("Cheveux",100,299,57,60)  
suit.Button("Vetement 1",168,299,57,60)
suit.Button("Vetement 2",234,299,57,60)
suit.Button("Vetement 3",100,365,57,60)
suit.Button("Vetement 4",170,365,57,60)
suit.Button("Retour",{id= 2},234,365,57,60)

-- couleur
suit.Button("Rouge",61,496,57,60)
suit.Button("Violet",130,496,57,60)
suit.Button("Marin",195,496,57,60)
suit.Button("bleu",263,496,57,60)

suit.Button("Cyan",61,562,57,60)
suit.Button("Turquoise",130,562,57,60)
suit.Button("vert",195,562,57,60)
suit.Button("vert-jaune",263,562,57,60)

suit.Button("jaune",61,627,57,60)
suit.Button("orange",130,627,57,60)
suit.Button("marron",195,627,57,60)
suit.Button("gris",263,627,57,60)

-- bouton retour et accepter
suit.Button("Retour",{id = 1},827,640,133,34)
suit.Button("Accepter",998,640,133,34)

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

function drawBackGUI()
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

function love.draw()
   drawBackGUI()
   suit.draw()
end
  