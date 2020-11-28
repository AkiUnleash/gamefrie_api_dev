require 'rails_helper'

describe 'Account API' do

  # --- GET ---
  it 'Confirmation of GET' do
    # accountsに送信
    get '/accounts'

    # ステータス正常の確認
    expect(response.status).to eq(200)
  end

  # --- POST ---
  it 'Confirmation of POST' do
    # パラメータ作成
    valid_params = { 
        email: 'hogehoge@email.com',
        hashed_password: 'password123',
        tmp_authenication_date: '2020/11/25 22:12:42'
      }

    # POST送信
    expect { post '/accounts', params: { account: valid_params } }.to change(Account, :count).by(+1)

    # ステータス正常の確認
    expect(response.status).to eq(201)
  end

  # --- PUT ---
  it 'Confirmation of PUT' do
    # 送信パラメータ
    account = create(:account, email: 'hogehoge@email.com')

    # PUT送信
    put "/accounts/#{account.id}", params: { account: { email: 'hogehoge@email.com' } }
    json = JSON.parse(response.body)

    # ステータス正常の確認
    expect(response.status).to eq(200)
    # 値の確認
    expect(json['email']).to eq('hogehoge@email.com')
  end

  # --- DELETE ---
  it '削除' do
    #  削除データ作成
    account = FactoryBot.create(:account)

    # 削除送信＋件数の確認
    expect{ delete "/accounts/#{account.id}" }.to change(Account, :count).by(-1)
    # ステータス正常の確認
    expect(response.status).to eq(204)
  end

end

