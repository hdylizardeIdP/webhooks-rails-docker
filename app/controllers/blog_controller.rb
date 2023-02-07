class BlogController < ApplicationController
    def index
        @test = params[:test]
    end

    def show
        @id = params[:id]
        @test = params[:test]
    end

    # Compare this snippet from app/controllers/blog_controller.rb:

  end