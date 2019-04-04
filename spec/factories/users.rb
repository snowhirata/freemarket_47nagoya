FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"佐藤"}
    first_name            {"優樹"}
    last_name_kana        {"サトウ"}
    first_name_kana        {"ユウキ"}
    birth_year            {"2000-01-01"}
  end

end
