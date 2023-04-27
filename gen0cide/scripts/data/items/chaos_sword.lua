-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(Item, "chaos_knife")

function item:init()
    super.init(self)

    -- Display name
    self.name = "CHAOS SWORD"
    -- Name displayed when used in battle (optional)
    self.use_name = "Chaos Sword"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = ""

    -- Battle description
    self.effect = "IT'S JUST A LITTLE CHAOS!"
    -- Shop description
    self.shop = "AN ACTUAL CHAOS BOMB!!!"
    -- Menu description
    self.description = "IT'S JUST A LITTLE CHAOS!\nUEH EH EH EH!!!"

    -- Default shop price (sell price is halved)
    self.price = 200
    -- Whether the item can be sold
    self.can_sell = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 7,
        magic = 10
    }

    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "FUN!!!!!"
    self.bonus_icon = ""

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        noelle=false,
        kris=true,
        susie=false,
        ralsei=false
    }

    -- Character reactions (key = party member id)
    self.reactions = {
        kris="DETERMINATION"
    }
end

return item