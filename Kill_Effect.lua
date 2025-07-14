gameevent.Listen("entity_killed")

hook.Add("entity_killed", "45645745", function(data)
    local me = LocalPlayer()
    if not IsValid(me) then return end

    local victim = Entity(data.entindex_killed)
    local attacker = Entity(data.entindex_attacker)

    if not IsValid(victim) or not IsValid(attacker) then return end

    if attacker == me and attacker ~= victim and (victim:IsPlayer() or victim:IsBot()) then

        local vpos = victim:GetPos()
        local effectdata2 = EffectData()

        local headBone = victim:LookupBone("ValveBiped.Bip01_Head1")

        if headBone == nil then
            effectdata2:SetOrigin(vpos)
        else
            effectdata2:SetOrigin(victim:GetBonePosition(headBone))
        end

        effectdata2:SetMagnitude(5)
        effectdata2:SetScale(3)

        util.Effect("Explosion", effectdata2)-- Вместо "Explosion ставим свой эффект(таблица ниже)"
    end
end)
