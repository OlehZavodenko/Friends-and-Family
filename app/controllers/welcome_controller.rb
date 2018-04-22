class WelcomeController < ApplicationController
  def index

    response = HTTParty.get "https://api.coindesk.com/v1/bpi/currentprice/USD.json"

response_json = JSON.parse(response.body)

    @btcprice = response_json["bpi"]["USD"]["rate"]

  end
  def contact
  end
end
