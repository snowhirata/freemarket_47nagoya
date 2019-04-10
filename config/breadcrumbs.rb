crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_user_path
  parent :mypage
end

crumb :register_card do
  link "支払い方法", credits_path
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

#検索機能追加後実装 名称は適宜変更お願いします
# crumb :search do |keyword|
#   link params[:keyword], search_items_path
#   parent :root
# end

#カテゴリー追加後実装 名称は適宜変更お願いします
# crumb :category do |category|
#   link category.name, category_path
#   parent :root
# end

# crumb :children_category do |children_category|
#   link children_category.name, children_category_path
#   parent :category,children_category.category
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
