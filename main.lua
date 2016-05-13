function love.load()
  Message = "Hello from LOVE"
  local secret = 'This is a local string'
end

function love.draw()
  love.graphics.print(Message, 200, 200)
end