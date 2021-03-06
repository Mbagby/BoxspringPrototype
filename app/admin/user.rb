# email             :string
# first_name 		    :string
# last_name				  :string
# company_id 			  :string
# employee_id  			:string
# avatar 		        :text
# user_type         :integer

ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :avatar, :user_type
  controller do
    def scoped_collection
      super.single_users
    end
  end
  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :user_type
    column 'Avatar' do |user|
      image_tag user.avatar.url, width:100, height: 100 if user.avatar.present?
    end
    actions
  end

  # show do
  #   render 'user_detail', { user: user }
  # end

  filter :first_name
  filter :last_name
  filter :email
  form do |f|
    f.inputs "Single User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confiratmin
      f.input :user_type
      f.input :avatar
    end
    f.actions
  end
end
