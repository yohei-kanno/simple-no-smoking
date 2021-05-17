require 'rails_helper'

RSpec.describe ReductionUserProfile, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  it "タバコの金額、喫煙ペース、時給がある場合有効である事" do
    re_user = FactoryBot.build(:reduction_user_profile, user: @user)
    expect(re_user).to be_valid
  end
  
  it "タバコの金額が無い場合無効である事" do
    re_user = FactoryBot.build(:reduction_user_profile, user: @user, tabaco_price: nil)
    expect(re_user).to_not be_valid
  end
  
  it "喫煙ペースが無い場合無効である事" do
    re_user = FactoryBot.build(:reduction_user_profile, user: @user, smoking_pace: nil)
    expect(re_user).to_not be_valid
  end
  
  it "時給が無い場合無効である事" do
    re_user = FactoryBot.build(:reduction_user_profile, user: @user, hourly_wage: nil)
    expect(re_user).to_not be_valid
  end
end