class AddCurrencyToDinner < ActiveRecord::Migration
  def change
    add_column :dinners, :currency, :string, :default => '$'
  end
end
