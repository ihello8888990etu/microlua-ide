-- Cartoon Filter
--
-- This example shows off a simple cartoon filter on images. The cartoon
-- filter works by joining similar pixel areas of an image and replacing
-- the pixels in those areas with the area mean.


sensor.reset()
sensor.set_pixformat(sensor.RGB565)  -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)    -- or QQVGA...
sensor.skip_frames(2000)
clock = board.sysdev("clock")

while true do
    clock:tick()

    -- seed_threshold controls the maximum area growth of a colored
    -- region. Making this larger will merge more pixels.

    -- floating_threshold controls the maximum pixel-to-pixel difference
    -- when growing a region. Settings this very high will quickly combine
    -- all pixels in the image. You should keep this small.

    -- cartoon() will grow regions while both thresholds are statisfied...
    img = sensor.snapshot()

    seed_threshold=0.05 floating_thresholds=0.05
    img:cartoon(seed_threshold, floating_thresholds)

    print(clock:fps())
end
