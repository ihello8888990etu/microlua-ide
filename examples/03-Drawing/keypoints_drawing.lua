-- Keypoints Drawing
--
-- This example shows off drawing keypoints on the OpenMV Cam. Usually you call draw_keypoints()
-- on a keypoints object but you can also call it on a list of 3-value tuples...


sensor.reset()
sensor.set_pixformat(sensor.RGB565)   -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)     -- or QQVGA...
sensor.skip_frames(2000)              -- time = 2000
clock = board.sysdev("clock")

while true do
    clock:tick()

    img = sensor.snapshot()
    points = {}

    for i = 1,10 do
        x = (board.rng() % (2*img:width())) - (img:width()/2)
        y = (board.rng() % (2*img:height())) - (img:height()/2)
        rot = board.rng() % 360
        points[i] = {x, y, rot};

    end

    r = (board.rng() % 127) + 128
    g = (board.rng() % 127) + 128
    b = (board.rng() % 127) + 128

    color = {r, g, b}
    size = 20 thickness = 2 fill = false
    -- This method draws a keypoints object or a list of (x, y, rot) tuples...
    img:draw_keypoints(points, color , size , thickness , fill )

    print(clock:fps())
end
