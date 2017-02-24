# coding: utf-8

module Tickmarks
  class Ticks
    attr_accessor :tick_lambda, :tick_label_lambda, :label_format_lambda
    attr_accessor :a, :b
    attr_accessor :config
    
    def initialize a=nil, b=nil, **km, &block
      @a = a
      @b = b
      @config = km
      block.(self) if block_given?
    end

    # run through all ticks, calling the lambda fuctions, if
    # provided.
    def compute_ticks
      ostep =    (config[:overstep]  ||= 0.0)
      majors =   (config[:majors]    ||= 10)
      maxticks = (config[:max_ticks] ||= 10)
      format =   (config[:format]    ||= "%d")
      digits = Math.log10(b).floor      
      aa = a.floor(-digits)
      bb = b.ceil(-digits)
      ((0.0 - ostep) .. (1.0 + ostep))
        .step(1.0 / maxticks) { |coord|
        val = aa + (bb - aa) * coord
        maj = val.to_i % majors == 0
        
        tick_lambda.(coord, val, maj) unless tick_lambda.nil?
        tick_label_lambda.(coord, sprintf(format, val)) unless tick_label_lambda.nil? or maj == false
      }
    end
  end
end
