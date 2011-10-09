class ItemsController < ApplicationController
    # GET /items
    # GET /items.xml
    def index
      @items = Item.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @items }
      end
    end

    # GET /items/1
    # GET /items/1.xml
    def show
      @item = Item.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @item }
      end
    end

    # GET /items/new
    # GET /items/new.xml
    def new
      @item = Item.new
      respond_to do |format|
        format.html # new.html.erb
        format.js   # new.js.rjs
        format.xml  { render :xml => @item }
      end
    end

    # GET /items/1/edit
    def edit
      @item = Item.find(params[:id])
      respond_to do |format|
        format.html # edit.html.erb
        format.js   # edit.js.rjs
      end
    end

    # POST /items
    # POST /items.xml
    def create
      @item = Item.new(params[:item])
      respond_to do |format|
        if @item.save
          flash[:notice] = 'O item foi criado com sucesso.'
          format.html { redirect_to(@item) }
          format.js
          format.xml  { render :xml => @item, :status => :created, :location => @item }
        else
          error_respond(format, "new");
        end
      end
    end

    # PUT /items/1
    # PUT /items/1.xml
    def update
      @item = Item.find(params[:id])

      respond_to do |format|
        if @item.update_attributes(params[:item])
          flash[:notice] = 'O item foi actualizado com sucesso.'
          format.html { redirect_to(@item) }
          format.js
          format.xml  { head :ok }
        else
          error_respond(format, "edit");
        end
      end
    end

    # DELETE /items/1
    # DELETE /items/1.xml
    def destroy
      @item = Item.find(params[:id])
      @item.destroy

      respond_to do |format|
        format.html { redirect_to(items_url) }
        format.js
        format.xml  { head :ok }
      end
    end

    def cancel
      @item = nil
      if !params[:id].nil?
        @item = Item.find(params[:id])
      end
      respond_to do |format|
        format.html { redirect_to(items_url) }
        format.js
      end
    end

  private

    def error_respond(format, action)
      format.html { render :action => action }
      format.js { render :action => "error.js.rjs" }
      format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
    end
end
