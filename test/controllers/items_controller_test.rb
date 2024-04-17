require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { created_by_time: @item.created_by_time, created_by_user: @item.created_by_user, deleted_by_time: @item.deleted_by_time, deleted_by_user: @item.deleted_by_user, desc_stato: @item.desc_stato, descrizione: @item.descrizione, diametro: @item.diametro, from_commessa: @item.from_commessa, from_disegno: @item.from_disegno, img_path: @item.img_path, larghezza: @item.larghezza, lunghezza: @item.lunghezza, materiale: @item.materiale, spessore: @item.spessore, stato: @item.stato, tipo: @item.tipo } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { created_by_time: @item.created_by_time, created_by_user: @item.created_by_user, deleted_by_time: @item.deleted_by_time, deleted_by_user: @item.deleted_by_user, desc_stato: @item.desc_stato, descrizione: @item.descrizione, diametro: @item.diametro, from_commessa: @item.from_commessa, from_disegno: @item.from_disegno, img_path: @item.img_path, larghezza: @item.larghezza, lunghezza: @item.lunghezza, materiale: @item.materiale, spessore: @item.spessore, stato: @item.stato, tipo: @item.tipo } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
