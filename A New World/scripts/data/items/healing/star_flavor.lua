-- Instead of Item, create a HealItem, a convenient class for consumable healing items
local item, super = Class(HealItem, "star_flavor")

function item:init()
    super.init(self)

    -- Display name
    self.name = "StarFlavor"
    -- Name displayed when used in battle (optional)
    self.use_name = "STAR FLAVOR"

    -- Item type (item, key, weapon, armor)
    self.type = "item"
    -- Item icon (for equipment)
    self.icon = nil

    -- Battle description
    self.effect = "Pieces\nof a star."
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "The star left its flavor???\nHeals a party member +40HP"

    -- Amount healed (HealItem variable)
    self.heal_amount = 40

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
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
        susie = "What the hell is this?",
        ralsei = "Hmmm... Thanks, Kris...",
        noelle = "Kris, why...?!"
    }
end

return item