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
                 ("images/guerriere_stuff13.png"),        --28
                 ("images/mage_m.png"),                   --29 [mage homme]
                 ("images/mage_m_stuff_01.png"),       
                 ("images/mage_m_stuff_02.png"),       
                 ("images/mage_m_stuff_03.png"),       
                 ("images/mage_m_stuff_04.png"),       
                 ("images/mage_m_stuff_05.png"),       
                 ("images/mage_m_stuff_06.png"),       
                 ("images/mage_m_stuff_07.png"),       
                 ("images/mage_m_stuff_08.png"),           --37  
                 ("images/mage_f.png"),                    --38 [mage femme]
                 ("images/mage_f_stuff01.png"),                 
                 ("images/mage_f_stuff02.png"),                 
                 ("images/mage_f_stuff03.png"),                 
                 ("images/mage_f_stuff04.png"),                 
                 ("images/mage_f_stuff05.png"),                 
                 ("images/mage_f_stuff06.png"),                 
                 ("images/mage_f_stuff07.png"),                 
                 ("images/mage_f_stuff08.png"),           -- 46 
                 ("images/archer_m.png"),           -- 47 [archer homme]              
                 ("images/archer_m_stuff01.png"),              
                 ("images/archer_m_stuff02.png"),              
                 ("images/archer_m_stuff03.png"),              
                 ("images/archer_m_stuff04.png"),              
                 ("images/archer_m_stuff05.png"),              
                 ("images/archer_m_stuff06.png"),              
                 ("images/archer_m_stuff07.png"),              
                 ("images/archer_m_stuff08.png"),              
                 ("images/archer_m_stuff09.png"),              
                 ("images/archer_m_stuff10.png"),              
                 ("images/archer_m_stuff11.png"),              
                 ("images/archer_m_stuff12.png"),              
                 ("images/archer_m_stuff13.png"),              
                 ("images/archer_m_stuff14.png"),       --61  
                 ("images/archer_f.png"),               --62 [archer femme]
                 ("images/archer_f_stuff01.png"),
                 ("images/archer_f_stuff02.png"),
                 ("images/archer_f_stuff03.png"),
                 ("images/archer_f_stuff04.png"),
                 ("images/archer_f_stuff05.png"),
                 ("images/archer_f_stuff06.png"),
                 ("images/archer_f_stuff07.png"),
                 ("images/archer_f_stuff08.png"),
                 ("images/archer_f_stuff09.png"),
                 ("images/archer_f_stuff10.png"),        --72
                 ("images/priest_m.png"),                --73 [pretre homme]
                 ("images/priest_m_stuff01.png"), 
                 ("images/priest_m_stuff02.png"), 
                 ("images/priest_m_stuff03.png"), 
                 ("images/priest_m_stuff04.png"), 
                 ("images/priest_m_stuff05.png"), 
                 ("images/priest_m_stuff06.png"),          --79
                 ("images/priest_f.png"),                  --80 [pretre femme]
                 ("images/priest_f_stuff01.png"),
                 ("images/priest_f_stuff02.png"),
                 ("images/priest_f_stuff03.png"),
                 ("images/priest_f_stuff04.png"),
                 ("images/priest_f_stuff05.png"),
                 ("images/priest_f_stuff06.png"),
                 ("images/priest_f_stuff07.png"),        --87
 
                 ("images/guerrier_hair01.png"),         --88
                 ("images/guerrier_hair02.png"), 
                 ("images/guerrier_eye.png"), 
                 ("images/guerriere_hair01.png"), 
                 ("images/guerriere_hair02.png"), 
                 ("images/guerriere_eye.png"),           --93

                 ("images/mage_m_hair01.png"),           --94
                 ("images/mage_m_hair02.png"), 
                 ("images/mage_m_eye.png"), 
                 ("images/mage_f_hair01.png"), 
                 ("images/mage_f_hair02.png"), 
                 ("images/mage_f_eye.png"),             --99

                 ("images/archer_m_hair01.png"),        --100
                 ("images/archer_m_hair02.png"), 
                 ("images/archer_m_eye.png"), 
                 ("images/archer_f_hair01.png"), 
                 ("images/archer_f_hair02.png"), 
                 ("images/archer_f_eye.png"),           --105

                 ("images/priest_m_hair01.png"),        --106
                 ("images/priest_m_hair02.png"), 
                 ("images/priest_m_eye.png"), 
                 ("images/priest_f_hair01.png"), 
                 ("images/priest_f_hair02.png"), 
                 ("images/priest_f_eye.png"),          --111

                }  
              }

