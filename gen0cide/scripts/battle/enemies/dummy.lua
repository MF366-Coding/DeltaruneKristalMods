local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Dummy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 1000
    self.health = 750
    -- Enemy attack (determines bullet damage)
    self.attack = 10
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 1

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 15

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Hi guys! I am Ralsei's dummy!",
        "Why do you want to beat me up?",
        "Ralsei won't be very happy about it..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 10 DF 0\n* A sad dummy.\n* Looks like Ralsei."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The dummy seems sad..",
        "* Smells like fluffy\ndummies.",
        "* The dummy is still not\nquite happy...",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* The dummy is even more\nunhappy now."

    -- Register act called "NEO Power"
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    self:registerAct("NEO POWER", "...", {"noelle"})
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Tell Story", "", {"ralsei"})
end

function Dummy:onAct(battler, name)
    if name == "NEO POWER" then
        -- Change this enemy's dialogue for 1 turn
        -- self.dialogue_override = "What did that do bruh?"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* Noelle powered herself with NEO.", 
            "* But nothing happened..."
        }

    elseif name == "Standard" then
        return "AT 10 DF 0\n* A sad dummy.\n* Looks like Ralsei."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Dummy