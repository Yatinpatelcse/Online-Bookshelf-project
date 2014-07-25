class Book < ActiveRecord::Base

  before_validation :whitespace_removing

  validates :title, :description, :image_url, presence: true

  validates :title, uniqueness:{case_sensitive: false}, length:{maximum: 50}

  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}

  validates :discount_price, allow_blank: true, numericality: {greater_than_or_equal_to: 0.00}
  validate :discount_price_cannot_be_greater_than_original_price

  validates :image_url, format: {
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  def discount_price_cannot_be_greater_than_original_price
    if self.discount_price?
      if self.discount_price > self.price
      errors.add(:discount_price, "Can't Be Greater Then Price")
      end
    end
  end

  def whitespace_removing
    self.title = title.gsub(/\s+/, ' ').strip
  end

end