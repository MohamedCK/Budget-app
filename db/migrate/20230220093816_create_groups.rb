class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: 'https://th.bing.com/th/id/R.bbd92d64f5c944c8deb186f221857c0e?rik=qkpNCm0avpbgcA&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_317099.png&ehk=ku2fAarDstuuq2N4Mi6LoH%2b2xZf0aTKTtW5FHlDfymE%3d&risl=&pid=ImgRaw&r=0'
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
