class AddEsAdminToUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :es_admin, :boolean, default: false
  end
end
