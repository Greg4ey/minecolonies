function printOrders()
    term.clear()
    for k, v in ipairs(colony.getWorkOrders()) do
        if v.isClaimed() then
            term.setTextColor(colors.green)
        else
            term.setTextColor(colors.white)
        end
        print(v.buildingName .. " - " .. v.workOrderType)
    end
end

while true do
    printOrders()
    sleep(10)
end