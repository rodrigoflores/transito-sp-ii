require "spec_helper"

feature 'Traffic Information', :vcr do
  scenario 'shows the overall and traffic for each zone' do
    Traffic::Scraper.should_receive(:overall_traffic).and_return(4)
    Traffic::Scraper.should_receive(:zone_traffic).and_return({
      north: 0,
      south: 2,
      east: 0,
      west: 0,
      downtown: 2
    })

    visit '/'

    within(".north") do
      page.should have_text("Norte 0 km")
    end

    within(".south") do
      page.should have_text("Sul 2 km")
    end

    within(".east") do
      page.should have_text("Leste 0 km")
    end

    within(".west") do
      page.should have_text("Oeste 0 km")
    end

    within(".downtown") do
      page.should have_text("Centro 2 km")
    end

    within(".overall") do
      page.should have_text("Total 4 km")
    end
  end
end