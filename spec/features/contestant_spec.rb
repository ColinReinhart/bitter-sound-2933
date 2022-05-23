require "rails_helper"

RSpec.describe "contestant page" do
  before :each do
    #Challenges
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    #projects
    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
    #Contestants
    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
    #contestant projects
    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end

  it "shows project name, material, and theme" do
    visit "/contestants"

    within "##{@jay.id}" do
    expect(page).to have_content("Jay McCarroll")
    expect(page).to have_content("News Chic")
    end

    within "##{@gretchen.id}" do
    expect(page).to have_content("Gretchen Jones")
    expect(page).to have_content("News Chic")
    expect(page).to have_content("Upholstery Tuxedo")
    end

    within "##{@kentaro.id}" do
    expect(page).to have_content("Kentaro Kameyama")
    expect(page).to have_content("Upholstery Tuxedo")
    expect(page).to have_content("Boardfit")
    end

    within "##{@erin.id}" do
      expect(page).to have_content("Erin Robertson")
      expect(page).to have_content("Boardfit")
    end

  end

end