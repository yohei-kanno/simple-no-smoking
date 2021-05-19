require 'rails_helper'

RSpec.describe '禁煙モード全般の設定', type: :system do
  
  let(:user_a) { create(:user) }
  let(:ns_mode) { create(:mode, user: user_a, mode: 0)}
  
  before do
    login(user_a)
    visit  new_user_no_smoking_user_profile_path(user_a)
  end

  
  describe "新規設定" do
    context "ユーザー登録が出来ている場合" do
      it "ログイン出来ていれば禁煙モードを選択出来る事" do
        expect(page).to have_content(user_a.name)
      end
    end 
      
    context "禁煙PFの入力が不十分の場合" do
      it "入力が不十分だとPF登録出来ない事" do
        expect{
        find('input[ name = "commit" ]').click
      }.to change{ NoSmokingUserProfile.count }.by(0)
        expect(page).to have_content("登録が出来ませんでした")
      end
    end  
      
    context "禁煙PFの入力が十分である場合" do
      before do
        fill_in "no_smoking_user_profile_start_date",with: Date.current
        fill_in "no_smoking_user_profile_tabaco_price", with: 550
        fill_in "no_smoking_user_profile_smoking_pace", with: 30
        fill_in "no_smoking_user_profile_hourly_wage", with: 1400
      end
        
      it "金額、本数、時給を入力すればPF登録が出来る" do
        expect{
          find('input[ name = "commit" ]').click
        }.to change{ NoSmokingUserProfile.count }.by(1)
        
        expect(page).to have_content("登録が完了しました")
      end
    end
  end
  
  
  describe "編集画面" do
    let!(:ns_profile) { create(:no_smoking_user_profile, user: user_a) }
    
    before do
      visit user_no_smoking_user_profile_path(user_a)
      click_button("喫煙情報を編集する")
    end
    
    
    context "ボタンが正常に機能する" do
      it "編集画面に画面遷移出来る事" do
        expect(page).to have_content(ns_profile.user.name)
      end
    end
    
    context "金額、本数、時給が未入力" do
      it "画面遷移出来ない事" do
        fill_in "no_smoking_user_profile_tabaco_price", with: nil
        fill_in "no_smoking_user_profile_smoking_pace", with: nil
        fill_in "no_smoking_user_profile_hourly_wage", with: nil
        click_button "更新する"
        expect(page).to have_content("更新が出来ませんでした")
      end
    end
    
    context "金額、本数、時給が入力されている" do
      before do
        fill_in "no_smoking_user_profile_tabaco_price", with: 100
        fill_in "no_smoking_user_profile_smoking_pace", with: 100
        fill_in "no_smoking_user_profile_hourly_wage", with: 100
        click_button "更新する"
      end
        
      it "更新後の画面に遷移する事" do
        expect(page).to have_content("更新が完了しました")
      end
    end
  end
  
  
  describe "データリセット系" do
    let!(:ns_profile) { create(:no_smoking_user_profile, user: user_a) }
    
    context "禁煙を最初から始めるボタン及びdata_confirm(yes)が正常に機能する" do
      before do
        ns_mode; visit user_no_smoking_user_profile_path(user_a)
        page.accept_confirm do
          click_button "禁煙を最初から始める"
        end
      end
      
      it "PF画面に遷移する" do
        expect(current_path).to eq(user_no_smoking_user_profile_path(user_a))
      end
      
      it "データリセットメッセージが表示されている" do
        expect(page).to have_content("データをリセットしました")
      end
      
      it "データが実際にリセットされている" do
        expect(page).to have_content("0日00時間00分00秒")
      end
    end
    
    context "禁煙を最初から始めるボタン及びdata_confirm(no)が正常に機能する" do
      before do
        ns_mode; visit user_no_smoking_user_profile_path(user_a)
        page.dismiss_confirm do
          click_button "禁煙を最初から始める"
        end
      end
      
      it "元のPF画面のままである" do
        expect(current_path).to eq(user_no_smoking_user_profile_path(user_a))
      end
      
      it "データリセットメッセージが表示されていない" do
        expect(page).to_not have_content("データをリセットしました")
      end
      
      it "データが実際にリセットされていない" do
        expect(page).to_not have_content("0日00時間00分00秒")
      end
    end
    
    context "減煙にするボタン及びdata_confirm(yes)が正常に機能する" do
      before do
        ns_mode; visit user_no_smoking_user_profile_path(user_a)
        page.accept_confirm do
          click_button "減煙モードに移行する"
        end
      end
      
      it "モード選択画面に遷移する" do
        expect(current_path).to eq(new_user_modes_path(user_a))
        expect(page).to have_content("モードを選択して下さい")
        expect(page).to have_content("SimpleNoSmoking")
      end
      
      it "NoSmokignProfileがdestroyされている" do
        expect(page).to have_content("SimpleNoSmoking")
        expect(NoSmokingUserProfile.count).to eq(0)
      end
    end
    
    context "減煙にするボタン及びdata_confirm(no)が正常に機能する" do
      before do
        ns_mode; visit user_no_smoking_user_profile_path(user_a)
        page.dismiss_confirm do
          click_button "減煙モードに移行する"
        end
      end
      
      it "元のPF画面のまま" do
        expect(page).to have_content("NoSmokingMode")
      end
      
      it "NoSmokingUserProfileがdestoryされていない" do
        expect(page).to have_content("NoSmokingMode")
        expect(NoSmokingUserProfile.count).to eq(1)
      end
    end
    
    context "アカウント削除ボタン及びdata_confirm(yes)が正常に機能する" do
      before do
        ns_mode; visit user_no_smoking_user_profile_path(user_a)
        page.accept_confirm do
          click_button "アカウント削除"
        end
      end
      
      it "ログイン画面に遷移する事" do
        expect(current_path).to eq(root_path)
      end
      
      it "Userがdestoryされる事" do
        expect(page).to have_content("アカウントを削除しました")
        expect(page).to have_content("SimpleNoSmoking")
        expect(User.count).to eq(0)
      end
    end
  end
end
