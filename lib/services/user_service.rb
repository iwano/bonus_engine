class UserService

  class << self
    def klass
      BonusEngine.user_class
    end

    def all
      klass.all
    end

    def find(id)
      klass.find(id)
    end
  end
end
