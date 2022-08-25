require_relative "books"

class BookRepository

    def all
        sql = "SELECT * FROM books"
        resultset = DatabaseConnection.exec_params(sql, []) 
        #resultset = resultset.to_a

        resultset.each do |record|
            books = Book.new
            p books.id = record['id']
            p books.title = record['title']
            p books.author_name = record['author_name']
        end
        return resultset

    end

end