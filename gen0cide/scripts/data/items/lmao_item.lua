-- Create a Item
local item, super = Class(Item, "lmao_item")

function item:init()
    super.init(self)

    -- Display name
    self.name = "ULTRA HEALING"
    -- Name displayed when used in battle (optional)
    self.use_name = "GARBAGE"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Get dunked on!!!"
    -- Shop description
    self.shop = "BEST TIME EVER!!\nUEH EH EH!"
    -- Menu description
    self.description = "Get dunked on!!!"

    -- Default shop price (sell price is halved)
    self.price = 100
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "none"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {}
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions (key = party member id)
    self.reactions = {
        susie = "Really, Kris?!",
        ralsei = "Kris, what's that??",
        noelle = "...no...",
    }
end

return item