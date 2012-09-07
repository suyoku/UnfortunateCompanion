from Updatable import Updatable
from GameObject import GameObject
from Vec2d import Vec2d

class PhysicsObject(Updatable):
    def __init__(self, img, position):
        Updatable.__init__(self, img, position)
        self.vel = Vec2d(0.0, 0.0)
        self.accel = Vec2d(0.0, 0.0)
        self.pos = position

    def update(self):
        self.vel += self.accel
        self.pos += self.vel
        self.box.center = self.pos

    def setAcceleration(self, accel):
        self.accel = Vec2d(accel) 
    
    def getVelocity(self):
        return self.accel

    def setVelocity(self, vel):
        self.vel = Vec2d(vel)
    
    def getVelocity(self):
        return self.vel

    def setPosition(self, pos):
        self.pos = pos

    def getPosition(self): 
        return self.pos

    def getBox(self):
        return self.box
