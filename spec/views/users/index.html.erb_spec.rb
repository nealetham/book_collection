# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               username: 'Username1'
             ),
             User.create!(
               username: 'Username2'
             )
           ])
  end

  it 'renders a list of users' do
    render

    assert_select 'table tbody tr', count: 3
    assert_select 'table tbody tr td', text: 'Username1'
    assert_select 'table tbody tr td', text: 'Username2'
  end
end
