class Fixer
    include HTTParty
    base_uri 'http://api.fixer.io'

    def initialize(symbols)
      @symbols = symbols
      @base = 'USD'
    end

    def exchange_rates
      result = self.class.get('/latest', query: { base: @base, symbols: @symbols } )
      result.parsed_response['rates']
    end
end
