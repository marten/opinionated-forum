class PostsController < ApplicationController
  
  # GET /topics/1/posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /topics/1/posts
  # POST /topics/1/posts.xml
  def create
    @post = Post.new(params[:post])
    @post.topic_id = params[:topic_id]
    @post.user_id = @current_user.id

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(topic_path(@post.topic)) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1/posts/1
  # PUT /topics/1/posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1/posts/1
  # DELETE /topics/1/posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
