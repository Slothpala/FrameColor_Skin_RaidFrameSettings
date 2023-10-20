local info = {
    moduleName = "RaidFrameSettings",
    color1 = {
        name = "Main",
        desc = "",
    },
    color2 = {
        name = "Background",
        desc = "",
    },
}

local module = FrameColor_CreateSkinModule(info)

function module:OnEnable()
    local main_color = self:GetColor1()
    local bg_color = self:GetColor2()
    self:Recolor(main_color, bg_color, 1)
end

function module:OnDisable()
    local color = {r=1,g=1,b=1,a=1}
    self:Recolor(color, color, 0)
end

function module:Recolor(main_color, bg_color, desaturation)
    local RaidFrameSettingsOptions = RaidFrameSettingsOptions
    for _, texture in pairs({
        RaidFrameSettingsOptions.NineSlice.TopEdge,
        RaidFrameSettingsOptions.NineSlice.BottomEdge,
        RaidFrameSettingsOptions.NineSlice.TopRightCorner,
        RaidFrameSettingsOptions.NineSlice.TopLeftCorner,
        RaidFrameSettingsOptions.NineSlice.RightEdge,
        RaidFrameSettingsOptions.NineSlice.LeftEdge,
        RaidFrameSettingsOptions.NineSlice.BottomRightCorner,
        RaidFrameSettingsOptions.NineSlice.BottomLeftCorner,  
    }) do
        texture:SetDesaturation(desaturation)
        texture:SetVertexColor(main_color.r,main_color.g,main_color.b) 
    end
    local Bg = RaidFrameSettingsOptionsBg
    Bg:SetDesaturation(desaturation)
    Bg:SetVertexColor(bg_color.r, bg_color.g, bg_color.b, bg_color.a)
end

