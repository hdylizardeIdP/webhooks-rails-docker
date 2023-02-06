class BlogController < ApplicationController
    def index
        @test = params[:test]
    end

    def show
        @id = params[:id]
        @test = params[:test]
    end

  end