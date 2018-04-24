class Product < ApplicationRecord
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews
  has_attached_file :photo, styles: { medium: "350x350>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

  def btc_price
     response = HTTParty.get "https://api.coindesk.com/v1/bpi/currentprice/USD.json"

  response_json = JSON.parse(response.body)

   price = response_json["bpi"]["USD"]["rate"].to_i * 1000

     price_in_btc  = (price_in_cents.to_f / 100) / price
     sprintf("%.5f", price_in_btc)
   end
end
