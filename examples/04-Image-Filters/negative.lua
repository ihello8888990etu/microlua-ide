-- Negative Example
--
-- This example shows off negating the image. This is not a particularly
-- useful method but it can come in handy once in a while.



sensor.reset()                      -- Initialize the camera sensor.
sensor.set_pixformat(sensor.RGB565) -- or sensor.GRAYSCALE
sensor.set_framesize(sensor.QVGA)   -- or sensor.QQVGA (or others)
sensor.skip_frames(2000)            -- Let new settings take affect.
clock = board.sysdev("clock")               -- Tracks FPS.

while true do
    clock:tick()                    -- Track elapsed milliseconds between snapshots().
    img = sensor.snapshot()
	img:negate()

    print(clock:fps())              -- Note: Your OpenMV Cam runs about half as fast while
    -- connected to your computer. The FPS should increase once disconnected.
end