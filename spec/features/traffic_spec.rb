require "spec_helper"

feature 'Traffic Information', :vcr do
  scenario 'shows the overall and traffic for each zone' do
    Traffic::Scraper.should_receive(:overall_traffic).and_return(15)
    Traffic::Scraper.should_receive(:zone_traffic).and_return({
      north: 1,
      south: 2,
      east: 3,
      west: 4,
      downtown: 5
    })

    visit '/'

    within(".north") do
      page.should have_text("Norte 1 km")
    end

    within(".south") do
      page.should have_text("Sul 2 km")
    end

    within(".east") do
      page.should have_text("Leste 3 km")
    end

    within(".west") do
      page.should have_text("Oeste 4 km")
    end

    within(".downtown") do
      page.should have_text("Centro 5 km")
    end

    within(".overall") do
      page.should have_text("Total 15 km")
    end
  end
end