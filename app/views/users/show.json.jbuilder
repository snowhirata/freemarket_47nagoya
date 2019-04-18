json.array! @child_categories do |child_category|
  json.id child_category.id
  json.name child_category.name
end

json.array! @grand_child_categories do |grand_child_category|
  json.id grand_child_category.id
  json.name grand_child_category.name
end
