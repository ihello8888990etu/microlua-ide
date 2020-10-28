-- Log Polar Mapping Example
--
-- This example shows off re-projecting the image using a log polar
-- transformation. Log polar images are useful in that rotations
-- become translations in the X direction and exponential changes
-- in scale (x2, x4, etc.) become linear translations in the Y direction.



sensor.reset()                      -- Initialize the camera sensor.
sensor.set_pixformat(sensor.RGB565) -- or sensor.GRAYSCALE
sensor.set_framesize(sensor.QQVGA)  -- or sensor.QVGA (or others)
sensor.skip_frames(2000)            -- Let new settings take affect.
clock = board.sysdev("clock")               -- Tracks FPS.

while true do
    clock:tick()                    -- Track elapsed milliseconds between snapshots().
    img = sensor.snapshot()
	reverse=false
	img:logpolar(reverse)

    print(clock:fps())              -- Note: Your OpenMV Cam runs about half as fast while
    -- connected to your computer. The FPS should increase once disconnected.
end