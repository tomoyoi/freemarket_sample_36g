crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link "マイページ", users_mypage_url
end

crumb :items do
  link "出品商品画面", items_url
  parent :user
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).