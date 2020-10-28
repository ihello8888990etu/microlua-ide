-- Circle Drawing
--
-- This example shows off drawing circles on the OpenMV Cam.



sensor.reset()
sensor.set_pixformat(sensor.RGB565) -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)   -- or VGA...
sensor.skip_frames(2000)
clock = board.sysdev("clock")
lcd = board.sysdev("lcd") 
lcd:init();
while true do 
    clock:tick()

    img = sensor.snapshot()

    for i =1,10 do
        x = (board.rng() % (2*img:width())) - (img:width()/2)
        y = (board.rng() % (2*img:height())) - (img:height()/2)
        radius = board.rng() % (math.max(img:height(), img:width())/2)

        r = (board.rng() % 127) + 128
        g = (board.rng() % 127) + 128
        b = (board.rng() % 127) + 128
        thickness = 2
        fill = false

       
        img:draw_circle({x, y, radius}, {r, g, b}, thickness , fill )
	end
	lcd:display(img);

    print(clock:fps())
end
