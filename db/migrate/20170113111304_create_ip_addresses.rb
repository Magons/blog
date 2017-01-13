class CreateIpAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :ip_addresses do |t|
      t.inet 'ip', null: false
      t.string :users, array:true, default: []
      t.timestamps
    end
  end
end
