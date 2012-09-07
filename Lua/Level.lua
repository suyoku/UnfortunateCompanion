require "TileUtil"
require "Tile"
require "List"

GROUND_TILE = love.graphics.newImage("groundtile.png")

Level = {}

function Level:new()
    newLevel = {}
    newLevel.tiles = List:new()
    newLevel.grid = {}
    setmetatable(newLevel, self)
    self.__index = self
    return newLevel
end

function Level:loadLevel()
    self.grid = TileUtil:loadMap('map.png') 
    for x = 0, self.grid.width - 1 do
        for y = 0, self.grid.height - 1 do
            if self.grid[x][y].r == 100 then
                local worldX, worldY = TileUtil:tileCoordToWorld(x, y)
                self.tiles:append(Tile:new(GROUND_TILE, worldX, worldY))
            end
        end
    end
    print (self.tiles:length().." tiles were loaded in")
end

function Level:draw()
    for tileNum = 0, self.tiles:length() - 1 do
        self.tiles:get(tileNum):draw()
    end
end
