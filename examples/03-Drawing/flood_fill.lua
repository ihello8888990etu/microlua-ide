-- Flood Fill
--
-- This example shows off flood filling areas in the image.


sensor.reset()
sensor.set_pixformat(sensor.RGB565)     -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)       -- or QQVGA...
sensor.skip_frames(2000)                -- time = 2000
clock = board.sysdev("clock")

while true do
    clock:tick()

    -- seed_threshold controls the maximum allowed difference between
    -- the initial pixel and any filled pixels. It's important to
    -- set this such that flood fill doesn't fill the whole image.

    -- floating_threshold controls the maximum allowed difference
    -- between any two pixels. This can easily fill the whole image
    -- with even a very low threshold.

    -- flood_fill will fill pixels that both thresholds.

    -- You can invert what gets filled with "invert" and clear
    -- everything but the filled area with "clear_background".

    x = sensor.width() / 2
    y = sensor.height() / 2
    img = sensor.snapshot()
    seed_threshold=0.05 floating_thresholds=0.05
        color={255, 0, 0} invert=false clear_background=false
    img:flood_fill({x, y},
        seed_threshold, floating_thresholds,
        color, invert, clear_background)

    print(clock:fps())
end
