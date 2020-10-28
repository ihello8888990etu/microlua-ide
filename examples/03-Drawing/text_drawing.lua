-- Text Drawing
--
-- This example shows off drawing text on the OpenMV Cam.



sensor.reset()
sensor.set_pixformat(sensor.RGB565)   -- or GRAYSCALE...
sensor.set_framesize(sensor.QVGA)     -- or QQVGA...
sensor.skip_frames(2000)              -- time = 2000
clock = board.sysdev("clock")


while true do
    clock:tick()
    img = sensor.snapshot()

     for i = 1,10 do
        x = (board.rng() % (2*img:width())) - (img:width()/2)
        y = (board.rng() % (2*img:height())) - (img:height()/2)
        r = (board.rng() % 127) + 128
        g = (board.rng() % 127) + 128
        b = (board.rng() % 127) + 128


        -- Character and string rotation can be done at 0, 90, 180, 270, and etc. degrees.
        color = {r, g, b} scale = 2 mono_space = false
        char_rotation = 0  char_hmirror = false char_vflip = false
        string_rotation = 0 string_hmirror = false  string_vflip = false

        img:draw_string({x, y}, "Hello World!", color , scale , mono_space ,
                        char_rotation , char_hmirror , char_vflip ,
                        string_rotation , string_hmirror , string_vflip )
    end

   print(clock:fps())

end
