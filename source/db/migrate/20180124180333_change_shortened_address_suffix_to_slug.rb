class ChangeShortenedAddressSuffixToSlug < ActiveRecord::Migration
  def change
  	rename_column :urls, :shortened_address_suffix, :slug
  end
end
