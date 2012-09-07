class GameObject:

    def __init__(self, img, position):
        self.img = img
        self.box = self.img.get_rect()
        self.box.center = position

    def draw(self, surface):
        surface.blit(self.img, self.box.topleft)
        
