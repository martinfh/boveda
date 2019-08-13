require "application_system_test_case"

class ObragaleriaTest < ApplicationSystemTestCase
  setup do
    @obragalerium = obragaleria(:one)
  end

  test "visiting the index" do
    visit obragaleria_url
    assert_selector "h1", text: "Obragaleria"
  end

  test "creating a Obragalerium" do
    visit obragaleria_url
    click_on "New Obragalerium"

    fill_in "Artista", with: @obragalerium.artista
    fill_in "Año", with: @obragalerium.año
    fill_in "Disponibilidad", with: @obragalerium.disponibilidad
    fill_in "Imagenes", with: @obragalerium.imagenes
    fill_in "Medidas", with: @obragalerium.medidas
    fill_in "Precio", with: @obragalerium.precio
    fill_in "Tecnica", with: @obragalerium.tecnica
    fill_in "Titulo", with: @obragalerium.titulo
    fill_in "Vendido", with: @obragalerium.vendido
    click_on "Create Obragalerium"

    assert_text "Obragalerium was successfully created"
    click_on "Back"
  end

  test "updating a Obragalerium" do
    visit obragaleria_url
    click_on "Edit", match: :first

    fill_in "Artista", with: @obragalerium.artista
    fill_in "Año", with: @obragalerium.año
    fill_in "Disponibilidad", with: @obragalerium.disponibilidad
    fill_in "Imagenes", with: @obragalerium.imagenes
    fill_in "Medidas", with: @obragalerium.medidas
    fill_in "Precio", with: @obragalerium.precio
    fill_in "Tecnica", with: @obragalerium.tecnica
    fill_in "Titulo", with: @obragalerium.titulo
    fill_in "Vendido", with: @obragalerium.vendido
    click_on "Update Obragalerium"

    assert_text "Obragalerium was successfully updated"
    click_on "Back"
  end

  test "destroying a Obragalerium" do
    visit obragaleria_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Obragalerium was successfully destroyed"
  end
end
