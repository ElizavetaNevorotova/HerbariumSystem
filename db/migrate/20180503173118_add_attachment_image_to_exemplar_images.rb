class AddAttachmentImageToExemplarImages < ActiveRecord::Migration::Current
  def self.up
    change_table :exemplar_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :exemplar_images, :image
  end
end
