local character, super = Class(PartyMember, "kris")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Kris"

    -- Actor (handles overworld/battle sprites)
    self:setActor("kris")
    self:setLightActor("kris_lw")

    -- Display level (saved to the save file)
    self.level = 3
    -- Default title / class (saved to the save file)
    if Game.chapter == 1 then
        self.title = "Leader\nCommands the party\nwith various ACTs."
    else
        self.title = "Tactician\nCommands the party\nby ACTs. Sometimes."
    end

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2
    -- The color of this character's soul (optional, defaults to red)
    self.soul_color = {1, 0, 0}

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = false

    -- Whether the party member can use their X-Action
    self.has_xact = true
    -- X-Action name (displayed in this character's spell menu)
    self.xact_name = "K-Action"

    -- Current health (saved to the save file)
    if Game.chapter == 1 then
        self.health = 130
    else
        self.health = 120
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 1 then
        self.stats = {
            health = 130,
            attack = 10,
            defense = 5,
            magic = 0
        }
    else
        self.stats = {
            health = 120,
            attack = 12,
            defense = 2,
            magic = 0
        }
    end

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)
    self:setWeapon("plastic_club")
    self:setArmor(1, "dealmaker")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {0, 1, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.5, 1, 1}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {0, 162/255, 232/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0, 0, 1}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0.5, 1, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/kris/head"
    -- Path to head icons used in battle
    self.head_icons = "party/kris/icon"
    -- Name sprite (TODO: optional)
    self.name_sprite = "party/kris/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = {2, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil
end

function character:onLevelUp(level)
    -- TODO: Maybe allow chapter 1 levelups?
    if Game.chapter == 1 then return end

    self:increaseStat("health", 2, 160)
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
    end
end

function character:getTitle()
    if Game:getFlag("minikris") then
        return "LV"..self.level.." Moss Vessel\nTemporary body\nwith human SOUL."
    else
        return "LV"..self.level.." "..self.title
    end
end

function character:onPowerSelect(menu)
    if Utils.random() <= 0.03 then
        menu.kris_dog = true
    else
        menu.kris_dog = false
    end
end

function character:drawPowerStat(index, x, y, menu)    
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/smile")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Creativity", x, y, 0, 0.8, 1)
        love.graphics.print(5, x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/ring")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Has BF/GF", x, y, 0, 1, 1)
        love.graphics.print("No", x+130, y)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        if Game.chapter >= 2 then
            love.graphics.draw(icon, x+110, y+6, 0, 2, 2)
        end
        return true
    end
end

function character:onTurnStart(battler)
    if self:checkWeapon("spatula") and not Game:getFlag("minikris") then
        self:heal(20)
    end
    if self:checkArmor("angel_plush") and not Game:getFlag("minikris") then
        self:heal(20)
    end
end

return character