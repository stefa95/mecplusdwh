require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Created by time", with: @item.created_by_time
    fill_in "Created by user", with: @item.created_by_user
    fill_in "Deleted by time", with: @item.deleted_by_time
    fill_in "Deleted by user", with: @item.deleted_by_user
    fill_in "Desc stato", with: @item.desc_stato
    fill_in "Descrizione", with: @item.descrizione
    fill_in "Diametro", with: @item.diametro
    fill_in "From commessa", with: @item.from_commessa
    fill_in "From disegno", with: @item.from_disegno
    fill_in "Img path", with: @item.img_path
    fill_in "Larghezza", with: @item.larghezza
    fill_in "Lunghezza", with: @item.lunghezza
    fill_in "Materiale", with: @item.materiale
    fill_in "Spessore", with: @item.spessore
    fill_in "Stato", with: @item.stato
    fill_in "Tipo", with: @item.tipo
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Created by time", with: @item.created_by_time
    fill_in "Created by user", with: @item.created_by_user
    fill_in "Deleted by time", with: @item.deleted_by_time
    fill_in "Deleted by user", with: @item.deleted_by_user
    fill_in "Desc stato", with: @item.desc_stato
    fill_in "Descrizione", with: @item.descrizione
    fill_in "Diametro", with: @item.diametro
    fill_in "From commessa", with: @item.from_commessa
    fill_in "From disegno", with: @item.from_disegno
    fill_in "Img path", with: @item.img_path
    fill_in "Larghezza", with: @item.larghezza
    fill_in "Lunghezza", with: @item.lunghezza
    fill_in "Materiale", with: @item.materiale
    fill_in "Spessore", with: @item.spessore
    fill_in "Stato", with: @item.stato
    fill_in "Tipo", with: @item.tipo
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
