-- Grayscale Light Removal
--
-- This example shows off how to remove bright lights from the image.
-- You can do this using the binary() method with the "zero=" argument.
--
-- Removing bright lights from the image allows you to now use
-- histeq() on the image without outliers from oversaturated
-- parts of the image breaking the algorithm...



sensor.reset()                         -- Initialize the camera sensor.
sensor.set_pixformat(sensor.GRAYSCALE) -- or sensor.RGB565
sensor.set_framesize(sensor.QQVGA)     -- or sensor.QVGA (or others)
sensor.skip_frames(2000)               -- Let new settings take affect.
clock = board.sysdev("clock")                  -- Tracks FPS.

thresholds = {{220, 255}}

while true do
    clock:tick()                       -- Track elapsed milliseconds between snapshots().
    img = sensor.snapshot()
	invert=false zero=true
	img:binary(thresholds, invert, zero)

    print(clock:fps())                 -- Note: Your OpenMV Cam runs about half as fast while
    -- connected to your computer. The FPS should increase once disconnected.
end