class Key

  def self.generate
    rand(99999).to_s.rjust(5, "0")
  end
end
