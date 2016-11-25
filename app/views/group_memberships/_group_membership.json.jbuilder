json.extract! group_membership, :id, :group_id, :user_id, :group_name, :created_at, :updated_at
json.url group_membership_url(group_membership, format: :json)