-- Arrow Drawing
--
-- This example shows off drawing arrows on the OpenMV Cam.



sensor.reset()
sensor.set_pixformat(sensor.RGB565)   -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)     -- or QQVGA...
sensor.skip_frames(2000)
clock = board.sysdev("clock")
--lcd = board.sysdev("lcd") 
--lcd:init()
while true do

    clock:tick()

    img = sensor.snapshot()

    for i = 1,10 do 
        x0 = (board.rng() % (2*img:width())) - (img:width()/2)
        y0 = (board.rng() % (2*img:height())) - (img:height()/2)
        x1 = (board.rng() % (2*img:width())) - (img:width()/2)
        y1 = (board.rng() % (2*img:height())) - (img:height()/2)
        r = (board.rng() % 127) + 128
        g = (board.rng() % 127) + 128
        b = (board.rng() % 127) + 128

		color = {r, g, b}
		size = 30
		thickness = 2
        img:draw_arrow({x0, y0, x1, y1}, color , size , thickness )
	end
    --lcd:display(img)
    print(clock:fps())
end