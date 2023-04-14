local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Dummy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 48784154836813614
    self.health = 16517327624
    -- Enemy attack (determines bullet damage)
    self.attack = 1000
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 1000000000000000000000000000000

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 5

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Die already!",
        "No, I am not just a dummy!",
        "I am your worst nightmare......"
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT infinite??? DF 0\n* Deadlier than it looks\n* Your worst nightmare..."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The dummy gives you a creepy\nsmile.",
        "* The power of death is\nin the air.",
        "* Smells like nightmares.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The dummy is furious."

    self:registerAct("Check", "", {"noelle"})
    -- Register act called "NEO Power"
    self:registerAct("...", "...", {"noelle"})
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Tell Story", "", {"ralsei"})
end

function Dummy:onAct(battler, name)
    if name == "..." then
        -- Change this enemy's dialogue for 1 turn
        -- self.dialogue_override = "What did that do bruh?"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* Nothing happened.",
            "* Just like when you\nstole HIS soul."
        }

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        -- self:addMercy(50)
        -- Text for any other character (like Noelle)
        -- return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        return "* Nothing happened."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Dummy