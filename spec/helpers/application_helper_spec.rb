require 'rails_helper'

describe ApplicationHelper do
  it '#active?' do
    allow(view).to receive(:current_page?).and_return(root_path)
    expect(helper.active?(root_path)).to eq 'active'
  end
end
