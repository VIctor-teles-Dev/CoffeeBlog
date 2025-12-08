class PagesController < ApplicationController
  def home
  end

  def about

  end

  def project
    @projects = ProjectService.new.fetch_projects
  end



  def setup
  end

  def contact
  end
end
