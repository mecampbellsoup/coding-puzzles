require 'pry'

class Hash
  # customize method_missing to enable dot notation on hash keys
  def method_missing(method_sym, *args, &block)
    if r_has_key?(method_sym.to_s)
      self[method_sym.to_s]
    else
      super
    end
  end

  def r_has_key?(arg, hash = self)
    @checker ||= false
    hash.each do |key, value|
      if hash.has_key?(arg)
        return @checker = true
      elsif hash[key].is_a? Hash
        r_has_key?(arg, hash[key])
      end
    end
    @checker
  end
end