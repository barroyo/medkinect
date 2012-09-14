class AddKinectAngleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kinect_angle, :float

  end
end
