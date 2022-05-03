#!/usr/bin/env lua

local cw = 380
local ch = 640

local Player1 = {}
local Player2 = {}

local tumble = love.audio.newSource('snd/dice.ogg', 'stream')
tumble:setLooping(false)

Player1.color = {52/255, 52/255, 133/255 }
Player2.color = {52/255, 52/255, 133/255 }

function love.load()
    love.window.setTitle('Game of Dice')
    love.window.setMode(cw,ch,{resizable=false,
                               vsync=false})
    love.graphics.setBackgroundColor(
               25/255,125/255,75/277)

    Player1.img = love.graphics.newImage('img/Die1.png')

    math.randomseed(os.time())
end


function love.draw()
	love.graphics.draw(Player1.img,cw/2,ch/2,0,0.04,0.04,0,0)
end

function love.mousereleased()
    Player1.dice = math.random(1,6)
	Player1.img = love.graphics.newImage(
        string.format('img/Die%d.png'), Player1.dice)

    love.audio.play(tumble)
end
