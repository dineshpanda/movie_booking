class CreateMoviesTheaters < ActiveRecord::Migration
  def change
    create_table :movies_theaters, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :theater
    end
  end
end
