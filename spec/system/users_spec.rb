require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  
  it "新規登録画面が表示される事" do
    visit root_path
    expect(page).to have_button "ログイン"
    expect(page).to have_content "メールアドレス"
    expect(page).to have_content "パスワード"
    
  end
end