require 'rails_helper'

describe Credential do 
  describe '#create' do
<<<<<<< HEAD

=======
    
>>>>>>> origin/master
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
