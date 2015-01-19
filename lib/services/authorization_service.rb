class AuthorizationService
  class << self
    def authorize_admin!(user)
      unless UserService.is_bonus_admin?(user)
        raise BonusEngine::AccessDenied
      end
    end

    def authorize_owner!(user)
      unless UserService.is_bonus_owner?(user)
        raise BonusEngine::AccessDenied
      end
    end
  end
end
