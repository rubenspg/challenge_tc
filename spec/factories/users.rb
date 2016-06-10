FactoryGirl.define do
  factory :user do
    pwd = Faker::Internet.password

    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { pwd }

    factory :admin do
      admin { true }
    end

    factory :user_with_events do
      transient do
        events_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:event, evaluator.events_count, user: user)
      end
    end
  end
end
