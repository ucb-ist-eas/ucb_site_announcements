class CreateUcbSiteAnnouncementsAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :ucb_site_announcements_announcements do |t|
      t.string :message, null: false
      t.string :category, null: false
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :enabled, null: false, default: true
      t.timestamps
    end

    add_index :ucb_site_announcements_announcements, :start_time
    add_index :ucb_site_announcements_announcements, :end_time
  end
end
