class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_70f5aaa3087540aabf3227c2ec3988ba',
      secret_token: 'Tsk_2de21b33c77946e7bc7e6a591e6eb314',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticker_symbol)
  end

end
