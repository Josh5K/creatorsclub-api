# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Users' do
      f.semantic_errors
      f.input :username
      f.input :password
      f.input :email
      f.input :profile_picture
      f.input :youtube
      f.input :facebook
      f.input :twitter
      f.input :twitch
      f.input :about
      f.input :seller, as: :check_boxes, collection: Seller.select(:seller_name, :id)
    end
    f.actions
  end
  permit_params :username, :password, :password_digest, :email, :profile_picture, :youtube, :facebook, :twitter, :twitch, :about, :seller_id, :sellers_attributes, sellers_id: []
end
