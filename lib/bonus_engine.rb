require "bonus_engine/engine"

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
