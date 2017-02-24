require 'tickmarks'
include Tickmarks

describe Tickmarks do
  it "creates a Tickmark instance" do
    expect(Ticks.new).not_to be_nil
  end

  it "sets up lambda" do
    @tm = Ticks.new(0...1000) do |tm|
      tm.tick_lambda = ->() {}
      tm.tick_label_lambda = ->() {}
      tm.label_format_lambda = ->() {}
    end
  end

  it "runs through 11 ticks" do
    @tm = Ticks.new(128...512,
                    max_ticks: 100,
                    majors: 10,
                    overstep: 0.0) do |tm|
      tm.tick_lambda = ->(coord, value, major) {
        printf "tick: coord=%f val=%d major=%s\n", coord, value, major
      }
      
      tm.tick_label_lambda = ->(coord, label) {
        printf "label: %s \n", label
      }      
    end
    @tm.compute_ticks
  end  
end
