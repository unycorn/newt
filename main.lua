function loadMap()

  Tileset = love.graphics.newImage('images/tileset1.png')
  Tileset:setFilter('nearest','nearest')
  
  ScaleW, ScaleH = 4, 4
  
  TileW, TileH = 16, 16
  local TilesetW, TilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {}
  local quadInfo = {
    {' ', 0, 0},   -- Grass
    {'#', 16, 0},  -- Tall Grass
    {'^', 32, 0},  -- Flowers
    {'$', 48, 0},  -- Mossy Rock
    {'%', 0, 16},  -- Rock
    {'a', 16, 16},
    {'b', 32, 16},
    {'A', 48, 16},
    {'B', 0, 32},
    {'c', 16, 32},
    {'d', 32, 32},
    {'C', 48, 32},
    {'D', 0, 48},
    {'e', 16, 48},
    {'f', 32, 48},
    {'E', 48, 48},
    {'F', 0, 64},
    {'g', 16, 64},
    {'h', 32, 64},
    {'i', 48, 64},
    {'j', 0, 80},
    {'k', 16, 80},
    {'l', 32, 80},
    {'m', 48, 80},
    {'n', 0, 96},
    {'o', 16, 96},
    {'P', 32, 96},
    {'p', 48, 96},
    {'q', 0, 112},
    {'r', 16, 112},
    {'s', 32, 112},
    {'t', 48, 112},
    {'x', 0, 128},
    {'w', 16, 128},
    {'v', 32, 128},
    {'u', 48, 128},
  }
  
  for i,info in ipairs(quadInfo) do
    -- info[1] = string, info[2] = x, info[3] = y
    Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, TilesetW, TilesetH)
  end
  
  local tileString = 
[[
qrrrrrrrrrrs
x    ##    t
x  ^ghhi^  t
x  ^jkkl^  t
x  ^mnno^  t
x   ^##^   t
x % #### % t
wvvvvvvvvvvu
]]
  
  TileTable = {}
  
  local width = #(tileString:match("[^\n]+"))

  for x = 1,width,1 do TileTable[x] = {} end  

  local rowIndex,columnIndex = 1,1
  for row in tileString:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    columnIndex = 1
    for character in row:gmatch(".") do
      TileTable[columnIndex][rowIndex] = character
      columnIndex = columnIndex + 1
    end
  rowIndex=rowIndex+1
  end
end

function drawMap()
  for columnIndex,column in ipairs(TileTable) do
    for rowIndex,char in ipairs(column) do
      local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH
      local drawQuad = Quads[char]
      if drawQuad == nil then drawQuad = Quads['^'] end
      love.graphics.draw(Tileset, drawQuad, x*ScaleW, y*ScaleH, 0, ScaleW, ScaleH)
    end
  end
end

function love.load()
  loadMap()

end

function love.draw()
  drawMap()
  
end