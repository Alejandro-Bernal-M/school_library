class Nameable
  def correct_name 
    raise NotImplementedErrorr, "#{self.class} has not implemented method '#{__method__}'"
  end
end
