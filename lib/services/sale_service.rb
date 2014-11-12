class SaleService

  # Generate receipt of purchased order  
  # Result: to CSV format
  def self.generate_receipt order
    csv_string = CSV.generate do |row|
      # Header
      row << ["Quantity", "Product", "Price"]
      # Line items
      order.items.each do |item|
        row << [item.quantity, item.good.name, item.good.price_after_tax]
      end
      # Blank line
      row << []
      order_values = order.values 
      # Sales taxes
      row << ["Sales Taxes: #{'%.2f' % order_values[:taxes]}"]
      # Total value
      row << ["Total: #{'%.2f' % order_values[:total]}"]
    end

    return csv_string
  end

end