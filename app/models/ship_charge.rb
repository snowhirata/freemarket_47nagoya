class Ship_charge < ApplicationRecord
  enum ship_charge:{"送料こみ(出品者負担)":1,"着払い(購入者負担)":2}
end
