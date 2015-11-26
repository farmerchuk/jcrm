class HomeController < ApplicationController
  def show; end

  def search
    query = params[:query].gsub(/[^0-9a-z]/i, '').downcase

    accounts = Account.all
    contacts = Contact.all
    opportunities = Opportunity.all
    notes = Note.all
    @accounts = []
    @contacts = []
    @opportunities = []
    @notes = []

    accounts.each do |account|
      if query =~ /#{account.search_key}/
        @accounts << account
      end
    end

    contacts.each do |contact|
      if query =~ /#{contact.search_key}/
        @contacts << contact
      end
    end

    opportunities.each do |opp|
      if query =~ /#{opp.search_key}/
        @opportunities << opp
      end
    end

    notes.each do |note|
      if query =~ /#{note.search_key}/
        @notes << note
      end
    end

  end

end
