require 'rails_helper'

RSpec.describe NoSmokingUserProfile, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
    
  it "タバコの金額、喫煙ペース、時給がある場合有効である事" do
    ns_user = FactoryBot.build(:no_smoking_user_profile, user: @user)
    expect(ns_user).to be_valid
  end
  
  it "タバコの金額がない場合無効である事" do
    ns_user = FactoryBot.build(:no_smoking_user_profile, user: @user, tabaco_price: nil)
    expect(ns_user).to_not be_valid
  end
  
  it "喫煙ペースがない場合無効である事" do
    ns_user = FactoryBot.build(:no_smoking_user_profile, user: @user, smoking_pace: nil)
    expect(ns_user).to_not be_valid
  end
  
  it "時給がない場合無効である事" do
    ns_user = FactoryBot.build(:no_smoking_user_profile, user: @user, hourly_wage: nil)
    expect(ns_user).to_not be_valid
  end
  
  
end
