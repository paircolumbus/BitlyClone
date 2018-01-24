class AddShortenedAddressSuffixToUrl < ActiveRecord::Migration
  def change
  	add_column :urls, :shortened_address_suffix, :string
  end
end
