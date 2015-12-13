class SearchController < ApplicationController
  before_action :require_user
  before_action :load_search, only: [:search, :search_link]

  def search
    @record_type = nil
  end

  def search_link
    @record_type = params[:record_type]
    @record_id = params[:record_id]
  end

  private

  def load_search
    @accounts = []
    @contacts = []
    @opportunities = []
    @notes = []
    @users = []
    accounts = Account.all.sort_by { |account| account.search_display_name }
    contacts = Contact.all.sort_by { |contact| contact.search_display_name }
    opportunities = Opportunity.all.sort_by { |opportunity| opportunity.search_display_name }
    notes = Note.all.sort_by { |note| note.created_at }
    users = User.all.sort_by { |user| user.search_display_name }
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
