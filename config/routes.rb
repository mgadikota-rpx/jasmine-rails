JasmineRails::Engine.routes.draw do
  scope :specs do
    root :to => "spec_runner#index"
  end
  scope :spec do
    scope :javascripts do
      resources :fixtures, only: :show, controller: 'fixtures'
    end
  end
end
