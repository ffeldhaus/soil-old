class FieldController < ApplicationController
  def new
    @field = Field.new
  end

  private
  def field_params
    params.require(:field).permit(:parcels)
  end
end
