crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :profile do
  link "プロフィール", profile_user_path
  parent :mypage
end

crumb :address_edit do
  link "発送元・お届け先住所変更", edit_user_address_path(current_user,current_user.address)
  parent :mypage
end

crumb :address_new do
  link "発送元・お届け先住所登録", new_user_address_path(current_user)
  parent :mypage
end

crumb :credit_edit do
  link "クレジットカード編集", edit_user_credit_path(current_user,current_user.credit)
  parent :mypage
end

crumb :credit_new do
  link "クレジットカード登録", new_user_credit_path(current_user)
  parent :mypage
end

crumb :credit_index do
  link "クレジットカード一覧", card_index_user_path(current_user)
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_user_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_path
  parent :mypage
end

crumb :show do |item|
  link item.name, root_path
end

crumb :search do |keyword|
  link params[:keyword], search_path
  parent :root
end

#カテゴリー追加後実装 名称は適宜変更お願いします
crumb :category do |category|
  link category.name, category_path
  parent :root
end

# crumb :child_category do |child_category|
#   link child_category.name, child_category_path
#   parent :category,child_category.category
# end

# crumb :grandchildren_category do |grandchildren_category|
#   link grandchildren_category.name, grandchildren_category_path
#   parent :children_category,grandchildren_category.children_category
# end


#ブランド追加後実装 名称は適宜変更お願いします
# crumb :brand do |brand|
#   link brand.name, brand_path
#   parent :root
# end
