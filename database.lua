database = {}

--table
image = {
  ["load"]  = true,
     nom      = {("images/guerrier.png"),                  --1 ressource personnage [Guerrier homme]
                 ("images/guerrier_stuff01.png"),
                 ("images/guerrier_stuff02.png"),
                 ("images/guerrier_stuff03.png"),
                 ("images/guerrier_stuff04.png"),
                 ("images/guerrier_stuff05.png"),
                 ("images/guerrier_stuff06.png"),
                 ("images/guerrier_stuff07.png"),
                 ("images/guerrier_stuff08.png"),
                 ("images/guerrier_stuff09.png"),
                 ("images/guerrier_stuff10.png"),
                 ("images/guerrier_stuff11.png"),
                 ("images/guerrier_stuff12.png"),
                 ("images/guerrier_stuff13.png"),         --14
                 ("images/guerriere.png"),                --15 [guerrier femme]
                 ("images/guerriere_stuff01.png"),
                 ("images/guerriere_stuff02.png"),
                 ("images/guerriere_stuff03.png"),
                 ("images/guerriere_stuff04.png"),
                 ("images/guerriere_stuff05.png"),
                 ("images/guerriere_stuff06.png"),
                 ("images/guerriere_stuff07.png"),
                 ("images/guerriere_stuff08.png"),
                 ("images/guerriere_stuff09.png"),
                 ("images/guerriere_stuff10.png"),
                 ("images/guerriere_stuff11.png"),
                 ("images/guerriere_stuff12.png"),
                 ("images/guerriere_stuff13.png"),       --28 [archer homme]
                }  
              }

-- local
local nPlus = 1
local imageLoad = "rien"
local timer = 0

database.load = function()
  

imgDatabase = {  
guerrierM = {},
guerrierF = {},
archerM   = {love.graphics.newImage("images/archer_m.png")},
archerF   = {love.graphics.newImage("images/archer_f.png")},
mageM     = {love.graphics.newImage("images/mage_m.png")},
mageF     = {love.graphics.newImage("images/mage_f.png")},
pretreM   = {love.graphics.newImage("images/priest_m.png")},
pretreF   = {love.graphics.newImage("images/priest_f.png")},
}

end

database.loadUpdate = function (dt)
  
  if menu_courant == "load" and not image.load then
    dataReload()
    data.sex = "homme"
    data.class = "chevalier"
    menu_courant = "create_character"
    menu_courant = "create_character"
  end
  
  if menu_courant == "load" then
      if timer == 10 then
        if image.load then
              if nPlus < 15 then
                for n = 1,14 do
                   table.insert(imgDatabase.guerrierM,love.graphics.newImage(image.nom[n]))
                   imageLoad = image.nom[n]
                   nPlus = n + 1
                end
              end

                if nPlus == 15 then
                  for n = 15,28 do 
                     table.insert(imgDatabase.guerrierF,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end 
-- Le dernier chiffre qui ferme le chargement des images
              if nPlus == 29 then
               image.load = false
              end
        end
      else
       timer = timer + 1
     end 

  if not image.load then
  dataReload()
  data.sex = "homme"
  data.class = "chevalier"
  menu_courant = "create_character"
  end
end

end

database.update = function (dt)
database.loadUpdate(dt)  
end

database.drawChara = function()
  color( 4 )
  if data.sex == "homme" and data.class == "chevalier" then
    for n = 1,#imgDatabase.guerrierM do
      --changement de couleur des vetements
      if data.vet01 == data.vet01 and n == 4 or n == 9 then 
        color ( data.vet01 )
      end 
  love.graphics.draw(imgDatabase.guerrierM[n],400,160)
        color ( 4 )
    end
  elseif data.sex == "homme" and data.class == "archer" then
  love.graphics.draw(imgDatabase.archerM[1],420,130)
elseif data.sex == "homme" and data.class == "mage" then
  love.graphics.draw(imgDatabase.mageM[1],400,120)
elseif data.sex == "homme" and data.class == "pretre" then 
  love.graphics.draw(imgDatabase.pretreM[1],470,105)
  elseif data.sex == "femme" and data.class == "chevalier" then
  for n = 1 , #imgDatabase.guerrierF do
  love.graphics.draw(imgDatabase.guerrierF[n],380,140)
  end
elseif data.sex == "femme" and data.class == "archer" then
  love.graphics.draw(imgDatabase.archerF[1],450,105)
elseif data.sex == "femme" and data.class == "mage" then
  love.graphics.draw(imgDatabase.mageF[1],420,140)
elseif data.sex == "femme" and data.class == "pretre" then
  love.graphics.draw(imgDatabase.pretreF[1],430,140)
  end
end

database.drawLoad = function ()
  if menu_courant == "load" and image.load then
  love.graphics.print("Chargement en cours",(largeur/2)-(8*3*10),hauteur/2,0,3)
  end

end

database.draw = function()
database.drawLoad()
database.drawChara()
end

return database