--[[
  Planet object and methods
  ]]--
  
local Planet={}

local G = 6.67300E-11

local function new(name, mass, radius)
  return {name=name, mass=mass, radius=radius}
end

Planet.new = new

function Planet:surfaceGravity(planet) 
  return G*planet.mass/(planet.radius*planet.radius)
end


function Planet:surfaceWeight(otherMass, planet) 
  return otherMass*Planet:surfaceGravity(planet)
end

return Planet