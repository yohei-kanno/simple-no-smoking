require 'rails_helper'

RSpec.describe '新規作成画面', type: :system do
 
  before do
    visit new_user_path
    fill_in "user_name", with: "kanno youhei"
    fill_in "user_birth_date", with: Date.current
    fill_in "user_email", with: "kanno@example.com"
    fill_in "user_password", with: "foobar"
    fill_in "user_password_confirmation", with: "foobar"
  end
  
  context "入力が正常の場合" do
    it "新規登録画面が表示される事" do
      expect(page).to have_button("モード選択画面へ")
    end
    
    it "モード選択画面をクリックしたらユーザーが作成される事" do
      expect{
        find('input[ name = "commit" ]').click
      }.to change{ User.count }.by(1)
      expect(page).to have_content("登録が完了しました"),"フラッシュメッセージ「登録が完了しました」と表示されていません"
    end
    
    it "ユーザー作成が出来たらログイン画面に遷移する事" do
      click_button "モード選択画面へ"
      expect(current_path).to eq(root_path),"ログイン画面に遷移出来ていません"
    end
  end
    
  context "入力が未入力箇所がある場合" do
    it "ユーザー登録が出来ない事" do
      fill_in "user_name", with: nil
      click_button "モード選択画面へ"
      expect(page).to have_content("登録が出来ませんでした"),"フラッシュメッセージ「登録が出来ませんでした」と表示されていません"
    end
  end

end