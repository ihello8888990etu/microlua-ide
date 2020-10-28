-- Hello World Example
--
-- Welcome to the OpenMV IDE! Click on the green run arrow button below to run the script!



sensor.reset()                       -- Reset and initialize the sensor.
sensor.set_pixformat(sensor.RGB565)  -- Set pixel format to RGB565 (or GRAYSCALE)
sensor.set_framesize(sensor.QVGA)    -- Set frame size to QVGA (320x240)
times = 2000
sensor.skip_frames( times )          -- Wait for settings take effect.              
clock = board.sysdev("clock")                -- Create a clock object to track the FPS.
                                     --
while true do
    clock:tick()                     -- Update the FPS clock.
    img = sensor.snapshot()          -- Take a picture and return the image.
    print(clock:fps())               -- Note: OpenMV Cam runs about half as fast when connected
end                                  -- to the IDE. The FPS should increase once disconnected.
