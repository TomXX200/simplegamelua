-- variables for the circle and score text
function love.load()
    circle = {}
    circle.x = 385
    circle.y = 250
    circle.radius = 50
    
    score = 0
    timer = 0
    
    gameFont = love.graphics.newFont(40)

end

-- drawing the circle and setting the color along with the text
function love.draw()
    love.graphics.setColor(5, 5, 3)
    love.graphics.circle("line", circle.x, circle.y, circle.radius)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 380, 5)
end

-- this section allows the user to get points for clicking the circle hence the equation below
function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, circle.x, circle.y)
        if mouseToTarget < circle.radius then
            score = score + 1
            circle.x = math.random(circle.radius, love.graphics.getWidth())
            circle.y = math.random(circle.radius, love.graphics.getWidth())
            circle.radius = math.random(10, 100)
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt( (x2 - x1)^2 + (y2 - y1)^2 )
end


