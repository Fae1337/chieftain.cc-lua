hook.Add("HUDPaint", "CustomWatermark", function()
    surface.CreateFont("Trebuchet20", {
        font = "Trebuchet MS",
        size = 25,-- свой размер
        weight = 500,
    })

    local scrW, scrH = ScrW(), ScrH()

    local steamName = LocalPlayer():Nick()
    local fps = math.Round(1 / FrameTime())
    local ping = LocalPlayer():Ping()
    -- local serverIP = game.GetIPAddress() --

    local timeStr = os.date("%H:%M:%S")

    local prefix = "Chieftain.cc"
    local rest = string.format(" | %s | FPS: %d | %d ms | %s", steamName, fps, ping, timeStr)

    surface.SetFont("Trebuchet20")
    local prefixW, prefixH = surface.GetTextSize(prefix)
    local restW, restH = surface.GetTextSize(rest)
    local totalW = prefixW + restW

    surface.SetDrawColor(0, 0, 0, 235)
    surface.DrawRect(scrW - totalW - 24, 5, totalW + 16, prefixH + 5)

    draw.SimpleText(prefix, "Trebuchet20", scrW - totalW - 16, 8, Color(50, 205, 50, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(rest, "Trebuchet20", scrW - totalW - 16 + prefixW, 8, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end)
