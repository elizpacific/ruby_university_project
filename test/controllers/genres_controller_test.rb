require "test_helper"

class GenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = genres(:one)
  end

  test 'should get index' do
    get genres_url
    assert_response :success
  end

  test 'should get new' do
    get new_genre_url
    assert_response :success
  end

  test 'should create genres' do
    assert_difference("Genre.count") do
      post genres_url, params: { genre: {id: @genre.id, name: @genre.name}}
    end

    assert_redirected_to genres_url
  end

  test 'should show genres' do
    get genre_url(@genre)
    assert_response :success
  end

  test 'should update genres' do
    patch genre_url(@genre), params: { genre: {id: @genre.id, name: @genre.name}}
    assert_redirected_to genre_url(@genre)
  end

  test 'should destroy genres' do
    assert_difference('Genre.count', -1) do
      delete genre_url(@genre)
    end
    assert_redirected_to genres_url
  end
end
