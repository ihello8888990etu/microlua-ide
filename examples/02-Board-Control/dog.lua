-- dog Control Example
--





dog = board.sysdev("dog")


dog:start(1000)
board.delay(500)
dog:stop()
dog:start(2000)
while true do
    board.delay(1000)
    dog:feed()
end
