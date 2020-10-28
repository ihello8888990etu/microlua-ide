-- CPU frequency scaling example.
--
-- This example shows how to use the cpufreq module to change the CPU frequency on the fly.

sensor.reset()                           -- Reset and initialize the sensor.
sensor.set_pixformat(sensor.RGB565)      -- Set pixel format to RGB565 (or GRAYSCALE)
sensor.set_framesize(sensor.QVGA)        -- Set frame size to QVGA (320x240)
time = 2000
sensor.skip_frames(time)                 -- Wait for settings take effect.
clock = board.sysdev("clock")            -- Create a clock object to track the FPS.
cpufreq = board.sysdev("cpufreq")


print("\nFrequency Scaling Test...")
for k,v in ipairs(cpufreq:get_supported_frequencies()) do
    cpufreq:set_frequency(v)
    clock:reset()
    --do something
    board.millis(100)
    freqs = cpufreq:get_current_frequencies()
    print(string.format("CPU Freq:%dMHz  FPS:%.2f", freqs[1], clock:fps()))
end

