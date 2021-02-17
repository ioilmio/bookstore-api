require 'rails_helper'

# rubocop:disable Metrics/BlockLength

describe 'Books api', type: :request do
  before do
    user = User.create(email: 'user3@example.com', password: 'password')
    p user
    Book.create!(title: 'a book', author: 'an author', category: 'Action', user_id: user.id, isbn: 111)
    Book.create!(title: 'a book2', author: 'an author2', category: 'Action', user_id: user.id, isbn: 111)
  end
  describe 'GET /books' do
    it 'returns all books' do
      get '/api/v1/users/1/books'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET/books/1' do
    it 'return a book' do
      # Book.create!(title: 'a book', author: 'an author', category: 'Action', user_id: user.id, isbn: 111)

      get '/api/v1/users/1/books/1' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /books' do
    it 'create a new book' do
      post '/api/v1/users/1/books',
           params: { book: { user_id: 1, title: 'a book', author: 'an author', category: 'Action', isbn: 1212 } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'delete books' do
    # let!(:book) { FactoryBot.create(:book, user_id: user.id, title: 'a book', author: 'an author', category: 'Action') }
    it 'delete a book' do
      delete '/api/v1/users/1/books/1' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
