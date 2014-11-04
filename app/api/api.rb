class API < Grape::API
  prefix :api
  version 'v1', using: :path
  format :json
  # 以下にAPIを書いていく
  # ホーム画面用のAPI

  # /api/v1/events
  resource 'events' do
    # まとめて100件の情報を渡す
    desc 'provide 100 events'
    get do
      # TODO ちゃんと調べる
      Event.all.limit(100)
    end
    # サークル・部活イベント一覧取得
    desc 'show circle and club events'
    get do
      Event.where(type: 1)
    end
    # 就活イベント一覧取得
    desc 'show recruit events'
    get do
      Event.where(type: 2)
    end
  # セミナー・他イベント取得
  end


  # 指定イベント取得

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
