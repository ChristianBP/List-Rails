class PublicController < ApplicationController

  layout false

  def index
    render('sign_in')
  end

  def sign_in
  end

  def login
    render('list')
  end
end
