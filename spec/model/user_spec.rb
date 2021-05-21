require 'rails_helper'

RSpec.describe User, type: :model do

  it "名前、メールアドレス、パスワード,パスワード確認、誕生日がある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  
  it "名前が無い場合無効である" do
   user = FactoryBot.build(:user, name: nil)
   expect(user).to_not be_valid 
  end
  
  it "メールアドレスが無い場合無効である" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end
  
  it "パスワードが無い場合無効である" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
  end
  
  it "パスワード確認が無い場合無効である" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    expect(user).to_not be_valid
  end
  
  it "誕生日が無い場合無効である" do
    user = FactoryBot.build(:user, birth_date: nil)
    expect(user).to_not be_valid
  end
  
  it "パスワードが一致しない場合無効である" do
    user = FactoryBot.build(:user, password_confirmation: "foobar")
    expect(user).to_not be_valid
  end
  
  it "パスワードが６文字未満の場合無効である" do
    user = FactoryBot.build(:user,password: "a"*5,
    password_confirmation: "a"*5)
    expect(user).to_not be_valid
  end
  
  it "メールアドレスが重複する場合無効である" do
    user = FactoryBot.create(:user)
    other = FactoryBot.build(:user, email: user.email)
    expect(other).to_not be_valid
  end
    
end
