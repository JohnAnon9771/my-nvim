class ProductV2::List
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Attributes

  attr_accessor :products

  attribute :id, default: -> { SecureRandom.uuid }
  attribute :products
  attribute :expires_in, default: -> { 30.minutes.to_i }

  validates :products, presence: true
  validate :products_with_one_product_type

  def create!
    if valid?
      EphemeralStorage::List
        .create(id:, data: products, expires_in:)
    end

    self
  end

  private

  def products_with_one_product_type
    return if products.select(:product_type_id).distinct.one?

    errors.add(:products, :more_than_one_product_type)
  end
end
