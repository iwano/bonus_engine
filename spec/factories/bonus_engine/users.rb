FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"

    after(:create) do |user|
      user.roles << FactoryGirl.create(:user_role)
    end
  end

  factory :admin_user, class: 'User' do
    name "MyString"
    email "MyString"

    after(:create) do |user|
      user.roles << FactoryGirl.create(:admin_role)
    end
  end

end
