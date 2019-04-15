-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- simple touch code

local theBall = display.newImageRect( "assets/ball.png", 100, 100)
theBall.x = 150
theBall.y = 100
theBall.id = "ball 2 object"
 
local function onBallTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

theBall:addEventListener( "touch", onBallTouched )

-- Comprehensive touch code

local theBall2 = display.newImageRect( "assets/ball 2.png", 100, 100 )
theBall2.x = 150
theBall2.y = 200
theBall2.id = "ball object"
 
function theBall:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

theBall2:addEventListener( "touch", theBall )