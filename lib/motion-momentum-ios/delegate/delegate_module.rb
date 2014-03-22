module Momentum
  module DelegateModule

    def controller_from_view(view)
      if view.nextResponder.is_a? UIViewController
        return view.nextResponder
      else
        return controller_from_view(view.nextResponder)
      end
    end

  end
end