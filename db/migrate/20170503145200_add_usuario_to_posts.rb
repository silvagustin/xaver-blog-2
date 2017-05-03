class AddUsuarioToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :usuario, foreign_key: true
  end
end
