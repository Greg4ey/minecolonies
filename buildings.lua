---
--- Made for the Advanced Peripherals documentation
--- Created by Srendi - Created by Srendi - https://github.com/SirEndii
--- DateTime: 25.04.2021 20:44
--- Link: https://docs.srendi.de/peripherals/colony_integrator/
---


colony = peripheral.find("colonyIntegrator")
mon = peripheral.find("monitor")
 
function centerText(text, line, txtback, txtcolor, pos)
    monX, monY = mon.getSize()
    mon.setBackgroundColor(txtback)
    mon.setTextColor(txtcolor)
    length = string.len(text)
    dif = math.floor(monX-length)
    x = math.floor(dif/2)
    
    if pos == "head" then
        mon.setCursorPos(x+1, line)
        mon.write(text)
    elseif pos == "left" then
        mon.setCursorPos(2, line)
        mon.write(text) 
    elseif pos == "right" then
        mon.setCursorPos(monX-length, line)
        mon.write(text)
    end
end
 
function prepareMonitor() 
    mon.clear()
    mon.setTextScale(0.5)
    centerText("Buildings", 1, colors.black, colors.yellow, "head")
end
 
function printBuildings()
    row = 3
    useLeft = true
    for k, v in ipairs(colony.getBuildings()) do
        if row > 40 then
            useLeft = false
            row = 3
        end

        color = colors.white
        if v.built then
            color = colors.green
        elseif v.isWorkingOn then
            color = colors.orange
        end
        
        position = "right"
        if useLeft then
               position = "left"
        end
        centerText(v.name.. " - " .. v.type .. " " .. v.level .. "/" .. v.maxLevel, row, colors.black, color, position)     
        row = row+1
    end
end
 
prepareMonitor()
 
while true do
    printBuildings()
    sleep(10)
end