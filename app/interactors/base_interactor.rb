module BaseInteractor
  def self.included(klass)
    klass.extend ClassMethods
  end

  def attribute_exists?(method_name)
    context.public_send(method_name).present?
  end

  def method_valid?(method_name)
    send(method_name)&.present? || false
  end

  module ClassMethods
    def requires(*args)
      before do
        args.each do |arg|
          context.fail!(error: ":#{arg} cant be nil") unless attribute_exists?(arg)
        end
      end

      delegate(*args, to: :context)
    end

    def validate(*args)
      before do
        args.each do |arg|
          next if method_valid?(arg)

          context.fail!(error: "##{arg} returned false")
        end
      end
    end
  end
end
