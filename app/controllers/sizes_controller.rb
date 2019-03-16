class SizesController < ApplicationController
    def index
        @sizes = Size.all
    end

    def new
        @size = Size.new()
    end

    def create
        Size.create(size_params)
        redirect_to sizes_path
    end

    private
    def size_params
        params.require(:size).permit(:size)
    end
end
