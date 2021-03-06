require 'spec_helper'

describe LocationsHelper do
  describe '#open_closed_arrows' do
    it 'should give me some open and closed arrows' do
      l = FactoryGirl.create(:location)
      helper.open_closed_arrows_for('foo', l.id).should == "<div class='arrow' id='foo_open_arrow_#{l.id}' style='display: none;'><img alt='open arrow' src='/assets/open_arrow.gif' /></div><div class='arrow' id='foo_closed_arrow_#{l.id}'><img alt='closed arrow' src='/assets/closed_arrow.gif' /></div>"

      helper.open_closed_arrows_for('foo').should == "<div class='arrow' id='foo_open_arrow' style='display: none;'><img alt='open arrow' src='/assets/open_arrow.gif' /></div><div class='arrow' id='foo_closed_arrow'><img alt='closed arrow' src='/assets/closed_arrow.gif' /></div>"
    end
  end

  describe '#banner' do
    it 'should give me a banner' do
      l = FactoryGirl.create(:location)
      helper.banner('cool_type', 'This is a cool type, bro', l).should == <<HERE
<div id="cool_type_banner_#{l.id}" class="sub_nav_item" onclick="toggleData('cool_type', #{l.id});">
  <span>This is a cool type, bro</span>
  #{open_closed_arrows_for('cool_type', l.id)}
</div>
HERE

      helper.banner('cool_type', 'This is a cool type, bro').should == <<HERE
<div id="cool_type_banner" class="sub_nav_item" onclick="toggleData('cool_type');">
  <span>This is a cool type, bro</span>
  #{open_closed_arrows_for('cool_type')}
</div>
HERE
    end
  end

  describe '#search_banner' do
    it 'should give me a banner' do
      l = FactoryGirl.create(:location)
      helper.search_banner('by_cool_type', 'This is a cool type, bro').should == <<HERE
<div id="by_cool_type_banner" class="search_banner">
  <span>This is a cool type, bro</span>
</div>
HERE
    end
  end
end
