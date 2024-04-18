class ItemsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  #DA CORREGGERE  
  #after_action :populate_system_fields_on_create, only :create

  # GET /items or /items.json
  def index
    render 'index'
    @items = Item.all
    respond_to do |format|
        format.html
        format.csv { send_data Item.to_csv, filename: "items-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"}
    end
  end

  # GET /items/1 or /items/1.json
  def show
  end

    # GET /items/new
  def new
#    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end



  def list
    items = Item.includes(:descrizione)
    items = items.where('descrizione ilike ?', "%#{params[:descrizione]}%") if params[:descrizione].present?
    items = items.order("#{params[:column]} #{params[:direction]}")
    render(partial: 'items', locals: { items: items })
  end

  # POST /items or /items.json
  def create
#    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def tagged
    # Effettua il filtro dei dati in base ai parametri ricevuti dalla richiesta AJAX

    # RECAP STATO ELEMENTI
    # 0 = Ritirato / Scaduto
    # 1 = Valido
    # 2 = Prenotato

    @tagged_items = Item.where(stato: 2)
    render partial: 'item_tagged', locals: { items: @tagged_items }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    #    def set_item
    #      @item = Item.find(params[:id])
    #    end

    # Schema Item
		#   id: integer
		#   tipo: string
		#   materiale: string
		#   diametro: decimal
		#   lunghezza: decimal
		#   larghezza: decimal
		#   spessore: decimal
		#   descrizione: string
		#   stato: integer
		#   desc_stato: string
		#   created_by_user: string
		#   created_by_time: datetime
		#   deleted_by_user: string
		#   deleted_by_time: datetime
		#   img_path: string
		#   from_commessa: string
		#   from_disegno: string
		#   created_at: datetime
		#   updated_at: datetime



    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:tipo, :materiale, :diametro, :lunghezza, :larghezza, :spessore, :descrizione, :stato, :desc_stato, :created_by_user, :created_by_time, :deleted_by_user, :deleted_by_time, :img_path, :from_commessa, :from_disegno)
    end

    def populate_system_fields_on_create
      @user = User.current_user;
      self.created_by_user = @user.username;
      self.created_by_time = Time.now;
    end

    def testo_stato
      case stato
      when 0
        "Eliminato"
      when 1
        "Disponibile"
      when 2
        "Prenotato"
      else
        "Sconosciuto"
      end
    end
end