class AuditsController < ApplicationController

  def users
    @audits = Audit.all.order(:created_at => "DESC").page
  end
end