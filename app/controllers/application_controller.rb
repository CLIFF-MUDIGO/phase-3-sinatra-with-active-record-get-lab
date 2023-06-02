# app/controllers/application_controller.rb

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/bakeries' do
    content_type :json
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    content_type :json
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    content_type :json
    baked_goods = BakedGood.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    content_type :json
    most_expensive_good = BakedGood.order(price: :desc).first
    most_expensive_good.to_json
  end
end
