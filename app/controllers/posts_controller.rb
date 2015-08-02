class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def current_model
    "#{self.class.name.gsub('Controller', '').singularize}".constantize
  end

  def index
    @posts = current_model.all
  end

  def show
  end

  def new
    @post = current_model.new
  end

  def edit
  end

  def create
    @post = current_model.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to url_for(controller: @post.class.to_s.tableize, action: :index), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = current_model.find(params[:id])
  end
end
