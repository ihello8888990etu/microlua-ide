-- Timer Control Example
--
-- This example shows how to use a timer for callbacks.


function tick(param)                     -- we will receive the timer object when being called

   if param == nil then
      print("param is nil")
   else
      print("param is :"..param)
   end


end


timer = board.sysdev("timer1")              -- create a timer object using

hello = "helloword"
timer:start(1000,tick)
board.delay(5000)
timer:stop()

timer:start(1000,tick,hello)
while true do
    board.delay(1000)
end
