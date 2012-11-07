class CreateGetAccessTokens < ActiveRecord::Migration
  def self.up
    create_table :get_access_tokens do |t|
      t.string :token
      t.timestamps
    end
  end

  def self.down
    drop_table :get_access_tokens
  end
end
