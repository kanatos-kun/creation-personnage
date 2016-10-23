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
             love.graphics.newImage("images/guerriere_stuff13.png")}
}
end
database.update = function (dt)

end

database.drawChara = function()
  color( 4 )
  if data.sex == "homme" then
  love.graphics.draw(imgDatabase.guerrierM[1],400,160)
    for n = 2,#imgDatabase.guerrierM do
      --changement de couleur des vetements
      if data.vet01 == data.vet01 and n == 4 or n == 9 then 
        color ( data.vet01 )
      end
    
  love.graphics.draw(imgDatabase.guerrierM[n],400,160,0,0.2)
        color ( 4 )
    end
  elseif data.sex == "femme" then
  for n = 1 , #imgDatabase.guerrierF do
  love.graphics.draw(imgDatabase.guerrierF[n],380,140,0,0.3)
  end
  end
end

database.draw = function()
database.drawChara()
end

return database