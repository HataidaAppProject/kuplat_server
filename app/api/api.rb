class API < Grape::API
  prefix :api
  version 'v1', using: :path
  format :json
  # 以下にAPIを書いていく
  resource 'users' do
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
end
