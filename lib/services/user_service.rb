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

    def is_bonus_admin?(user)
      user.roles.map(&:name).include?('bonus_admin')
    end

    def is_bonus_owner?(user)
      user.roles.map(&:name).include?('bonus_owner')
    end
  end
end
