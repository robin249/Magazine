class Comment < ActiveRecord::Base
  
  # attr_accessible :content, :parent_id, :commentable_id, :commentable_type
  # attr_accessor :parent_id
  belongs_to :commentable, :polymorphic => true
   has_many :comments, :as => :commentable, :dependent => :destroy
end
