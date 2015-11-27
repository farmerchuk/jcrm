class HomeController < ApplicationController
  def show; end

  def search
    query = params[:query].gsub(/[^0-9a-z]/i, '').downcase

    if params[:record_type]
      @record_type = params[:record_type].to_sym
    else
      @record_type = :none
    end

    accounts = Account.all
    contacts = Contact.all
    opportunities = Opportunity.all
    notes = Note.all
    users = User.all
    @accounts = []
    @contacts = []
    @opportunities = []
    @notes = []
    @users = []

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
