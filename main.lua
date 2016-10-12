-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local suit = require 'suit'
local show_message = false
local checkbox ={checked = true,text = "hello world!"}

function love.load()
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
end

function love.update(dt)
  
  if suit.Button("Hello, World!", 500, 100, 300, 30).hit then
    show_message = true
  end
  
      if show_message then
        suit.Label("How are you today?", 500,150, 300,30)
    end
  
  suit.Checkbox(checkbox, 500,100,100,150)
  
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

-- Draw Text
color(3)
love.graphics.print("Classe",160,114)
love.graphics.print("Cheveux",150,253)
love.graphics.print("Couleur",157,464)
love.graphics.print("Statistique",941,255)
love.graphics.print("Force : ",863,293)
love.graphics.print("Intelligence : ",863,311)
love.graphics.print("Agilité : ",863,333)
love.graphics.print("Dexterité : ",863,354)
love.graphics.print("Endurance : ",863,375)
love.graphics.print("Points restants : ",871,409)


end

function love.draw()
   drawBackGUI()
   suit.draw()
end

function love.keypressed(key)
  
  print(key)
  
end
  