class Credential < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :uid
    validates :provider
  end

end
