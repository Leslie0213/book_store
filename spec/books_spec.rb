
require "books"
require "books_repository"
require "database_connection"

def reset_books_table
    seed_sql = File.read('spec/book_store_test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

RSpec.describe "Book" do
    it "Checks for the existance of model class" do
        books= Book.new
    end
end

describe "BookRepository" do

    before(:each) do 
        reset_books_table
    end

    it "Checks for all the book records" do 

        repo = BookRepository.new
        books = repo.all

        expect(books.count).to eq 4

        expect(books[0]['id']).to eq '1'
        expect(books[0]['title']).to eq 'Title1'
        expect(books[0]['author_name']).to eq 'Author1'

    end
end