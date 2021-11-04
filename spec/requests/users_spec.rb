# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :request do
  it 'return true if display' do
    get '/users/1/'

    expect((response)).to have_http_status(:success)
  end
end
