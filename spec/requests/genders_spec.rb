require 'rails_helper'

describe 'Account API' do

  # --- GET ---
  it 'Confirmation of GET' do
    # accountsに送信
    get '/genders'

    # ステータス正常の確認
    expect(response.status).to eq(200)
  end
end
