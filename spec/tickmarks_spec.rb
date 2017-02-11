require 'tickmarks'
include Tickmarks

describe Tickmarks do
  it "creates a Tickmark instance" do
    expect(Ticks.new).not_to be_nil
  end

  it "sets up lambda" do
    @tm = Ticks.new(0, 1000) do |tm|
      tm.tick_lambda = ->() {}
      tm.tick_label_lambda = ->() {}
      tm.label_format_lambda = ->() {}
    end
  end
end
