class WelcomeController < ApplicationController
  def index
    @products = Product.all

    response = HTTParty.get "https://api.coindesk.com/v1/bpi/currentprice/USD.json"

response_json = JSON.parse(response.body)

    @btcprice = response_json["bpi"]["USD"]["rate"]

  end

  def contact
  end
end
