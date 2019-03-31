require 'rails_helper'

describe Credential do 
  describe '#create' do
    it "ニックネームが空は保存させない" do
      credential = build(:credential, nickname: nil)
      credential.valid?
      expect(credential.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスが空は保存させない" do
      credential = build(:credential, email: nil)
      credential.valid?
      expect(credential.errors[:email]).to include("を入力してください")
    end

    it "uidが空は保存させない" do
      credential = build(:credential, uid: nil)
      credential.valid?
      expect(credential.errors[:uid]).to include("を入力してください")
    end

    it "プロバイダが空は保存させない" do
      credential = build(:credential, provider: nil)
      credential.valid?
      expect(credential.errors[:provider]).to include("を入力してください")
    end
  end
end
