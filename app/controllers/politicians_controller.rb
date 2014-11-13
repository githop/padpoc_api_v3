class PoliticiansController < ApplicationController
	def index
		@poli = Politician.where(nil)
		filtering_params(params).each do |key, val|
			@poli = @poli.public_send(key, val) if val.present?
		end
		render json: @poli, each_serializer: SlimPoliSerializer
	end

	def show
		render json: Politician.find(params[:id])
	end

	#post route -- non-idempotent
	def contributions
		Politician.includes(contribution: [:organizations, :industries, :word_counts]).find(params[:id]).fetch_all_contributions
		render json: Politician.includes(contribution: [:organizations, :industries, :word_counts]).find(params[:id])
	end



	private
	def default_serializer_options
		{
			root: false
		}
	end

	def filtering_params(params)
		params.slice(:first_name, :last_name, :state, :q, :full_name)
	end
end
