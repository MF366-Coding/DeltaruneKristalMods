return {
    wall = function(cutscene, event)
        -- Open textbox and wait for completion
        cutscene:text("* The wall seems cracked.")

        -- If we have noelle, play a cutscene
        local noelle = cutscene:getCharacter("noelle")
        if noelle then

            -- All text from now is spoken by Noelle
            cutscene:setSpeaker(noelle)
            cutscene:text("* You really seem interested\nin that broken wall...", "smile")
            cutscene:text("[color:blue]* [wait:5](It's like he was...)", "down")
            cutscene:text("* Nevermind!", "smile")

            -- Reset noelle's sprite
            noelle:resetSprite()
        end
    end
}