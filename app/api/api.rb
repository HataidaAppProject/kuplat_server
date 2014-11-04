class API < Grape::API
  prefix :api
  version 'v1', using: :path
  format :json

  module Categories
    circles = 1
    recruitings = 2
    seminars = 3
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
        Event.where(type: Categories.params[:category])
      end
    end

    # 指定イベント取得
    desc 'get specified event'
    params do
      requires :id, type: Integer, desc: 'Event ID'
    end
    route_param :id do
      get do
        Event.where(params[:id])
      end
    end
  end



  # カフェ一覧取得

  # ラーメン一覧取得

  # レストラン一覧取得

  # パン・スイーツ一覧取得

  # 居酒屋・バー一覧取得

  # 指定飲食店詳細取得

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
