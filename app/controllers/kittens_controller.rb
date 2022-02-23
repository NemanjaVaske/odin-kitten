class KittensController < ApplicationController

    def index
        @kittens = Kitten.all
        respond_to do |format|
            format.json { render :json => @kittens }
        end
    end

    def show
        @kitten = Kitten.find(params[:id])
        respond_to do |format|
            format.json { render :json => @kitten }
        end
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            flash[:sucess] = "Kitten is saved! "
            redirect_to root_path
        else
            flash[:error] = "There is some problem, try again!"
            render :new
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update(kitten_params)
            flash[:sucess] = "Kitten is updated!"
            redirect_to root_path
        else
            flash[:error] = "There is some problem, try again!"
            render :edit
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        redirect_to root_path
    end

    private
    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
