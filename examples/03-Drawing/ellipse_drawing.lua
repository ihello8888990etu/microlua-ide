-- Ellipse Drawing
--
-- This example shows off drawing ellipses on the OpenMV Cam.


sensor.reset()
sensor.set_pixformat(sensor.RGB565) -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)   -- or QQVGA...
sensor.skip_frames( 2000 )          -- time = 2000
clock = board.sysdev("clock")

while true do
    clock:tick()

    img = sensor.snapshot()

    for i = 1,10 do
        x = (board.rng() % (2*img:width())) - (img:width()/2)
        y = (board.rng() % (2*img:height())) - (img:height()/2)
        radius_x = board.rng() % (math.max(img:height(), img:width())/2)
        radius_y = board.rng() % (math.max(img:height(), img:width())/2)
        rot = board.rng()

        r = (board.rng() % 127) + 128
        g = (board.rng() % 127) + 128
        b = (board.rng() % 127) + 128
        color = {r, g, b}
        thickness = 2
        fill = false

        img:draw_ellipse({x, y, radius_x, radius_y, rot},
                         color , thickness , fill )
    end

    print(clock:fps())
end
