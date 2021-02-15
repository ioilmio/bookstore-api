require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) do
    Book.create!(
      title: 'a book',
      author: 'io',
      category: 'Action'
    )
  end
  describe 'create a book' do
    it 'is valid with title and category' do
      book = user.books.create!(title: 'a book', author: 'io', category: 'Action')
      expect(book).to be_valid
    end
  end
end
