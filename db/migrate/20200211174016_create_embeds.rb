class CreateEmbeds < ActiveRecord::Migration[6.0]
  def change
    create_table :embeds do |t|
      t.string :url

      t.timestamps
    end
  end
end
