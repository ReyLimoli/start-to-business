class InvestorsController < ApplicationController
    def index
        @investors = User.where.not(amount_available_to_invest: nil)
    end
end