class DashboardController < ApplicationController
	before_filter :authenticate_user!
	before_filter :is_admin_filter

	def index

	end
end
