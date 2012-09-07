import pygame, sys
from pygame.locals import *
from Player import Player


pygame.init()
DISPLAYSURF = pygame.display.set_mode((1024, 768))
pygame.display.set_caption('Hello World')
playerImg = pygame.image.load('mage.png').convert()
player = Player(playerImg, (100.0, 100.0))

while True:
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            sys.exit()
        elif event.type == KEYUP:
            player.keyUp(event.key)
    pygame.display.update()
    DISPLAYSURF.fill((0,0,255))
    player.draw(DISPLAYSURF)
    player.update()
    

