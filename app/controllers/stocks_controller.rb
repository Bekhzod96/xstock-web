class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = new_lookup(params[:stock])
      if @stock
        @value = @stock
        respond_to do |format|
          format.js { render partial: 'stocks/stock' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid Symbol!'
          format.js { render partial: 'stocks/stock' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'stocks/stock' }
      end
    end
  end

  def new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      {
        ticker: ticker_symbol,
        name: client.company(ticker_symbol).company_name,
        last_price: client.price(ticker_symbol)
      }
    rescue StandardError
      nil
    end
  end
end
