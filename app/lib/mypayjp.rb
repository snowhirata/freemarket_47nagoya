require 'payjp'

class Mypayjp
  Payjp::api_key = Rails.application.credentials.payjp[:api_key]

  # カードトークンを生成
  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create(
      card: {
        number:    number,
        cvc:       cvc,
        exp_year:  exp_year,
        exp_month: exp_month,
      }
    )
    return token.id
  end

  # カードトークンを用いて支払いを作成
  def self.create_charge_by_token(token, amount)
    Payjp::Charge.create(
      amount:   amount,
      card:     token,
      currency: 'jpy'
    )
  end

  # 顧客登録
  def self.create_customer(token)
    Payjp::Customer.create(card: token)
  end

  # 顧客を用いて支払いを作成
  def self.create_charge_by_customer(customer, amount)
    Payjp::Charge.create(
      amount:   amount,
      customer: customer,
      currency: 'jpy'
    )
  end

end