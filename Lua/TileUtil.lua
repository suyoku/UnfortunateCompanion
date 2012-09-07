TileUtil = {}

GRID_CELL_WIDTH = 32
GRID_CELL_HEIGHT = 32

--[[ Loads an image containing all the level information 
     and stores it in a 2D array ]]--
function TileUtil:loadMap(mapPath)
    local map = love.image.newImageData(mapPath)
    mapGrid = {}
   mapGrid.height = map:getHeight()
    mapGrid.width = map:getWidth()
    for x=0, mapGrid.width - 1 do
        for y = 0, mapGrid.height - 1 do
            if y == 0 then mapGrid[x] = {} end

            red, green, blue = map:getPixel(x, y)
            mapGrid[x][y] = {r = red, g = green, b = blue}
        end
    end
    return mapGrid
end

--[[ Convert from tile coordinates to game screen resolution ]]--
function TileUtil:tileCoordToWorld(x, y)
    return x * GRID_CELL_WIDTH, y * GRID_CELL_HEIGHT
end
