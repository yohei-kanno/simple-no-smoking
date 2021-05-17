require 'rails_helper'

RSpec.describe Mode, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  it "禁煙モードが選択されていれば有効である事" do
    mode = FactoryBot.build(:mode, mode: 0,  user: @user)
    expect(mode.mode).to eq("no_smoking_mode")
    expect(mode).to be_valid
  end
  
  it "減煙モードが選択されていれば有効である事" do
    mode = FactoryBot.build(:mode, mode: 1,  user: @user)
    expect(mode.mode).to eq("reduction_mode")
    expect(mode).to be_valid
  end
  
  it "モードが選択されていれば無効である事" do
    mode = FactoryBot.build(:mode, mode: nil, user: @user)
    expect(mode).to_not be_valid
  end
  
end