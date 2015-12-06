class HomeController < ApplicationController
  before_action :load_search, only: [:search, :search_link]

  def show; end

  def search
    @record_type = nil
  end

  def search_link
    @record_type = session[:active_record][:type]
  end

  private

  def load_search
    @accounts = []
    @contacts = []
    @opportunities = []
    @notes = []
    @users = []
    accounts = Account.all
    contacts = Contact.all
    opportunities = Opportunity.all
    notes = Note.all
    users = User.all
    query = params[:query].gsub(/[^0-9a-z]/i, '').downcase

    accounts.each do |account|
      if account.search_key =~ /#{query}/
        @accounts << account
      end
    end

    contacts.each do |contact|
      if contact.search_key =~ /#{query}/
        @contacts << contact
      end
    end

    opportunities.each do |opportunity|
      if opportunity.search_key =~ /#{query}/
        @opportunities << opportunity
      end
    end

    notes.each do |note|
      if note.search_key =~ /#{query}/
        @notes << note
      end
    end

    users.each do |user|
      if user.search_key =~ /#{query}/
        @users << user
      end
    end
  end

end
