class FieldController < ApplicationController
  def new
    @field = Field.new
  end
end
