require 'spec_helper'

describe Location do
  before(:each) do
    @l = Factory.create(:location)
    @m1 = Factory.create(:machine, :name => 'Sassy')
    @m2 = Factory.create(:machine, :name => 'Cleo')
    @lmx1 = Factory.create(:location_machine_xref, :location => @l, :machine => @m1)
    @lmx2 = Factory.create(:location_machine_xref, :location => @l, :machine => @m2)
  end

  describe '#location_machine_xrefs' do
    it 'should return all machines for this location' do
      @l.location_machine_xrefs.should == [@lmx2, @lmx1]
    end
  end

  describe '#machine_names' do
    it 'should return all machine names for this location' do
      @l.machine_names.should == ['Cleo', 'Sassy']
    end
  end

  describe '#content_for_infowindow' do
    it 'generate the html that the infowindow wants to use' do
      l = Factory.create(:location)
      ['Foo', 'Bar', 'Baz', "Beans'"].each {|name| Factory.create(:location_machine_xref, :location => l, :machine => Factory.create(:machine, :name => name)) }

      l.content_for_infowindow.chomp.should == "'<div class=\"infowindow\">Test Location Name<br />123 Pine<br />Portland, OR, 97211<br /><br /><hr /><br />Bar<br />Baz<br />Beans\\'<br />Foo<br /></div>'"
    end
  end
end
