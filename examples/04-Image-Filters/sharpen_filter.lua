-- Sharpen Filter Example
--
-- This example shows off using the laplacian filter to sharpen images.



sensor.reset() -- Initialize the camera sensor.
sensor.set_pixformat(sensor.GRAYSCALE) -- or sensor.RGB565
sensor.set_framesize(sensor.QQVGA)     -- or sensor.QVGA (or others)
sensor.skip_frames(2000)               -- Let new settings take affect.
clock = board.sysdev("clock")                  -- Tracks FPS.

while true do
    clock:tick()                       -- Track elapsed milliseconds between snapshots().
    img = sensor.snapshot()            -- Take a picture and return the image.

    -- Run the kernel on every pixel of the image.
	sharpen=true
    img:laplacian(1, sharpen)

    print(clock:fps())                 -- Note: Your OpenMV Cam runs about half as fast while
    -- connected to your computer. The FPS should increase once disconnected.
end