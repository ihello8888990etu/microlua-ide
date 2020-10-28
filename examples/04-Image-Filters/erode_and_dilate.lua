-- Erode and Dilate Example
--
-- This example shows off the erode and dilate functions which you can run on
-- a binary image to remove noise. This example was originally a test but its
-- useful for showing off how these functions work.



sensor.reset()
sensor.set_framesize(sensor.QVGA)

grayscale_thres = {{170, 255}}
rgb565_thres = {{70, 100}, {-128, 127}, {-128, 127}}

while true do

    sensor.set_pixformat(sensor.GRAYSCALE)
    for i = 1,20 do
        img = sensor.snapshot()
        img:binary(grayscale_thres)
        img:erode(2)
    end
    for i = 1,20 do
        img = sensor.snapshot()
        img:binary(grayscale_thres)
        img:dilate(2)
    end

    sensor.set_pixformat(sensor.RGB565)
    for i = 1,20 do
        img = sensor.snapshot()
        img:binary(rgb565_thres)
        img:erode(2)
    end
    for i = 1,20 do
        img = sensor.snapshot()
        img:binary(rgb565_thres)
        img:dilate(2)
    end
end
