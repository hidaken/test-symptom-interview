source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'mysql2', '~> 0.3.20'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


#新規追加項目
# 初期データ登録用。重複等せず初期データを投入できる。
gem 'seed-fu', '~>2.3'

#エラーメッセージの日本語化
gem 'rails-i18n'

gem 'jquery-turbolinks'


gem 'therubyracer' # javascript runtime。lessをコンパイルするために必要
gem 'less-rails' # Railsでlessを使えるようにする。Bootstrapがlessで書かれているため
gem 'twitter-bootstrap-rails' # Bootstrapの本体
gem 'kaminari' #kaminari(ページ送り機能）の追加
gem 'bootstrap-sass', '3.2.0.0'
gem 'pry-byebug', group: :development

gem 'ransack' #検索用gem ransack

gem 'active_attr' #テーブル無しクラスの定義


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  #アセットパイプラインのエラーを出さない
  gem 'quiet_assets'

  #N+1検出のためのbullet導入
  gem 'bullet', :group => :development
  
end

