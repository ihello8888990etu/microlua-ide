-- Vertical Flip - Horizontal Mirror - Transpose
--
-- This example shows off how to vertically flip, horizontally mirror, or
-- transpose an image. Note that:
--
-- vflip=False, hmirror=False, transpose=False -> 0 degree rotation
-- vflip=True,  hmirror=False, transpose=True  -> 90 degree rotation
-- vflip=True,  hmirror=True,  transpose=False -> 180 degree rotation
-- vflip=False, hmirror=True,  transpose=True  -> 270 degree rotation



sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.skip_frames(2000)
clock = board.sysdev("clock")

mills = board.millis()
counter = 0

while true do
    clock:tick()

    img = sensor.snapshot()
	if ( (counter/2)%2 == 1 )then 
	    vflip = true;
	else
	    vflip = false;
	end
	if ( (counter/4)%2 == 1 )then 
	    hmirror = true;
	else
	    hmirror = false;
	end
	if ( (counter/8)%2 == 1 )then 
	    transpose = true;
	else
	    transpose = false;
	end
    
	img:replace(vflip, hmirror,  transpose)

    if (board.millis() > (mills + 1000)) then
        mills = board.millis()
        counter = counter + 1
	end

    print(clock:fps())
end