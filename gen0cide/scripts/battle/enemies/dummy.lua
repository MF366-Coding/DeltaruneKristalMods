local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Dummy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 500
    self.health = 400
    -- Enemy attack (determines bullet damage)
    self.attack = 9
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 3

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "Leave me alone..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "* [color:red] FINISH IT! [color:reset]"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* It doesn't matter...\nNot anymore..."
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* [color:red] DETERMINATION. [color:reset]"

    -- Register act called "NEO Power"
    -- self:registerAct("NEO POWER", "...", {"noelle"})
    
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Tell Story", "", {"ralsei"})
end

function Dummy:onAct(battler, name)
    if name == "Standard" then
        return "* Nothing happened."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Dummy