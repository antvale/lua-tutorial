--[[
  Planet object and methods
  ]]--
  
local Planet={}

local G = 6.67300E-11

-- Factory to create a new Planet
local function new(name, mass, radius)
  return {name=name, mass=mass, radius=radius, 
          surfaceGravity=function(self) return G*self.mass/(self.radius*self.radius) end,
          surfaceWeight=function(self,otherMass) return otherMass*self:surfaceGravity() end}
end

Planet.new = new

-- utilities to handle a given planet
function Planet:surfaceGravity(planet) 
  return G*planet.mass/(planet.radius*planet.radius)
end


function Planet:surfaceWeight(otherMass, planet) 
  return otherMass*Planet:surfaceGravity(planet)
end

return Planet