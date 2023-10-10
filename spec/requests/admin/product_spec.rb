# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Products', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admin/product/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/admin/product/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/admin/product/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/admin/product/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
