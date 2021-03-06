require 'spec_helper'

describe Machine do
  before(:each) do
    @l = FactoryGirl.create(:location)
    @m = FactoryGirl.create(:machine, :name => 'Sassy')
    @lmx = FactoryGirl.create(:location_machine_xref, :location => @l, :machine => @m)
    @msx = FactoryGirl.create(:machine_score_xref, :location_machine_xref => @lmx)
  end

  describe '#before_destroy' do
    it 'should clean up location_machine_xrefs, events, location_picture_xrefs' do
      @m.destroy

      Machine.all.should == []
      LocationMachineXref.all.should == []
      MachineScoreXref.all.should == []
    end
  end
end
