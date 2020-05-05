require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログイン後' do
    before do
      expect(response).to redirect_to root_path
    end
  end
end