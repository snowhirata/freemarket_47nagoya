class RenameCommentToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment, :text
  end
end
