# frozen_string_literal: true

require 'factory_bot'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
# RSpec without Rails
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
