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
             love.graphics.newImage("images/guerrier_stuff12.png")},
guerrierF = {love.graphics.newImage("images/guerriere.png"),
             love.graphics.newImage("images/guerriere_stuff.png")}
}
end
database.update = function (dt)

end

database.drawChara = function()
  color( 4 )
  if data.sex == "homme" then
  love.graphics.draw(imgDatabase.guerrierM[1],400,160)
    for n = 2,#imgDatabase.guerrierM do
  love.graphics.draw(imgDatabase.guerrierM[n],400,160,0,0.2)
    end
  elseif data.sex == "femme" then
  love.graphics.draw(imgDatabase.guerrierF[1],380,140,0,0.3)
  love.graphics.draw(imgDatabase.guerrierF[2],380,140,0,0.3)
  end
end

database.draw = function()
database.drawChara()
end

return database