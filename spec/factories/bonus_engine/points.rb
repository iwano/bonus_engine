FactoryGirl.define do
  factory :point, class: 'BonusEngine::Point' do
    giver_id 1
    receiver_id 2
    quantity 500
    message "factory point"
  end
end
