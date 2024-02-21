require 'capybara'
require 'capybara/dsl'

describe "Example page render unit tests" do
    it "should show the Explore California logo" do
        visit('/')
        expect(page.has_selector? 'a.logo').to be true
    end
end