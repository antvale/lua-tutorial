function producer ()
  while true do
    local x = io.read()
    send(x) end
end

function consumer ()
  while true do
    local x = receive()
    io.write(x, "\n")
  end
end

function receive ()
  local status, value = coroutine.resume(producer)
  return "consumer writes:"..value
end

function send (x)
  print("Producer reads:"..x)
  coroutine.yield(x)
end

producer = coroutine.create(producer)

local consumer=consumer()
 
 --[[
print(coroutine.status(producer))
 
if (coroutine.status(producer)=="suspended") then
  coroutine.resume(producer)
end
 ]]--