-- Histogram Equalization
--
-- This example shows off how to use histogram equalization to improve
-- the contrast in the image.


sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QQVGA)
sensor.skip_frames(2000)
clock = board.sysdev("clock")

while true do
    clock:tick()

    img = sensor.snapshot()
	img:histeq()

    print(clock:fps())
end