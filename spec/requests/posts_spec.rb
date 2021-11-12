# frozen_string_literal: true

require 'rails_helper'

describe 'Posts GET #index', type: :request do
  it 'return true if display' do
    get '/users/1/posts'
    expect((response)).to have_http_status(:success)
  end

  it 'should render correct template' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
  end

  it 'should include correct placeholder text' do
    get '/users/1/posts'
    expect(response.body).to include('likes')
  end
end

describe 'Posts GET #show', type: :request do
  it 'return true if display' do
    get '/users/1/posts/1'
    expect((response)).to have_http_status(:success)
  end

  it 'should render correct template' do
    get '/users/1/posts/1'
    expect(response).to render_template(:show)
  end

  it 'should include correct placeholder text' do
    get '/users/1/posts/1'
    expect(response.body).to include('Comments Section:')
  end
end
