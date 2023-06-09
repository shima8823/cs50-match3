--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

	self.shiny = false

	if math.random(1, 10) <= 4 then 
		self.shiny = true
	end
end

function Tile:render(x, y, opacity)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, opacity)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, opacity)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

	if self.shiny then 
		if 0.7 <= opacity and opacity <= 1 then 
			opacity = 0.7
		end
		love.graphics.setColor(255, 255, 255, opacity)
		love.graphics.rectangle("fill", self.x + x + 8, self.y + y + 8, 16, 16)
	end
end