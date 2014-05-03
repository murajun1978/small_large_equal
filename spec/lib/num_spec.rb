require 'num'

describe Num do
  let(:num){Num.new(arg)}
  
  context "with a big" do
    let(:arg){"2 1\n"}
    it "is a big" do
      expect(num.match).to eq "2 > 1"
    end
  end

  context "with a small" do
    let(:arg){"1 2\n"}
    it "is a small" do
      expect(num.match).to eq "1 < 2"
    end
  end

  context "with a equal" do
    let(:arg){"1 1\n"}
    it "is a equal" do
      expect(num.match).to eq "1 == 1"
    end
  end

  context "with raise error" do
    let(:arg){"e e\n"}
    it "has raise error" do
      expect{num.match}.to raise_error
    end

    context "with a zenkaku" do
      let(:arg){"あ 1\n"}
      it "has raise error" do
        expect{num.match}.to raise_error
      end
    end
  end


  context "with a zenkaku" do
    let(:arg){"１ １"}
    it "is a equal" do
      expect(num.match).to eq "1 == 1"
    end
  end

  context "with a zenkaku space" do
    let(:arg){"１　１"}
    it "is a equal" do
      expect(num.match).to eq "1 == 1"
    end
  end

  context "with a zenkaku space" do
    let(:arg){"1　1"}
    it "is a equal" do
      expect(num.match).to eq "1 == 1"
    end
  end
end
