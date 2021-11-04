require 'rails_helper'

describe 'Posts', type: :request do
    it 'return true if display' do
        get '/users/1/posts'

        expect((response)).to have_http_status(:success)  
    end
end