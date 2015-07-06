json.array!(@posts) do |post|
  json.extract! post, :id, :title, :no, :course, :deadline, :details, :user_id
  json.url post_url(post, format: :json)
end
