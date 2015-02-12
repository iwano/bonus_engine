class BudgetService
  class << self
    def check_balance_for_update(user, quantity, event, id)
      point = BonusEngine::Point.find(id)
      initial_balance = event.stats_for(user)[:balance]

      (initial_balance == 0 && point.quantity >= quantity) ||
        (initial_balance > quantity) ||
        event.maximum_points > quantity
    end

    def check_balance(user, quantity, event)
      event.stats_for(user)[:balance] >= quantity &&
        event.maximum_points >= quantity
    end
  end
end
