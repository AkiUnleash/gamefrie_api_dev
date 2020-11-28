require 'rails_helper'

describe 'Diary API' do

  # --- GET ---
  it 'Confirmation of GET' do
    # diariesに送信
    get '/diaries'

    # ステータス正常の確認
    expect(response.status).to eq(200)
  end

  # --- POST ---
  it 'Confirmation of POST' do
    # Accountにデータを一時作成
    account = create(:account)

    # profile
    # パラメータ作成
    valid_params = { diary: {
        account_id: account[:id],
        body: "Yeah!!!", 
        played_game: "Tetris"
      } }

    post '/diaries', params: valid_params 

    # ステータス正常の確認
    expect(response.status).to eq(201)
  end

  # --- PUT ---
  it 'Confirmation of PUT' do

    # Accountにデータを一時作成
    account = create(:account)

    # 送信パラメータ
    diary = create(:diary, account_id: account[:id])

    # PUT送信
    put "/diaries/#{diary.id}", params: { diary: { body: 'Oh!!' } }
    json = JSON.parse(response.body)

    # ステータス正常の確認
    expect(response.status).to eq(200)
    # 値の確認
    expect(json['body']).to eq('Oh!!')

  end

  # --- DELETE ---
  it 'Confirmation of DELETE' do
    # Accountにデータを一時作成
    account = create(:account)

    #  削除データ作成
    diary = create(:diary, account_id: account[:id])

    # 削除送信＋件数の確認
    expect{ delete "/diaries/#{diary.id}" }.to change(Diary, :count).by(-1)
    # ステータス正常の確認
    expect(response.status).to eq(204)
  end

end


