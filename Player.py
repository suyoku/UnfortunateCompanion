import pygame, sys
from pygame.locals import *
from PhysicsObject import PhysicsObject
from Constants import Constants

class Player(PhysicsObject):
    BLOCKING = 0
    STANDING = 1
    JUMPING = 2

    def __init__(self, img, position):
        PhysicsObject.__init__(self, img, position)
        self.state = Player.JUMPING
        self.shieldImg = pygame.image.load('rightShield.png').convert()
        self.blocking = False 
        
    def update(self):
        PhysicsObject.update(self)
        pressedKeys = pygame.key.get_pressed()


        self.blocking = pressedKeys[K_s]

        #Only allow the player to move if they're not blocking
        if not self.blocking: 
            if pressedKeys[K_LEFT]:
                self.setPosition(self.getPosition() - (Constants.KNIGHT_SPEED, 0.0))
            if pressedKeys[K_RIGHT]:
                self.setPosition(self.getPosition() + (Constants.KNIGHT_SPEED, 0.0))

        if self.getPosition().y < 600:
            self.state = Player.JUMPING
            self.setAcceleration((0.0, Constants.GRAVITY))
        else:
            self.state = Player.STANDING
            self.setVelocity((0.0, 0.0))
            self.setAcceleration((0.0, 0.0))
        
    def keyUp(self, key):
        if key == K_UP:
            self.setVelocity((0.0, -Constants.KNIGHT_JUMP_POWER))

    def draw(self, surface):
        PhysicsObject.draw(self, surface) 
        if self.blocking:
            shieldPos = (self.getBox().topleft[0] + self.getBox().width,  self.getBox().topleft[1])
            surface.blit(self.shieldImg, shieldPos)
            
