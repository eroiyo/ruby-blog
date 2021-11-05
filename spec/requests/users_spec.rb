# frozen_string_literal: true

require 'rails_helper'

describe 'Users GET #index', type: :request do
  it 'return true if display' do
    get '/'
    expect((response)).to have_http_status(:success)
  end

  it 'should render correct template' do
    get '/'
    expect(response).to render_template(:index)
  end

  it 'should include correct placeholder text' do
    get '/'
    expect(response.body).to include('Users List')
  end
end

describe 'Users GET #show', type: :request do
  it 'return true if display' do
    get '/users/1'
    expect((response)).to have_http_status(:success)
  end

  it 'should render correct template' do
    get '/users/1'
    expect(response).to render_template(:show)
  end

  it 'should include correct placeholder text' do
    get '/users/1'
    expect(response.body).to include('User Profile')
  end
end
