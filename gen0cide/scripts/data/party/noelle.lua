local character, super = Class(PartyMember, "noelle")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Noelle"

    -- Actor (handles sprites)
    self:setActor("noelle")
    self:setLightActor("noelle_lw")

    -- Display level (saved to the save file)
    self.level = 2
    -- Default title / class (saved to the save file)
    self.title = "Dustcaster\nMight be able to\nuse some cool moves."

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 1
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 1, 1}

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "N-Action"

    -- Spells
    self:addSpell("heal_prayer_alt")
    self:addSpell("sleep_mist")
    self:addSpell("cold_shock")
    --self:addSpell("calm_breath")

    -- Current health (saved to the save file)
    if Game.chapter == 1 then
        self.health = 110
    else
        self.health = 90
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 1 then
        self.stats = {
            health = 110,
            attack = 3,
            defense = 3,
            magic = 11
        }
    else
        self.stats = {
            health = 90,
            attack = 6,
            defense = 1,
            magic = 11
        }
    end

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/ring"

    -- Equipment (saved to the save file)
    self:setWeapon("motionring")
    self:setArmor(1, "silver_watch")
    if Game.chapter >= 2 then
        self:setArmor(2, "royalpin")
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {1, 1, 0}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {1, 1, 0.3}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {1, 1, 153/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {1, 1, 0}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 1, 0.5}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/noelle/head"
    -- Path to head icons used in battle
    self.head_icons = "party/noelle/icon"
    -- Name sprite (TODO: optional)
    self.name_sprite = "party/noelle/name"

    -- Effect shown above enemy after attacking it
    if self:checkArmor("kyouko") then
        self.attack_sprite = "effects/attack/slap_nk"
    else
        self.attack_sprite = "effects/attack/slap_n"
    end
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1.5

    -- Battle position offset (optional)
    self.battle_offset = {0, 0}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = {
        "Kris...?\nSusie...?\nAre you alright...?",
        "Don't give up![wait:5]\nI don't want to be\nalone in the dark."
    }

    -- Character flags (saved to the save file)
    self.flags = {
        ["iceshocks_used"] = 0,
        ["boldness"] = -12
    }
end

--function character:canEquip()
--    if self:checkArmor("kyouko") then
--        self.attack_sprite = "effects/attack/slap_nk"
--    else
--        self.attack_sprite = "effects/attack/slap_n"
--    end
--    return true
--end

function character:getReaction(item, user)
    if self:checkArmor("kyouko") then
        self.attack_sprite = "effects/attack/slap_nk"
    else
        self.attack_sprite = "effects/attack/slap_n"
    end
    return super:getReaction(self, item, user)
end

function character:getAttackSprite()
    if self:checkArmor("kyouko") then
        self.attack_sprite = "effects/attack/slap_nk"
    else
        self.attack_sprite = "effects/attack/slap_n"
    end
    return super:getAttackSprite(self)
end

function character:getTitle()
    if self:checkArmor("kyouko") then
        return "LV"..self.level.." Spider Owner\nUses help from\nspider to attack."
    elseif Game:getFlag("monogang") then
        return "LV"..self.level.." Monochrome\nMonster without\nmagic."
    else
        return "LV"..self.level.." "..self.title
    end
end

function character:onLevelUp(level)
    -- TODO: Maybe allow chapter 1 levelups?
    if Game.chapter == 1 then return end

    self:increaseStat("health", 4, 166)
    if level % 4 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Holiness", x, y)
        local coldness = math.ceil((self:getStat("magic") * 5.5) + (self:getStat("defense") * 2))
        love.graphics.print(coldness, x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/snow")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Coldness", x, y)
        local coldness = Utils.clamp((self:getStat("defense") *2) + (self:getStat("magic") * 3) - (self:getStat("attack")), 1, 99)
        if Game:getFlag("monogang") then
            love.graphics.print("0", x+130, y)
        else
            love.graphics.print(coldness, x+130, y)
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        if self:checkArmor("kyouko") then
            local icon = Assets.getTexture("kyoukoguts")
            love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        end
        love.graphics.print("Guts:", x, y)
        return true
    end
end

function character:onTurnStart(battler)
    if self:checkArmor("angel_plush") and not Game:getFlag("minikris") then
        self:heal(20)
    end
end

return character