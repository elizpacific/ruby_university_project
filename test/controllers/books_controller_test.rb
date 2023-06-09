require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should get new' do
    get new_book_url
    assert_response :success
  end

  test 'should create book' do
    assert_difference("Book.count") do
      post books_url, params: { book: {id: @book.id, name: @book.name, description: @book.description}}
    end

    assert_redirected_to books_url
  end

  test 'should show book' do
    get book_url(@book)
    assert_response :success
  end

  test 'should update book' do
    patch book_url(@book), params: { book: {id: @book.id, name: @book.name, description: @book.description}}
    assert_redirected_to book_url(@book)
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end
    assert_redirected_to books_url
  end
end
