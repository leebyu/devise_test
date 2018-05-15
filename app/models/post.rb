class Post < ApplicationRecord
  # 권한을 설정하고자 하는 모델 클래스에 resourcify 선언
  resourcify

  # make @post.updatable_by? // @post.deletable_by? method available
  # @post.updatable_by?(current_user)와 current_user.can_update?(@post)는 동일한 기능을 하게 된다.
  include Authority::Abilities

  belongs_to :user
end
