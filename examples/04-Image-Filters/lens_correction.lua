-- Lens Correction
--
-- This example shows off how to use the lens correction method to fix lens
-- distortion in an image. You need to do this for qrcode / barcode / data matrix
-- detection. Increase the strength below until lines are straight in the view.
-- Zoom in (higher) or out (lower) until you see enough of the image.



sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.skip_frames(2000)
clock = board.sysdev("clock")

while true do
    clock:tick()

    img = sensor.snapshot()
	strength = 1.8  zoom = 1.0
	img:lens_corr(strength , zoom )

    print(clock:fps())
end