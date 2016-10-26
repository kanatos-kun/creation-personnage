database = {}

database.load = function()
imgDatabase = {
guerrierM = {love.graphics.newImage("images/guerrier.png"),
             love.graphics.newImage("images/guerrier_stuff01.png"),
             love.graphics.newImage("images/guerrier_stuff02.png"),
             love.graphics.newImage("images/guerrier_stuff03.png"),
             love.graphics.newImage("images/guerrier_stuff04.png"),
             love.graphics.newImage("images/guerrier_stuff05.png"),
             love.graphics.newImage("images/guerrier_stuff06.png"),
             love.graphics.newImage("images/guerrier_stuff07.png"),
             love.graphics.newImage("images/guerrier_stuff08.png"),
             love.graphics.newImage("images/guerrier_stuff09.png"),
             love.graphics.newImage("images/guerrier_stuff10.png"),
             love.graphics.newImage("images/guerrier_stuff11.png"),
             love.graphics.newImage("images/guerrier_stuff12.png"),
             love.graphics.newImage("images/guerrier_stuff13.png")},
guerrierF = {love.graphics.newImage("images/guerriere.png"),
             love.graphics.newImage("images/guerriere_stuff01.png"),
             love.graphics.newImage("images/guerriere_stuff02.png"),
             love.graphics.newImage("images/guerriere_stuff03.png"),
             love.graphics.newImage("images/guerriere_stuff04.png"),
             love.graphics.newImage("images/guerriere_stuff05.png"),
             love.graphics.newImage("images/guerriere_stuff06.png"),
             love.graphics.newImage("images/guerriere_stuff07.png"),
             love.graphics.newImage("images/guerriere_stuff08.png"),
             love.graphics.newImage("images/guerriere_stuff09.png"),
             love.graphics.newImage("images/guerriere_stuff10.png"),
             love.graphics.newImage("images/guerriere_stuff11.png"),
             love.graphics.newImage("images/guerriere_stuff12.png"),
             love.graphics.newImage("images/guerriere_stuff13.png")},
archerM   = {love.graphics.newImage("images/archer_m_stuff.png")},
archerF   = {love.graphics.newImage("images/archer_f_stuff.png")},
mageM     = {love.graphics.newImage("images/mage.png")},
mageF     = {love.graphics.newImage("images/mage_f_stuff.png")},
pretreM   = {love.graphics.newImage("images/priest_m_stuff.png")},
pretreF   = {love.graphics.newImage("images/priest_f_stuff.png")},

}
end
database.update = function (dt)

end

database.drawChara = function()
  color( 4 )
  if data.sex == "homme" and data.class == "chevalier" then
  love.graphics.draw(imgDatabase.guerrierM[1],400,160)
    for n = 2,#imgDatabase.guerrierM do
      --changement de couleur des vetements
      if data.vet01 == data.vet01 and n == 4 or n == 9 then 
        color ( data.vet01 )
      end 
  love.graphics.draw(imgDatabase.guerrierM[n],400,160,0,0.2)
        color ( 4 )
    end
  elseif data.sex == "homme" and data.class == "archer" then
  love.graphics.draw(imgDatabase.archerM[1],420,130,0,0.3)
elseif data.sex == "homme" and data.class == "mage" then
  love.graphics.draw(imgDatabase.mageM[1],400,120,0,0.15)
elseif data.sex == "homme" and data.class == "pretre" then 
  love.graphics.draw(imgDatabase.pretreM[1],470,105,0,0.3)
  elseif data.sex == "femme" and data.class == "chevalier" then
  for n = 1 , #imgDatabase.guerrierF do
  love.graphics.draw(imgDatabase.guerrierF[n],380,140,0,0.3)
  end
elseif data.sex == "femme" and data.class == "archer" then
  love.graphics.draw(imgDatabase.archerF[1],450,105,0,0.25)
elseif data.sex == "femme" and data.class == "mage" then
  love.graphics.draw(imgDatabase.mageF[1],420,140,0,0.2)
elseif data.sex == "femme" and data.class == "pretre" then
  love.graphics.draw(imgDatabase.pretreF[1],430,140,0,0.25)
  end
end

database.draw = function()
database.drawChara()
end

return database