-- local
local nPlus = 1
local imageLoad = "rien"
local timer = 0

database.load = function()
  

imgDatabase = {  
guerrierM = {hair = {},eye ={}},
guerrierF = {hair = {},eye ={}},
archerM   = {hair = {},eye ={}},
archerF   = {hair = {},eye ={}},
mageM     = {hair = {},eye ={}},
mageF     = {hair = {},eye ={}},
pretreM   = {hair = {},eye ={}},
pretreF   = {hair = {},eye ={}},
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

                if nPlus == 29 then
                  for n = 29,37 do 
                     table.insert(imgDatabase.mageM,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end 

                if nPlus == 38 then
                  for n = 38,46 do 
                     table.insert(imgDatabase.mageF,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end 

                if nPlus == 47 then
                  for n = 47,61 do 
                     table.insert(imgDatabase.archerM,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end 

                if nPlus == 62 then
                  for n = 62,72 do 
                     table.insert(imgDatabase.archerF,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end 

                if nPlus == 73 then
                  for n = 73,79 do 
                     table.insert(imgDatabase.pretreM,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end  

                if nPlus == 80 then
                  for n = 80,87 do 
                     table.insert(imgDatabase.pretreF,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end  

                if nPlus == 88 then
                  for n = 88,89 do 
                     table.insert(imgDatabase.guerrierM.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 90 then
                     table.insert(imgDatabase.guerrierM.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end
                
                if nPlus == 91 then
                  for n = 91,92 do 
                     table.insert(imgDatabase.guerrierF.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 93 then
                     table.insert(imgDatabase.guerrierF.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end

                if nPlus == 94 then
                  for n = 94,95 do 
                     table.insert(imgDatabase.mageM.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 96 then
                     table.insert(imgDatabase.mageM.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end
 
                 if nPlus == 97 then
                  for n = 97,98 do 
                     table.insert(imgDatabase.mageF.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 99 then
                     table.insert(imgDatabase.mageF.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end
 
                 if nPlus == 100 then
                  for n = 100,101 do 
                     table.insert(imgDatabase.archerM.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 102 then
                     table.insert(imgDatabase.archerM.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end

                 if nPlus == 103 then
                  for n = 103,104 do 
                     table.insert(imgDatabase.archerF.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 105 then
                     table.insert(imgDatabase.archerF.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end

                if nPlus == 106 then
                  for n = 106,107 do 
                     table.insert(imgDatabase.pretreM.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 108 then
                     table.insert(imgDatabase.pretreM.eye,love.graphics.newImage(image.nom[nPlus]))
                     nPlus = nPlus + 1
                end

                if nPlus == 109 then
                  for n = 109,110 do 
                     table.insert(imgDatabase.pretreF.hair,love.graphics.newImage(image.nom[n]))
                     nPlus = n + 1
                  end
                end

                if nPlus == 111 then
                     table.insert(imgDatabase.pretreF.eye,love.graphics.newImage(image.nom[nPlus]))
                     table.insert(imgDatabase.guerrierM.eye,love.graphics.newImage("images/guerrier_eye02.png"))
                     table.insert(imgDatabase.guerrierF.eye,love.graphics.newImage("images/guerriere_eye02.png"))
                     table.insert(imgDatabase.archerM.eye,love.graphics.newImage("images/archer_m_eye02.png"))
                     table.insert(imgDatabase.archerF.eye,love.graphics.newImage("images/archer_f_eye02.png"))
                     table.insert(imgDatabase.mageM.eye,love.graphics.newImage("images/mage_m_eye02.png"))
                     table.insert(imgDatabase.mageF.eye,love.graphics.newImage("images/mage_f_eye02.png"))
                     table.insert(imgDatabase.pretreM.eye,love.graphics.newImage("images/priest_m_eye02.png"))
                     table.insert(imgDatabase.pretreF.eye,love.graphics.newImage("images/priest_f_eye02.png"))
                     nPlus = nPlus + 1
                end
  
-- Le dernier chiffre ferme le chargement des images
              if nPlus == 112 then
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
local  hairCut = data.hair.cut
local eye = data.eye
  color( 4 )
  if data.sex == "homme" and data.class == "chevalier" then
    for n = 1,#imgDatabase.guerrierM do
      --changement de couleur des vetements

      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 4 or n == 9 then 
        color ( data.vet01 )
      end 
      
      if data.vet02 == data.vet02 and n == 3 or n == 12 
      or n == 11 or n == 6  or n == 5 or n == 8 
      or n == 13 or n == 10 or n == 11  then 
        color ( data.vet02 )
      end
      
      if n == 2 or n == 14 then
        color ( 1)
      end
  
  love.graphics.draw(imgDatabase.guerrierM[n],400,160)

        color ( 4 )
    end
  love.graphics.draw(imgDatabase.guerrierM.eye[2],400,160)
  love.graphics.draw(imgDatabase.guerrierM.eye[1],400,160)
  love.graphics.draw(imgDatabase.guerrierM.hair[hairCut],400,160)
  elseif data.sex == "homme" and data.class == "archer" then
    for n = 1,#imgDatabase.archerM do

      if data.body == data.body and n == 1 then
      color ( data.body)
      end
      
      if data.vet01 == data.vet01 and n == 2 or n == 4 or
         n == 7 or n == 14 then 
        color ( data.vet01 )
      end 

      if data.vet02 == data.vet02 and n == 3 or n == 12 or
         n == 13 or n == 15 or n == 5 or n == 8 then 
        color ( data.vet02 )
      end 
      
      if n == 10 or n == 6 then
      color ( 1 )  
    end

      if n == 9 or n == 11 then
      color ( 30 )  
      end 
  love.graphics.draw(imgDatabase.archerM[n],420,130)

        color ( 4 )
    end
  love.graphics.draw(imgDatabase.archerM.eye[2],420,130)
  love.graphics.draw(imgDatabase.archerM.eye[1],420,130)
  love.graphics.draw(imgDatabase.archerM.hair[hairCut],420,130)
elseif data.sex == "homme" and data.class == "mage" then
    for n = 1,#imgDatabase.mageM do

      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 2 or n == 5 or
         n == 7  then 
        color ( data.vet01 )
      end 

      if data.vet02 == data.vet02 and n == 8 or n == 6 or
         n == 3                                      then 
        color ( data.vet02 )
      end 
      
      if n == 4 then 
      color( 30 )
      end
  love.graphics.draw(imgDatabase.mageM[n],400,120)

        color ( 4 )
    end
  love.graphics.draw(imgDatabase.mageM.eye[2],400,120)
  love.graphics.draw(imgDatabase.mageM.eye[1],400,120)
  love.graphics.draw(imgDatabase.mageM.hair[hairCut],400,120)
elseif data.sex == "homme" and data.class == "pretre" then 
    for n = 1,#imgDatabase.pretreM do

      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 2 or n == 7  then 
        color ( data.vet01 )
      end 

      if data.vet02 == data.vet02 and n == 6           then 
        color ( data.vet02 )
      end 
      
      if n == 3 then
      color ( 30 )
      end
      
      if n ==4 then
      color(34)
      end
      
  love.graphics.draw(imgDatabase.pretreM[n],470,105)

        color ( 4 )
    end
  love.graphics.draw(imgDatabase.pretreM.eye[2],470,105)
  love.graphics.draw(imgDatabase.pretreM.eye[1],470,105)
  love.graphics.draw(imgDatabase.pretreM.hair[hairCut],470,105)
  elseif data.sex == "femme" and data.class == "chevalier" then
  for n = 1 , #imgDatabase.guerrierF do

      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 8 or n == 10 or
         n == 11                                      then 
        color ( data.vet01 )
      end 

      if data.vet02 == data.vet02 and n == 9 or n == 14 or
         n == 12   or n == 6  or n == 5   or n == 3     or
         n == 4    or n==13 then 
        color ( data.vet02 )
      end 
    if n == 7 or n == 2 then
    color ( 1 )
    end
  love.graphics.draw(imgDatabase.guerrierF[n],380,140)
        color ( 4 )
  end
  love.graphics.draw(imgDatabase.guerrierF.eye[2],380,140)
  love.graphics.draw(imgDatabase.guerrierF.eye[1],380,140)
  love.graphics.draw(imgDatabase.guerrierF.hair[hairCut],380,140)
elseif data.sex == "femme" and data.class == "archer" then
    for n = 1,#imgDatabase.archerF do
      
      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 2 or n == 3 or n == 10 then 
        color ( data.vet01 )
      end 

      if data.vet02 == data.vet02 and n == 4 or n ==9 or
         n == 11 then 
        color ( data.vet02 )
      end 
    if n == 7 then
      color ( 1 )
    end
    
    if n == 5 or n == 8 then
      color ( 30 )
    end
    
    if n == 6 then
      color ( 13 ) 
    end
 
  love.graphics.draw(imgDatabase.archerF[n],450,105)
        color ( 4 )
    end
  love.graphics.draw(imgDatabase.archerF.eye[2],450,105)
  love.graphics.draw(imgDatabase.archerF.eye[1],450,105)
  love.graphics.draw(imgDatabase.archerF.hair[hairCut],450,105)
elseif data.sex == "femme" and data.class == "mage" then
    for n = 1,#imgDatabase.mageF do

      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 2 or n == 6 then 
        color ( data.vet01 )
      end 
      
     if data.vet02 == data.vet02 and n == 3 or n ==4 or
         n == 5 or n == 7 or n ==9 then 
        color ( data.vet02 )
      end 
     if n == 8 then
      color ( 30 )
     end
     
  love.graphics.draw(imgDatabase.mageF[n],420,140)

        color ( 4 )
    end
  love.graphics.draw(imgDatabase.mageF.eye[2],420,140)
  love.graphics.draw(imgDatabase.mageF.eye[1],420,140)
  love.graphics.draw(imgDatabase.mageF.hair[hairCut],420,140)
elseif data.sex == "femme" and data.class == "pretre" then
    for n = 1,#imgDatabase.pretreF do

      if data.body == data.body and n == 1 then
      color ( data.body)
    end

      if data.vet01 == data.vet01 and n == 3 or n == 8 then 
        color ( data.vet01 )
      end

      if data.vet02 == data.vet02 and n == 2 or n == 7 then 
        color ( data.vet02 )
      end

      if n == 4 then
        color ( 30 )
      end
      
      if n == 5 then
        color ( 34 )
      end
      
  love.graphics.draw(imgDatabase.pretreF[n],430,140)

        color ( 4 )
    end
  love.graphics.draw(imgDatabase.pretreF.eye[2],430,140)
  love.graphics.draw(imgDatabase.pretreF.eye[1],430,140)
  love.graphics.draw(imgDatabase.pretreF.hair[hairCut],430,140)
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