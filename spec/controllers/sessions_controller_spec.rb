require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

	it 'shows the login form' do
		get :new
		expect(response).to render_template(:new)
	end
end