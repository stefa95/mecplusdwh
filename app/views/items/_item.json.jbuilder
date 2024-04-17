json.extract! item, :id, :tipo, :materiale, :diametro, :lunghezza, :larghezza, :spessore, :descrizione, :stato, :desc_stato, :created_by_user, :created_by_time, :deleted_by_user, :deleted_by_time, :img_path, :from_commessa, :from_disegno, :created_at, :updated_at
json.url item_url(item, format: :json)
