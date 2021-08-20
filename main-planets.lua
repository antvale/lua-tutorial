local Planet = require "planets.planet3"


local mercury = Planet:new()

local listOfPlanets={Planet:new{name="Earth",mass=4.869e+24,radius=6.0518e6},
                     Planet:new{name="Mercury",mass=3.303e+23,radius=2.4397e6},
                     Planet:new{name="Venus",mass=4.869e+24,radius=6.0518e6},
                     Planet:new{name="Mars",mass=6.421e+23,radius=3.3972e6}}
                   
for k,v in pairs(listOfPlanets) do
  print (("Pianeta %s - mass:%e, radius:%e, surface gravity:%e"):
  format(v.name, v.mass, v.radius, v:surfaceGravity()))
end
