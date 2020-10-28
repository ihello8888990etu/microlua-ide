-- RTC Example
--
-- This example shows how to use the RTC.
--

rtc = board.sysdev("rtc")
rtc:datetime({2013, 7, 9, 2, 0, 0, 0})

while true do
    print(rtc)
    board.delay(1000)
end
