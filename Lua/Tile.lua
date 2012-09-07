require "GameObject"

Tile = GameObject:new()

function Tile:new(image, xPos, yPos)
    tile = GameObject.new(self, image)
    tile.x = xPos
    tile.y = yPos
    return tile
end
