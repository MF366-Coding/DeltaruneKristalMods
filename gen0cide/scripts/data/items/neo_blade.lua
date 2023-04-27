-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(Item, "neo_blade")

function item:init()
    super.init(self)

    -- Display name
    self.name = "NEO Blade"
    -- Name displayed when used in battle (optional)
    self.use_name = "NEO Blade"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = ""

    -- Battle description
    self.effect = "A weird blade that smiles."
    -- Shop description
    self.shop = "DETERMINATION"
    -- Menu description
    self.description = "A weird blade you got from defeating Spamton NEO.\nYou can feel it smiling in your hands."

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 40,
        magic = 1
    }

    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "The Power of -NEO-"
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
        kris = "DETERMINATION"
    }
end

return item