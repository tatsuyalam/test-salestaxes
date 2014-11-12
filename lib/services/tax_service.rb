class TaxService

  # Get sales taxes
  def self.apply_for good
    # Basic tax only apply for all good with rate of 10%, except books, food, and medical products
    basic_tax = %w(book food medical).include?(good.category) ? 0 : 10
    # Import tax apply to all good with rate of 5%
    import_tax = %w(import imported).include?(good.name.downcase) ? 5 : 0

    return ((basic_tax + import_tax).to_f * good.price / 100).round(2)
  end

end 