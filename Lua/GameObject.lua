GameObject = {}

function GameObject:new()
    obj = {}
    obj.x = 0
    obj.y = 0
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function GameObject:new(image, x, y)
    obj = {}

    if x == nil then obj.x = 0 else obj.x = x end
    if y == nil then obj.y = 0 else obj.y = y end

    setmetatable(obj, self)
    self.__index = self
    obj.image = image
    return obj
end

function GameObject:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 1, 1, 0, 0, 0, 0)
end

