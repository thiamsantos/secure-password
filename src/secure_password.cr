module SecurePassword
  PRINTABLE_CHARS = 32..126
  WORDS = ["123456", "password", "qwerty"]

  enum Strength
    WEAK
    NORMAL
    STRONG
    UNBELIEVABLE
  end

  class Generator
    def initialize(@strength : Strength)
    end

    def generate
      case @strength
      when Strength::WEAK
        WORDS.sample
      when Strength::NORMAL
        random 16
      when Strength::STRONG
        random 32
      when Strength::UNBELIEVABLE
        random 256
      else
        raise "unknown strength: #{@strength}"
      end
    end

    def random(size)
      Array.new(size){rand(PRINTABLE_CHARS).chr}.join
    end
  end
end