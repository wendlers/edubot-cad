pulse1=0
du=0
gpio.mode(8,gpio.INT)
function pin1cb(level)
du=tmr.now()-pulse1
pulse1=tmr.now()
if level == 1 then gpio.trig(1, "down") else gpio.trig(1, "up") end
end

gpio.trig(1, "down",pin1cb)
