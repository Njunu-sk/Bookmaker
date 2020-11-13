require 'rails_helper'


RSpec.describe 'Static content', type: :system do
    it 'shows the static text' do
        visit static_index_path
        expect(page).to have_content('Hello test')
    end
end