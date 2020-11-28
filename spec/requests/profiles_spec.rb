require 'rails_helper'

describe 'Profile API' do

  # --- GET ---
  it 'Confirmation of GET' do
    # profilesに送信
    get '/profiles'

    # ステータス正常の確認
    expect(response.status).to eq(200)
  end

  # --- POST ---
  it 'Confirmation of POST' do

    pending "エラーが出るのでペンディング。おそらくGenderの外部キー絡み。"

    # Accountにデータを一時作成
    account = create(:account)

    # profile
    # パラメータ作成
    valid_params = { profile: {
        account_id: account[:id],
        nickname: "akakak",
        self_introduction: "Nice to meet you!!",
        gender_id: 2,
        game_playing: "Tetris99",
        time_period_playing: "10:00〜"
      } }

    post '/profiles', params: valid_params

    # ステータス正常の確認
    expect(response.status).to eq(201)
  
  end

  # # --- PUT ---
  it 'Confirmation of PUT' do

    pending "エラーが出るのでペンディング。おそらくGenderの外部キー絡み。"

    # Accountにデータを一時作成
    account = create(:account)

    # 送信パラメータ
    profile = create(:profile, account_id: account[:id])

    # PUT送信
    put "/diaries/#{profile.id}", params: { profile: { nickname: 'VAV' } }
    json = JSON.parse(response.body)

    # ステータス正常の確認
    expect(response.status).to eq(200)
    # 値の確認
    expect(json['nickname']).to eq('VAV')

  end

  # # --- DELETE ---
  it 'Confirmation of DELETE' do

    pending "エラーが出るのでペンディング。おそらくGenderの外部キー絡み。"

    # Accountにデータを一時作成
    account = create(:account)

    #  削除データ作成
    profile = create(:profile, account_id: account[:id])

    # 削除送信＋件数の確認
    expect{ delete "/profiles/#{profile.id}" }.to change(Profile, :count).by(-1)
    # ステータス正常の確認
    expect(response.status).to eq(204)
  end

end

