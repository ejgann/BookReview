class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def show
        @book = Book.find_by_id(params[:id])
    end

    def edit
        @book = Book.find_by_id(params[:id])
    end
    
    def update
        @book = Book.find_by_id(params[:id])
        if @book.update
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def destroy
        @book = Book.find_by_id(params[:id])
        @book.delete
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :description, :user_id, :category_id)
    end
end
