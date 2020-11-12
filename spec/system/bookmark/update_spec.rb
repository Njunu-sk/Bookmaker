require 'rails_helper'

RSpec.describe 'update bookmark', type: :system do
    let!(:bookmark) { Bookmark.create(url: 'www.coming.com', title: 'Big shit poppin')}

    scenario 'empty title and url' do
        visit bookmarks_path

        click_link 'Edit'

        fill_in 'Title', with: ''
        fill_in 'Url', with: ''

        click_button 'Update Bookmark'

        expect(page).to have_content("Title can't be blank")
    end

    scenario 'valid title and url' do
        visit bookmarks_path

        click_link 'Edit'

        fill_in 'Title', with: 'Big'
        fill_in 'Url', with: 'www.comingsoon.com'

        click_button 'Update Bookmark'

        expect(page).to have_content("Bookmark was successfully updated")

        expect(bookmark.reload.title).to eq('Big')
        expect(bookmark.reload.url).to eq('www.comingsoon.com')
    end
end