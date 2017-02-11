# coding: utf-8

module Tickmarks
  class Ticks
    attr_accessor :tick_lambda, :tick_label_lambda, :label_format_lambda
    attr_accessor :a, :b
    
    def initialize a=nil, b=nil, &block
      @a = a
      @b = b
      block.(self) if block_given?
    end
  end
end

