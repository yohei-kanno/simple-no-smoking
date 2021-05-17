require 'rails_helper'

RSpec.describe Stock, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @reduction_user_profile = FactoryBot.create(:reduction_user_profile, user: @user)
  end
    
  it "カウンターはデフォルトで０で有効である事" do
    stock = FactoryBot.build(:stock, reduction_user_profile: @reduction_user_profile)
    expect(stock.counter).to eq(0)
    expect(stock).to be_valid
  end

  
  
end