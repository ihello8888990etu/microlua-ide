-- Grayscale Binary Filter Example
--
-- This script shows off the binary image filter. You may pass binary any
-- number of thresholds to segment the image by.



sensor.reset()
sensor.set_framesize(sensor.QVGA)
sensor.set_pixformat(sensor.GRAYSCALE)
sensor.skip_frames(2000)
clock = board.sysdev("clock")

low_threshold = {{0, 50}}
high_threshold = {{205, 255}}

while true do

    -- Test low threshold
	for i =1,100 do
        clock:tick()
        img = sensor.snapshot()
        img:binary(low_threshold)
        print(clock:fps())
	end

    -- Test high threshold
    for i =1,100 do
        clock:tick()
        img = sensor.snapshot()
        img:binary(high_threshold)
        print(clock:fps())
	end

    -- Test not low threshold
    for i =1,100 do
        clock:tick()
        img = sensor.snapshot()
		invert = true
        img:binary(low_threshold, invert )
        print(clock:fps())
	end

    -- Test not high threshold
    for i =1,100 do
        clock:tick()
        img = sensor.snapshot()
		invert = true
        img:binary(high_threshold, invert )
        print(clock:fps())
	end
end