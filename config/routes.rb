Rails.application.routes.draw do
  match ':validations/:uniqueness' => 'validations#uniqueness', :as => :uniqueness
end