class ZipcodesController < ApplicationController
	def index
		@zip = Zipcode.includes(:politician).where(nil)
		@zip = @zip.zip(params[:zip]) if params[:zip].present?
		@zip.each_with_object([]) {|zip, a| a << zip.politician }
		render json: @zip, each_serializer: SlimPoliSerializer
	end

	private
	def default_serializer_options
		{
			root: false
		}
	end
end
