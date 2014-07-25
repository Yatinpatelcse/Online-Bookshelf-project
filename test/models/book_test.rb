require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'a user should enter a title' do
    book = Book.new
    assert !book.save
    assert !user.error[:title].empty?
  end

  test 'a user should enter a description' do
    book = Book.new
    assert !book.save
    assert !user.error[:description].empty?
  end

  test 'a user should enter a image_url' do
    book = Book.new
    assert !book.save
    assert !user.error[:image_url].empty?
  end

  test 'a user should enter a Price ' do
    book = Book.new
    assert !book.save
    assert !user.error[:price].empty?
  end
end
