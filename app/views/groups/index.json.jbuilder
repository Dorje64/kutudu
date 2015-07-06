json.array!(@groups) do |group|
  json.extract! group, :id, :groupname, :admin, :count
  json.url group_url(group, format: :json)
end
