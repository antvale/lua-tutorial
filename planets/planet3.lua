--[[
  Planet Module
  ]]--
  
local Planet={}

Planet.name=""
Planet.mass=0
Planet.radius=0

local G = 6.67300E-11

function Planet:new (o)
  o = o or {}
  setmetatable(o,self)
  self.__index=self
  return o
end

  
-- utilities to handle a given planet
function Planet:surfaceGravity() 
  return G*self.mass/(self.radius*self.radius)
end


function Planet:surfaceWeight(otherMass) 
  return otherMass*self:surfaceGravity()
end

return Planet