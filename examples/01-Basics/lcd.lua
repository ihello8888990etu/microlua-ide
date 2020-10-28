-- LCD Example
--
-- Note: To run this example you will need a LCD Shield for your OpenMV Cam.
--
-- The LCD Shield allows you to view your OpenMV Cam's frame buffer on the go.



sensor.reset()                       -- Reset and initialize the sensor.
sensor.set_pixformat(sensor.RGB565)  -- Set pixel format to RGB565 (or GRAYSCALE)
sensor.set_framesize(sensor.QVGA)    -- Set frame size to QVGA (320x240)
times = 2000
sensor.skip_frames( times )          -- Wait for settings take effect.
clock = board.sysdev("clock")        -- Create a clock object to track the FPS.
lcd = board.sysdev("lcd")            --
lcd:init()
while true do
    clock:tick()                     -- Update the FPS clock.
    img = sensor.snapshot()          -- Take a picture and return the image.
    lcd:display(img)
    --print(clock:fps())
end
