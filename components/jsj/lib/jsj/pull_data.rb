module Jsj
  module PullData
    def self.pull_all
      backup_db
      Backend::JsjForm.all.each do |form|
        pull_form( form.form_identify )
      end
      backup_db
    end

    def self.pull_online_forms
      backup_db
      forms = Jsj::FormInfos.get_form_group(:online)

      pull_forms(forms)
      backup_db
    end

    def self.pull_email_forms
      backup_db
      forms = Jsj::FormInfos.get_form_group(:email) +
       Jsj::FormInfos.get_form_group(:email_country)

       pull_forms(forms)
       backup_db
    end

    def self.pull_dongshi_forms
      backup_db
      forms = Jsj::FormInfos.get_form_group(:dong_shi)

       pull_forms(forms)
       backup_db
    end

    def self.pull_forms(forms)
      forms.each do |f|
        pull_form( f[:form_identify] )
      end
    end

    def self.pull_form(form_identify)
      PullForm.new(form_identify).pull_form
    end

    def self.pull_from(form_identify, next_num)
      PullForm.new(form_identify).pull_from(next_num)
    end

    def self.backup_db
      # Jsj::Backup.backup_db
    end

    private



  end
end
