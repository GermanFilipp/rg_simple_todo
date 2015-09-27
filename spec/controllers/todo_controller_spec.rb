require 'rails_helper'

RSpec.describe TodoController, type: :controller do

  describe 'GET #index' do
    it { expect(response).to have_http_status(200) }
  end

end
