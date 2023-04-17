local ShopName, super = Class(Shop)

function ShopName:init()
  super:init(self)
  
  self.encounter_text = "* IT'S ALL SO MUCH FUN!!![wait:3]\nOH HELLO, KRIS!!!."
  self.shop_text = "* PLEASE... [wait:1]HURRY UP!!\nUEH EH EH!!"
  self.leaving_text = "* NO NO NO!!![wait:1]\nLET ME PLAY WITH YOU!!!!"
  self.buy_menu_text = "* BUY, BUY, BUY UNTIL YOU...\n[wait:2]DIE!\n[wait:1]UEH EH EH!!"
  self.buy_confirmation_text = "* CLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!\nCLICK YES!"
  self.buy_refuse_text = "* I AM JUST TRYING TO LIVE!\n[wait:2]UEH EH EH...[wait:1]EH?"
  self.buy_text = ""


  self:registerItem("chaos_sword", 1)
  self:registerItem("lmao_item")
end

return ShopName