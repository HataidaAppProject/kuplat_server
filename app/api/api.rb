class API < Grape::API
  prefix :api
  version 'v1', using: :path
  format :json

  module EventCategories
    circles = 1
    recruitings = 2
    seminars = 3
  end

  module RestaurantCategories
    cafe = 1
    ramen = 2
    restaurant = 3
    sweets = 4
    bar = 5
  end

  helpers do
    def restaurant_params
     ActionController::Parameters.new(params).permit(:name, :category, :address, :image_path, :business_hours, :phone_number, :regular_holiday, :link, :latitude, :longtitude)
    end

    # パラメタのチェック
    params  :restaurant_attributes do
      requires :name, type: String, desc: 'restaurant name'
      requires :category, type: Integer, desc: 'restaurant category'
      requires :address, type: String, desc: 'restaurant address'
      requires :image_path, type: String, desc: 'restaurant image'
      requires :business_hours, type: String, desc: 'restaurant business_hours'
      requires :phone_number, type: String, desc: 'restaurant phone_number'
      requires :regular_holiday, type: String, desc: 'restaurant regular_holiday'
      optional :link, type: String, desc: 'link'
      requires :latitude, type: Float, desc: 'Event latitude'
      requires :longtitude, type: Float, desc: 'Event longtitude'
    end
  end

  # 以下にAPIを書いていく
  # ホーム画面用のAPI

  # /api/v1/events
  resource 'events' do
    # まとめて100件の情報を渡す
    desc 'provide 100 events'
    get do
      Event.limit(100)
    end

    # カテゴリごとの一覧取得
    desc 'show circle and club events'
    params do
      requires :category, type: String, desc: 'Category name'
    end
    route_param :category do
      get do
        Event.where(type: EventCategories.params[:category])
      end
    end

    # 指定イベント取得
    desc 'get specified event'
    params do
      requires :id, type: Integer, desc: 'Restaurant ID'
    end
    route_param :id do
      get do
        Event.where(params[:id])
      end
    end

    # イベント削除
    desc 'delete event'
    params do
      requires :id, type: Integer, desc: 'Event id'
    end
    route_param :id do
      delete do
        Event.find(params[:id]).destroy
      end
    end
  end

  resource 'restaurants' do
    # 100件取得
    desc 'provide 100 restaurants'
    get do
      Restaurant.limit(100)
    end

    # カテゴリごとの一覧
    desc 'show restaurants'
    params do
      requires :category, type: String, desc: 'Category name'
    end
    route_param :category do
      get do
        Restaurant.where(type: RestaurantCategories.params[:category])
      end
    end

    # 指定レストラン取得
    desc 'get specified restaurant'
    params do
      requires :id, type: Integer, desc: 'Restaurant ID'
    end
    route_param :id do
      get do
        Restaurant.where(params[:id])
      end
    end

    # 指定レストラン削除
    desc 'delete specified restaurat'
    params do
      requires :id, type: Integer, desc: 'restaurat id'
    end
    route_param :id do
      delete do
        Restaurant.find(params[:id]).destroy
      end
    end

    # レストラン登録
    desc 'create restaurat'
    params do
      use :restaurant_attributes
    end
    post do
      restaurat = Restaurant.new(restaurant_params)
      restaurat.save
    end

  end

  # 位置情報での検索結果取得

  # ユーザの周辺のイベントなどの一覧取得

  # ユーザ周り
  resource 'users' do
    # ユーザの詳細取得（ユーザに紐付けられた飲食店，イベントも一緒に渡す）
    # /api/v1/users/:id
    desc 'show user profile'
    params do
      requires :id, type: Integer, desc: "User ID"
    end
    route_param :id do
      get do
        Page.where(params[:id])
      end
    end

  end

  # 認証関連のAPI
end
