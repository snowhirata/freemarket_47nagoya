class User < ApplicationRecord


  # has_many :items_of_seller, class_name: 'item', foreign_key: 'seller_id'
  has_many :items_of_buyer, class_name: 'item', foreign_key: 'buyer_id'
  # itemとuserのアソシエーション　user設定完了時追加
  has_one :credential
  has_one :address
  has_one :credit
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook,:google_oauth2]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum exp_month:{"01":1, "02":2, "03":3, "04":4, "05":5,"06":6, "07":7, "08":8, "09":9, "10":10, "11":11, "12":12}
  enum exp_year:{"19":19, "20":20, "21":21, "22":22, "23":23,}

  validates :nickname, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_year,presence: true

  #facebook認証
  def self.from_omniauth(auth)
    credential = Credential.where(uid: auth.uid, provider: auth.provider).first
    exist_user = User.where(email: auth.info.email).first
    if credential
      user = credential.user
    elsif exist_user
      user = exist_user
    else
      user = User.new(
        nickname: auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      user.save(validate: false)

      credential = Credential.new(
        uid:      auth.uid,
        provider: auth.provider,
        user_id:  user.id
      )
      credential.save
    end
    user

  end
end
