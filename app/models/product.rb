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
    require 'coinbase/wallet'

    client = Coinbase::Wallet::Client.new(api_key: 'oH6DpcmodB0Oyicw', api_secret: 'anVXPXHZmAXJrKHvfK7oa89zDwzbyBVs')

    btcprice = client.exchange_rates({currency: 'BTC'})["rates"]["USD"].to_i

     price_in_btc  = (price_in_cents.to_f / 100) / btcprice
     sprintf("%.5f", price_in_btc)
   end
   def ltc_price
     require 'coinbase/wallet'
     client = Coinbase::Wallet::Client.new(api_key: 'oH6DpcmodB0Oyicw', api_secret: 'anVXPXHZmAXJrKHvfK7oa89zDwzbyBVs')

     ltcprice = client.exchange_rates({currency: 'LTC'})["rates"]["USD"].to_i

      price_in_ltc  = (price_in_cents.to_f / 100) / ltcprice
      sprintf("%.5f", price_in_ltc)
    end
    def eth_price
      require 'coinbase/wallet'
      client = Coinbase::Wallet::Client.new(api_key: 'oH6DpcmodB0Oyicw', api_secret: 'anVXPXHZmAXJrKHvfK7oa89zDwzbyBVs')

      ethprice = client.exchange_rates({currency: 'ETH'})["rates"]["USD"].to_i

       price_in_eth  = (price_in_cents.to_f / 100) / ethprice
       sprintf("%.5f", price_in_eth)
     end
     def bch_price
       require 'coinbase/wallet'
       client = Coinbase::Wallet::Client.new(api_key: 'oH6DpcmodB0Oyicw', api_secret: 'anVXPXHZmAXJrKHvfK7oa89zDwzbyBVs')

       bchprice = client.exchange_rates({currency: 'BCH'})["rates"]["USD"].to_i

        price_in_bch  = (price_in_cents.to_f / 100) / bchprice
        sprintf("%.5f", price_in_bch)
      end
end

# client = Coinbase::Wallet::Client.new(api_key: 'oH6DpcmodB0Oyicw', api_secret: 'anVXPXHZmAXJrKHvfK7oa89zDwzbyBVs')
#
# BTCprice = client.exchange_rates({currency: 'BTC'})
#
# LTCprice = client.exchange_rates({currency: 'LTC'})
#
# ETHprice = client.exchange_rates({currency: 'ETH'})
#
# BCHprice = client.exchange_rates({currency: 'BCH'})
#
# p ETHprice["rates"]["USD"].to_i
