function love.load()

  Tileset = love.graphics.newImage('images/Tileset1.png')
  
  Tileset:setFilter('nearest','nearest')
  
  ScaleW, ScaleH = 4, 4
  
  TileW, TileH = 16, 16
  TilesetW, TilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {}
  local quadInfo = {
    {0, 0}   -- Grass
    {16, 0}  -- Tall Grass
    {32, 0}  -- Flowers
    {48, 0}  -- Mossy Rock
    {0, 16}  -- Rock
  }
  
  for i,info in ipairs(quadInfo) do
    -- info[1] = x, info[2] = y
    Quads[i] = love.graphics.newQuad(info[1], info[2], TileW, TileH, tilesetW, tilesetH)
  end
  
  TileTable = {
    { 1,1,1,1,1,1,1,1,1 },
    { 1,5,5,5,3,1,1,1,1 },
    { 1,5,3,1,5,3,1,1,1 },
    { 1,5,3,1,1,5,3,1,1 },
    { 1,5,3,1,1,5,3,1,1 },
    { 1,5,3,1,1,5,3,1,1 },
    { 1,5,3,1,5,3,1,1,1 },
    { 1,5,5,5,3,1,1,1,1 },
    { 1,1,1,1,1,1,1,1,1 }
  }
  
end

function love.draw()
  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      love.graphics.draw(Tileset, Quads[number], (columnIndex-1)*TileW*ScaleW, (rowIndex-1)*TileH*ScaleH, 0, ScaleW, ScaleH)
    end
  end
end