class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:location, :string)
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :money)
    end

    create_table(:brands_stores) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)
    end
  end
end
