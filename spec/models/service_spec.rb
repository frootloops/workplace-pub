require 'spec_helper'

describe Service do
  let(:profiles) { { hairdresser: 0, piercing: 4, tailor: 2, tattoo: 3, visagist: 1 } }

  it { should have_many(:workstations).dependent(:destroy) }
  it { should have_many(:user_services).dependent(:destroy) }
  it { should have_many(:users).through(:user_services) }
  it { should have_many(:samples).dependent(:destroy) }

  it { should validate_presence_of(:profile_cd) }
  it { should validate_presence_of(:name) }


  describe ".sections" do
    it { expect(Service.profiles).to eql(profiles) }
  end
end
