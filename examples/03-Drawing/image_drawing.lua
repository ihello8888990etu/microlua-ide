-- Draw Image Example
--
-- This example shows off how to draw images in the frame buffer.


sensor.reset()
sensor.set_pixformat(sensor.RGB565) -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)   -- or QQVGA...
sensor.skip_frames(2000)            -- 2000
clock = board.sysdev("clock")

while true do
    clock:tick()

    img = sensor.snapshot()
    small_img = img:mean_pooled(4, 4) -- Makes a copy.

    x = (img:width()/2)-(small_img:width()/2)
    y = (img:height()/2)-(small_img:height()/2)
    -- Draws an image in the frame buffer.Pass an optional
    -- mask image to control what pixels are drawn.
    x_scale=1 y_scale=1
    img:draw_image(small_img, {x, y}, x_scale, y_scale)

    print(clock:fps())
end
