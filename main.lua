--[[
 Basic Lua concepts
]]--

local cpx = require "numbers.complex"

local planet= require "planets.planet2"

print("Hello World!")

-- String
print("Hello World ".."Antonio!")
print(("Hello World %d times!"):format(math.random(0,100)))

-- Compute the factorial of a given number
function fact(n)
  if (n==0) then return 1
  else return n*fact(n-1)
  end
end

--[[
print("Enter a numner:")
local a = io.read("*n") -- reads a number
print(fact(a))
]]--

-- simple table
local a={}

a["name"]="John"
a["surname"]="Smith"
a[0]="No value"

print(a["name"].." "..a.surname.." "..a[0])

-- enum

local dayOfWeek={MONDAY="Monday", TUESDAY="Tuesday", WEDNESDAY="Wednesday",THURSDAY="Thursday", FRIDAY="Friday", SATURDAY="Saturday", SUNDAY="Sunday"}

print(dayOfWeek.MONDAY)

array={1,2,100}

print (#array)

for k,v in ipairs(array) do
  print(k,v)
end

print(cpx.tostring(cpx.add(cpx.new(3,4), cpx.i)))

print(cpx.tostring(cpx.add(cpx.new(3,4), cpx.new(0,1))))


mercury=planet.new("Mercury",3.303e+23, 2.4397e6)

print (("Pianeta %s - mass:%e, radius:%e, surface gravity:%e"):
  format(mercury.name, mercury.mass, mercury.radius, planet:surfaceGravity(mercury)))

local listOfPlanets={planet.new("Mercury",3.303e+23, 2.4397e6),
                     planet.new("Venus",4.869e+24,6.0518e6),
                     planet.new("Earth",4.869e+24,6.0518e6),
                     planet.new("Mars",6.421e+23, 3.3972e6)
                   }
                   
for k,v in pairs(listOfPlanets) do
  print (k,v.name,v.mass,v.radius,v:surfaceGravity(),v:surfaceWeight(v.mass))
end

                     