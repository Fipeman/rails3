ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    table_for users do |t|
      t.column("name"){ |user| user.id}
      t.column("name"){ |user| user.name}
      t.column("email"){ |user| user.email}
      t.column("image_url"){ |user| user.image_url}
      t.column("created_at"){ |user| user.created_at}
      t.column("tweets"){ |user| user.tweets.count}
      t.column("likes"){ |user| user.likes.count}
      t.column("retweets"){ |user| user.retweets.count}
      # id_column
    # column :name
    # column :email
    # column :image_url
    # column :tweets 
    # column :likes
    # column :retweets
    # column :created_at
    
    actions
    end
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :image_url
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
