FactoryGirl.define do
  factory :user_role, class: 'Role' do
    name "bonus_user"
  end

  factory :admin_role, class: 'Role' do
    name "bonus_admin"
  end

end
