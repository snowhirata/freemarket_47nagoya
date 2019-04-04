FactoryBot.define do
  factory :item do
    name {"ロングカーディガン"}
    # description
    # brand
    # state
    # category_id
    # prefecture_id
    # ship_charge
    # ship_method
    # ship_date
    price {"1000"}
    seller {"1"}
    buyer {"1"}
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    # user

    # after(:create) do |item|
    #   create(:image, item_id: item.id)
    # end
  end
end
