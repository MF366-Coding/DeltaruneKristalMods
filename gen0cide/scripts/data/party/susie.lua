local character, super = Class(PartyMember, "susie")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Susie"

    -- Actor (handles sprites)
    self:setActor("susie")
    self:setLightActor("susie_lw")

    -- Display level (saved to the save file)
    self.level = 3
    -- Default title / class (saved to the save file)
    self.title = "Dark Warrior\nDoes magic using\ndark energy."

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
    self.xact_name = "S-Action"

    -- Spells
    self:addSpell("rude_buster_alt")
    self:addSpell("ultra_heal")
    --self:addSpell("red_breaker")

    -- Current health (saved to the save file)
    if Game.chapter == 1 then
        self.health = 150
    else
        self.health = 10
    end

    -- Base stats (saved to the save file)
    if Game.chapter == 1 then
        self.stats = {
            health = 150,
            attack = 14,
            defense = 4,
            magic = 1
        }
    else
        self.stats = {
            health = 140,
            attack = 16,
            defense = 3,
            magic = 2
        }
    end

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/axe"

    -- Equipment (saved to the save file)
    self:setWeapon("bitten_club")
    self:setArmor(1, "jevilstail")
    if Game.chapter >= 2 then
        self:setArmor(1, "amber_card")
        self:setArmor(2, "amber_card")
    end

    -- Default light world equipment item IDs (saves current equipment)
    self.lw_weapon_default = "light/pencil"
    self.lw_armor_default = "light/bandage"

    -- Character color (for action box outline and hp bar)
    self.color = {1, 0, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = {0.8, 0.6, 0.8}
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = {234/255, 121/255, 200/255}
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = {0.5, 0, 0.5}
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 0.5, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/susie/head"
    -- Path to head icons used in battle
    self.head_icons = "party/susie/icon"
    -- Name sprite (TODO: optional)
    self.name_sprite = "party/susie/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/mash"
    -- Sound played when this character attacks
    self.attack_sound = "laz_c"
    -- Pitch of the attack sound
    self.attack_pitch = 0.9

    -- Battle position offset (optional)
    self.battle_offset = {3, 1}
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil -- Handled by getGameOverMessage for Susie
end

function character:onAttackHit(enemy, damage)
    if damage > 0 then
        Assets.playSound("snd_impact", 0.8)
        Game.battle.shake = 4
    end
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

    self:increaseStat("health", 2, 190)
    if level % 2 == 0 then
        self:increaseStat("health", 1, 190)
    end
    if level % 10 == 0 then
        self:increaseStat("attack", 1)
        self:increaseStat("magic", 1)
    end
end

function character:getGameOverMessage(main)
    return {
        "Come on,[wait:5]\nthat all you got!?",
        main.name..",[wait:5]\nget up...!"
    }
end



function character:getReaction(item, user)
    if item or user.id ~= self.id then
        return super:getReaction(self, item, user)
    else
        return "Hey!"
    end
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1 then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Rudeness", x, y)
        if Game.chapter == 2 then
            love.graphics.print("99", x+130, y)
        else
            love.graphics.print("74", x+130, y)
        end
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        if Game.chapter == 2 then
            love.graphics.print("Crudeness", x, y, 0, 0.8, 1)
            love.graphics.print("100", x+130, y)
        else
            love.graphics.print("Purple", x, y, 0, 1, 1)
            if Game:getFlag("monogang") then
                love.graphics.print("No", x+130, y)
            else
                love.graphics.print("Yes", x+130, y)
            end
        end
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        love.graphics.draw(icon, x+110, y+6, 0, 2, 2)
        return true
    end
end

function character:onTurnStart(battler)
    if self:checkArmor("angel_plush") and not Game:getFlag("minikris") then
        self:heal(20)
    end
end

return character