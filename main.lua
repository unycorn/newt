function love.load()

  Tileset = love.graphics.newImage('images/Tileset1.png')
  
  Tileset:setFilter('nearest','nearest')
  
  ScaleW, ScaleH = 4, 4
  
  TileW, TileH = 16, 16
  TilesetW, TilesetH = Tileset:getWidth(), Tileset:getHeight()
  
  Quads = {
    love.graphics.newQuad(0, 0, TileW, TileH, TilesetW, TilesetH), -- Grass
    love.graphics.newQuad(16, 0, TileW, TileH, TilesetW, TilesetH), -- TallGrass
    love.graphics.newQuad(32, 0, TileW, TileH, TilesetW, TilesetH), -- Flowers
  }
  
  TileTable = {
    { 1,3,1 },
    { 3,2,3 },
    { 1,3,1 }
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