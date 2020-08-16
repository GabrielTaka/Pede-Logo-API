class AddColumnGeolocalToAddress < ActiveRecord::Migration[6.0]
  def change
    enable_extension "postgis"
    add_column :addresses, :geolocal, :st_point, geographic: true
    add_index :addresses, :geolocal, using: :gist
  end
end
