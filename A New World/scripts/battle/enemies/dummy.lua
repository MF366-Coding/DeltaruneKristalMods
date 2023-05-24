local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Dummy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 800
    self.health = 750
    -- Enemy attack (determines bullet damage)
    self.attack = 4
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 1

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
        "..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DEF 0\nRalsei's dummy\nHow is he in this lost world?"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Susie wants to beat the dummy up.",
        "* Noelle wants to befriend the dummy.",
        "* The dummy looks... like a dummy?!"
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "[color:red]* Almost there! [color:reset]"

    -- Register act called "NEO Power"
    self:registerAct("Hug")
    self:registerAct("N-Hug", "", {"noelle"})
    self:registerAct("Pat", "", {"ralsei", "noelle"})
    self:registerAct("Stare", "", {"susie"})

    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    -- self:registerAct("Tell Story", "", {"ralsei"})
end

function Dummy:onAct(battler, name)
    if name == "Hug" then
        self:addMercy(20)
        return {
            "* You hug the dummy.",
            "* He seems a lot happier...!"
        }
    
    elseif name == "Pat" then
        self:addMercy(10)
        return {
            "* Ralsei and Noelle pat the dummy.",
            "* He seems kinda happy with it!"
        }

    elseif name == "N-Hug" then
        self:addMercy(35)
        return {
            "* You and Noelle both hug the dummy.",
            "* It took some stamina...",
            "* But the dummy is happy!"
        }
    
    elseif name == "Stare" then
        return {
            "* Susie couldn't do it...",
            "* The dummy is too powerful!!!"
        }
        
    elseif name == "Standard" then
        return "Nothing happened."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

return Dummy