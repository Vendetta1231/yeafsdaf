local currOrder = {}

AddEventHandler("str-jobs:bennys:order", function(pVehicle, pChanges)
    local model = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(pVehicle)))
    local orderId = math.random(10000000)

    if model == "NULL" then
        model = GetDisplayNameFromVehicleModel(GetEntityModel(pVehicle))
    end

    currOrder = {
        order = orderId,
        vehicle = model,
        list = pChanges,
        _hideKeys = {"list"},
    }

    TriggerEvent("player:receiveItem", "bennysorder", 1, false, currOrder)
end)

AddEventHandler("str-inventory:itemUsed", function(item, metaData)
    local meta = json.decode(metaData)
    if item == "bennysorder" then
        local VehicleClass = exports["str-vehicles"]:GetVehicleRatingClass(meta.vehicle)
        local orderData = STR.execute('str-bennys:getOrderData', meta.list, VehicleClass, meta.order, meta.vehicle)

        exports["str-ui"]:showContextMenu(orderData)
        return
    end
end)

RegisterUICallback("str-mechanics:order:view", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "" } })
   -- print(data)
end)

AddEventHandler("str-selector:selectionChanged", function(data)
    return exports["str-selector"]:getCurrentSelection(data.selectedEntity)
end)