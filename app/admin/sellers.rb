# frozen_string_literal: true

ActiveAdmin.register Seller do
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
    f.inputs 'Seller' do
      f.semantic_errors
      f.inputs
      f.input :user, as: :check_boxes, collection: User.select(:email, :id)
    end
    f.actions
  end

  permit_params :user_id, :category, :active, :user_id, :sellers_title, :sellers_name, users: []
end
