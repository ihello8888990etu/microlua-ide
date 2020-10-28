-- Color Binary Filter Example
--
-- This script shows off the binary image filter. You may pass binary any
-- number of thresholds to segment the image by.



sensor.reset()
sensor.set_framesize(sensor.QVGA)
sensor.set_pixformat(sensor.RGB565)
sensor.skip_frames(2000)
clock = board.sysdev("clock")

-- Use the Tools -> Machine Vision -> Threshold Edtor to pick better thresholds.
red_threshold = {{0,100},   {0,127},   {0,127}}         -- L A B
green_threshold = {{0,100},   {-128,0},   {0,127}}      -- L A B
blue_threshold = {{0,100},   {-128,127},   {-128,0}}    -- L A B

while true do

    -- Test red threshold
    for i = 1,10 do
        clock:tick()
        img = sensor.snapshot()
        img:binary(red_threshold)
        print(clock:fps())
    end

    -- Test green threshold
    for i = 1,10 do
        clock:tick()
        img = sensor.snapshot()
        img:binary(green_threshold)
        print(clock:fps())
    end

    -- Test blue threshold
    for i = 1,10 do
        clock:tick()
        img = sensor.snapshot()
        img:binary(blue_threshold)
        print(clock:fps())
    end

    -- Test not red threshold
    for i = 1,10 do
        clock:tick()
        img = sensor.snapshot()
        invert = true
        img:binary(red_threshold, invert )
        print(clock:fps())
    end

    -- Test not green threshold
    for i = 1,10 do
        clock:tick()
        img = sensor.snapshot()
        invert = true
        img:binary(green_threshold, invert )
        print(clock:fps())
    end

    -- Test not blue threshold
    for i = 1,10 do
        clock:tick()
        img = sensor.snapshot()
        invert = true
        img:binary(blue_threshold, invert )
        print(clock:fps())
    end
end
