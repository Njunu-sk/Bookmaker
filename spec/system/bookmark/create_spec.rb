require 'rails_helper'

RSpec.describe 'create bookmark', type: :system do
    scenario 'empty title and url' do
        visit new_bookmark_path
        click_button 'Create Bookmark'

        expect(page).to have_content("Title can't be blank")

        expect(Bookmark.count).to eq(0)
    end

    scenario 'valid title and url' do
        visit new_bookmark_path

        fill_in "Title", with: "Big shit poppin"
        fill_in "Url", with: "www.coming.com"
        click_button 'Create Bookmark'

        expect(page).to have_content("Bookmark was successfully created")

        expect(Bookmark.count).to eq(1)

        expect(Bookmark.last.title).to eq("Big shit poppin")
    end
end