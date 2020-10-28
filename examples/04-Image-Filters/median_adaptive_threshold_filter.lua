-- Median Adaptive Threshold Filter Example
--
-- This example shows off median filtering with adaptive thresholding.
-- When median(threshold=True) the median() method adaptive thresholds the image
-- by comparing the median of the pixels around a pixel, minus an offset, with that pixel.


sensor.reset()                      -- Initialize the camera sensor.
sensor.set_pixformat(sensor.RGB565) -- or sensor.GRAYSCALE
sensor.set_framesize(sensor.QQVGA)  -- or sensor.QVGA (or others)
sensor.skip_frames(2000)            -- Let new settings take affect.
clock = board.sysdev("clock")               -- Tracks FPS.

while true do
    clock:tick()                    -- Track elapsed milliseconds between snapshots().
    img = sensor.snapshot()         -- Take a picture and return the image.

    -- The first argument to the median filter is the kernel size, it can be
    -- either 0, 1, or 2 for a 1x1, 3x3, or 5x5 kernel respectively. The second
    -- argument "percentile" is the percentile number to choose from the NxN
    -- neighborhood. 0.5 is the median, 0.25 is the lower quartile, and 0.75
    -- would be the upper quartile.
	percentile=0.5  threshold=true offset=5 invert=true
    img:median(1, percentile, threshold, offset, invert)

    print(clock:fps()) -- Note: Your OpenMV Cam runs about half as fast while
    -- connected to your computer. The FPS should increase once disconnected.
end