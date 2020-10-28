-- Mean Filter Example
--
-- This example shows off mean filtering. Mean filtering is your standard average
-- filter in a NxN neighborhood. Mean filtering removes noise in the image by
-- bluring everything. But, it's the fastest kernel filter operation.



sensor.reset()                      -- Initialize the camera sensor.
sensor.set_pixformat(sensor.RGB565) -- or sensor.GRAYSCALE
sensor.set_framesize(sensor.QQVGA)  -- or sensor.QVGA (or others)
sensor.skip_frames(2000)            -- Let new settings take affect.
clock = board.sysdev("clock")               -- Tracks FPS.

while true do
    clock:tick()                    -- Track elapsed milliseconds between snapshots().
    img = sensor.snapshot()         -- Take a picture and return the image.

    -- The only argument is the kernel size. N coresponds to a ((N*2)+1)^2
    -- kernel size. E.g. 1 == 3x3 kernel, 2 == 5x5 kernel, etc. Note: You
    -- shouldn't ever need to use a value bigger than 2.
    img.mean(1)

    print(clock:fps())              -- Note: Your OpenMV Cam runs about half as fast while
    -- connected to your computer. The FPS should increase once disconnected.
end