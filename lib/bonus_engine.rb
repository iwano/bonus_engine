require "bonus_engine/engine"
require "bonus_engine/exceptions"
require "services/user_service"
require "services/authorization_service"


module BonusEngine
  class << self
    def user_class
      begin
        Object.const_get('User')
      rescue NameError
        'User'.constantize
      end
    end
  end
end
