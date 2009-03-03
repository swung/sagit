module Sagit
  class Shiphome < Sequel::Model
    set_primary_key [:id]
    set_schema do
      serial :id
      text :name
      text :permalink
      text :uri
      text :lang
      text :jdeversion
      timestamp :start_at
      timestamp :end_at
      text :result
      text :bugs
    end
  end
end

#Sagit::Shiphome.create_table unless Sagit::Shiphome.table_exists?
