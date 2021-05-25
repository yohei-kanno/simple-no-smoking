require 'rails_helper'

RSpec.describe 'ログイン機能のテスト', type: :system do  
  let(:user_a) { create(:user) }
  before do
    user_a.activation_state = "active"
    user_a.save!
  end
    
  describe "ログイン処理" do
    context "画面表示" do
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
    
    context "ログインしていない場合" do
      it "禁煙PF新規画面にいくとログイン画面に遷移する" do
        visit new_user_no_smoking_user_profile_path(user_a)
        expect(current_path).to eq(login_path)
      end
      
      it "禁煙PF画面にいくとログイン画面に遷移する" do
        visit user_no_smoking_user_profile_path(user_a)
        expect(current_path).to eq(login_path)
      end
        
      it "減煙PF新規作成画面にいくとログイン画面に遷移する" do
        visit new_user_reduction_user_profile_path(user_a)
        expect(current_path).to eq(login_path)
      end
      
      it "減煙PF画面にいくとログイン画面に遷移する" do
        visit user_reduction_user_profile_path(user_a)
        expect(current_path).to eq(login_path)
      end
      
    end
        
    context "モードが選択されていない場合" do
      it "モード選択画面画面に画面遷移する事" do
        login(user_a)
        expect(page).to have_content("モードを選択して下さい")
      end
    end
    
    context "禁煙モードが選択されていた場合" do
      let!(:ns_mode){create(:mode, user: user_a, mode: 0)}
      let(:ns_profile){create(:no_smoking_user_profile, user: user_a)}
      
      it "PF未作成なら新規作成画面へ遷移する" do
        login(user_a)
        expect(page).to have_content("ログインしました")
        expect(page).to have_content("NoSmokingMode")
        expect(page).to have_content("の事を教えて下さい")
      end
      
      it "PFが作成済みならPF画面へ遷移する" do
        ns_profile; login(user_a) 
        expect(page).to have_content("ログインしました")
        expect(page).to have_content("NoSmokingMode")
        expect(page).to have_content("禁煙を開始してから")
      end
    end
    
    context "減煙モードが選択されていた場合" do
      let!(:re_mode){ create(:mode, user: user_a, mode: 1) }
      let(:re_profile){ create(:reduction_user_profile, user: user_a) }
      
      it "PF未作成なら新規作成画面へ遷移する" do
        login(user_a)
        expect(page).to have_content("ログインしました")
        expect(page).to have_content("ReductionMode")
        expect(page).to have_content("の事を教えて下さい")
      end
      
      it "PF作成済みならPF画面へ遷移する" do
        re_profile; login(user_a)
        expect(page).to have_content("ログインしました")
        expect(page).to have_content("ReductionMode")
        expect(page).to have_content("減煙を開始してから")
      end
    end
  end
        
    
  describe "ログアウト処理" do
    context "禁煙ユーザー" do
      
      let!(:ns_profile) { create(:no_smoking_user_profile, user: user_a) }
      let!(:ns_mode) { create(:mode, user: user_a) }
      
      before do
        login(user_a)
        visit user_no_smoking_user_profile_path(user_a)
        click_button("メニュー画面へ")
      end
      
      it "禁煙PF画面からログアウト出来る事" do
        click_button "ログアウト"
        expect(page).to have_content("ログアウトしました")
      end
    end
    
    context "減煙ユーザー" do
      let!(:re_profile) { create(:reduction_user_profile, user: user_a) }
      let!(:re_mode) { create(:mode, mode: 1, user: user_a) }
      
      before do
        login(user_a)
        visit user_reduction_user_profile_path(user_a)
        click_button("メニュー画面へ")
      end
      
      it "減煙PF画面からログアウト出来る事" do
        click_button "ログアウト"
        expect(page).to have_content("ログアウトしました")
      end
    end
  end
end
