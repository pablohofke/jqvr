Rails.application.routes.draw do
  match 'jqvr/validations/uniqueness' => 'validations#uniqueness'
end