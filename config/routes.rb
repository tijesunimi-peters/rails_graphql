Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root "root#index"
  get "products_upload", to: "products_upload#index"
  post "products_uploads", to: "products_upload#upload"
end
