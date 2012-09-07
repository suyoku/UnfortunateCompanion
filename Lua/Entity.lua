require "GameObject"

State = {IDLE = 1, JUMPING = 2}
Entity = GameObject:new()

function Entity:new(image)
    ent = GameObject.new(self, image)
    ent.vel = {x = 0, y =0}
    ent.acc = {x = 0, y = 0}
    ent.state = State.IDLE
    return ent
end

function Entity:update()
    self.vel.x =  self.vel.x + self.acc.x
    self.vel.y = self.vel.y + self.acc.y
    self.x = self.x + self.vel.x
    self.y = self.y + self.vel.y

    if self.y > 600 then
        self.vel.y, self.acc.y = 0, 0
    else 
        self.acc.y = .4
    end
end



