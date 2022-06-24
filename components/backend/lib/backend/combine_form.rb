module Backend
  module CombineForm

    def self.create(form)
      if form.is_a?(Backend::JsjForm)
        Backend::CombineForm::JsjFormInst.new(form)
      else
        Backend::CombineForm::FormInst.new(form)
      end
    end

    
  end
end