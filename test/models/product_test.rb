require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "Products attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "Product price must be positive" do
    product = Product.new(title: "Title",
                          description: "Some description",
                          image_url: "someurl.jpg")
    
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(img_url)
    Product.new(title: "Title",
      description: "Some description",
      image_url: img_url,
      price: 1)
  end

  test "image url" do
    ok = %w{ img.jpg img.png img.gif https://a/b/c/img.gif }

    bad = %w{ img.doc img.exe img.gif/some img.jpg.exe }

    ok.each do |img_url|
      assert new_product(img_url).valid?, "#{img_url} should be valid"
    end

    bad.each do |img_url|
      assert new_product(img_url).invalid?, "#{img_url} shouldn't be valid"
    end
  end
end
