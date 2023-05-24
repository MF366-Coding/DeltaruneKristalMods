-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(HealItem, "star_candy")

function item:init()
    super.init(self)

    -- Display name
    self.name = "StarCandy"
    -- Name displayed when used in battle (optional)
    self.use_name = "STAR CANDY"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Heal\neveryone"
    -- Shop description
    self.shop = "Party healing"
    -- Menu description
    self.description = "Looks like a star. A sweet one.\nHeals the party +25HP"

    -- Amount healed (HealItem variable)
    self.heal_amount = 25

    -- Default shop price (sell price is halved)
    self.price = 150
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "party"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = "star_flavor"
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
        susie = "It's sour!",
        ralsei = "It's salty...?",
        noelle = "Kinda decent..."
    }
end

return item