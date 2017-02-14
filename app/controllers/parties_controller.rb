class PartiesController < ApplicationController
  def index
    # This is a option to sort parties based on the host_name attribute
    @parties = Party.all.sort_by(&:host_name.downcase)

    #if !params[:sort].blank?
      #order = "#{params[:sort]} #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      #Party.order(order).all.each do |party|
        #@parties << party
      #end
    #else
      #order = "when #{(params[:asc].blank? || params[:asc] == 'true') ? 'DESC' : 'ASC'}"
      #@parties = Party.order(order).all
    #end

  end

  def new
    @party = Party.new
    # so the view shows 0 and not blank
    @party.numgsts = 0
  end

  def create
    @party = Party.new(party_params)

    # If the user removes 0 from the view, we set it 0 again
    # We are already doing this in the model
    #if params[:party][:numgsts].blank?
      #params[:party][:numgsts]=0
    #end

    # We do not need to set up @party.attributes
    # @party.attributes = params[:party]

    #binding.pry
    if @party.save
      # if end is blank, set to end of day
      # We can put this validation in the model
      #if @party.when_its_over.blank?
        #@party.when_its_over=@party.when.end_of_day
        #@party.save
      #end
      #@party.after_save
      #redirect_to parties_url
      flash[:notice] = "Party was saved!"
      redirect_to parties_url
    else
      flash[:alert]="Party was incorrect."
      render 'new'
    end
  end

  private

  def party_params
      params.require(:party).permit(:host_name, :host_email, :numgsts, :guest_names, :venue, :location, :theme,
                                   :when, :when_its_over, :descript)
    end

end
