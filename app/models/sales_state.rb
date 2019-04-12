class Sales_state < ApplicationRecord
  enum sales_state:{"販売中":1,"売り切れ":2}
end
