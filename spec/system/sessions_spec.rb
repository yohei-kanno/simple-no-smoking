require 'rails_helper'

RSpec.describe 'ログイン機能のテスト', type: :system do
  let(:user_a) { create(:user) }
  
  before do
    visit root_path
  end
    
  it "ログイン画面が表示される事" do
    expect(page).to have_button "ログイン"
    expect(page).to have_content "メールアドレス"
    expect(page).to have_content "パスワード"
  end
  
  it "入力が正常であればログイン出来る事" do
    fill_in "email", with: user_a.email
    fill_in "password", with: "password"
    click_button "ログイン"
    expect(current_path).to eq new_user_modes_path(user_a)
    expect(page).to have_content("モードを選択して下さい")
  end
  
  it "入力が不十分であればログイン出来ない事" do
    fill_in "email", with: nil
    fill_in "password", with: "password"
    click_button "ログイン"
    expect(current_path).to eq login_path
    expect(page).to have_content("ログイン出来ませんでした")
  end
end
