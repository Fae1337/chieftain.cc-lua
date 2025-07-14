hook.Add("HUDPaint", "CustomWatermark", function()
    local scrW, scrH = ScrW(), ScrH()

    local steamName = LocalPlayer():Nick()
    local fps = math.Round(1 / FrameTime())
    local ping = LocalPlayer():Ping()
    local serverIP = game.GetIPAddress() or "N/A"

    local timeStr = os.date("%H:%M:%S")

    local prefix = "Chieftain.cc"
    local rest = string.format(" | %s | FPS: %d | Ping: %d ms | Time: %s", steamName, fps, ping, serverIP, timeStr)

    surface.SetFont("Trebuchet24")
    local prefixW, prefixH = surface.GetTextSize(prefix)
    local restW, restH = surface.GetTextSize(rest)
    local totalW = prefixW + restW

    surface.SetDrawColor(0, 0, 0, 235)
    surface.DrawRect(scrW - totalW - 24, 5, totalW + 16, prefixH + 5)

    -- Рисуем зелёный префикс
    draw.SimpleText(prefix, "Trebuchet24", scrW - totalW - 16, 8, Color(50, 205, 50, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    -- Рисуем остальной текст белым
    draw.SimpleText(rest, "Trebuchet24", scrW - totalW - 16 + prefixW, 8, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
end)
