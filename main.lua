require "Player"
require "Level"

function love.load()
    level = Level:new()
    level:loadLevel()
    sprite = Player:new(love.graphics.newImage("mage.png"))
    
end

function love.draw()
    level:draw()
    sprite:draw()
end

function love.update(dt)
    sprite:update()
    if love.keyboard.isDown("left") then
        sprite:left()
    elseif love.keyboard.isDown("right") then
        sprite:right()
    end
end

function love.quit()
end

function love.keypressed(key, unicode)
    if key == "up" then
        sprite:up()
    end
end

function love.run()

    math.randomseed(os.time())
    math.random() math.random()

    if love.load then love.load(arg) end

    local dt = 0

    -- Main loop time.
    while true do
        -- Process events.
        if love.event then
            love.event.pump()
            for e,a,b,c,d in love.event.poll() do
                if e == "quit" then
                    if not love.quit or not love.quit() then
                        if love.audio then
                            love.audio.stop()
                        end
                        return
                    end
                end
                love.handlers[e](a,b,c,d)
            end
        end

        -- Update dt, as we'll be passing it to update
        if love.timer then
            love.timer.step()
            dt = love.timer.getDelta()
        end

        -- Call update and draw
        if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
        if love.graphics then
            love.graphics.clear()
            if love.draw then love.draw() end
        end

        if love.timer then love.timer.sleep(0.017) end
        if love.graphics then love.graphics.present() end

    end

end


