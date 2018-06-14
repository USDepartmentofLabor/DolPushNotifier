class AuditsController < ApplicationController

  def users
    @audits = Audit.all
  end
end