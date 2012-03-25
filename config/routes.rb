Rails.application.routes.draw do
  namespace :jqvr do
    match 'validations/uniqueness' => 'validations#uniqueness'
  end
end