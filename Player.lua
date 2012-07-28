require "Entity"

Player = Entity:new()


function Player:new(image)
    player = Entity.new(self, image)
    player.jumps = 0
    return player 
end

function Player:update()
    Entity.update(self)
    if self.acc.y == 0 then
        self.jumps = 0
    end
end

function Player:up()
    if self.jumps < 2 then
        self.vel.y = -10
        self.jumps = self.jumps + 1
    end
end

function Player:left()
    self.x = self.x - 3
end

function Player:right()
    self.x = self.x + 3
end
