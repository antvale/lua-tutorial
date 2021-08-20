--[[
Basic table concepts in LUA
]]--


-- Enum How to build an enum in LUA. In this example SUSPENDED is a key whilst 0 is a value.
local STATES = {SUSPENDED=0, RUNNING=1, BLOCKED=2, DEAD=3}

local state=STATES.RUNNING

if (state==STATES.SUSPENDED) then print("State is suspended")
elseif (state==STATES.RUNNING) then print("State is running")
elseif (state==STATES.BLOCKED) then print ("State is blocked")
else print ("State is dead")
end

-- print enums. Noted that you can't use ipairs because the table is a key/value list
for k,v in pairs(STATES) do
  print(k,v)  
end

-- Day of week
local DayOfWeek = {MONDAY=1, THUESDAY=2, WEDNESDAY=3, THURSDAY=4, FRIDAY=5, SATURDAY=6, SUNDAY=0}

local currentDay=DayOfWeek.THUESDAY

if (currentDay==DayOfWeek.MONDAY) then 
  print ("The current day is Monday")
elseif (currentDay==DayOfWeek.THUESDAY) then
  print ("The current day is Thueday")
end

for k,v in pairs(DayOfWeek) do
  print(k,v)
end

-- Planet enums
local Planet={ G=6.67300E-11,
               Mercury={mass=3.303e+23, radius=2.4397e6}, 
               Venus={mass=4.869e+24, radius=6.0518e6},
               Earth={mass=5.976e+24, radius=6.37814e6},
               Mars={mass=6.421e+23, radius=3.3972e6},
               surfaceGravity=function(self,mass,radius) return self.G*mass/(radius*radius)
               end,
               surfaceWeight=function(self,otherMass,mass,radius) return otherMass*self:surfaceGravity(mass,radius)
                 end
               }


print ("Universal Gravity Constant: "..Planet.G)

print ("Surface Gravity of Mercury: "..Planet:surfaceGravity(Planet.Mercury.mass,Planet.Mercury.radius))

print ("Surface Weight: "..Planet:surfaceWeight(Planet.Mercury.mass,Planet.Mercury.mass,Planet.Mercury.radius))

for k,v in pairs(Planet) do
  if (type(v)=="table") then
    print (("Pianeta %s mass:%e radius:%e surface gravity:%e"):format(k,v.mass,v.radius,Planet:surfaceGravity(v.mass,v.radius)))
    end
end



