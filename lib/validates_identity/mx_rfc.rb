# frozen_string_literal: true

require 'validates_identity'
require_relative 'mx_rfc/version'

class ValidatesIdentity
  module MxRfc
    autoload :LegalValidator, 'validates_identity/mx_rfc/legal_validator'
    autoload :PersonValidator, 'validates_identity/mx_rfc/person_validator'
  end
end

# Legal
ValidatesIdentity.register_legal_identity_type('MX_RFCL', ValidatesIdentity::MxRfc::LegalValidator)
ValidatesIdentity::ShouldaMatchers.register_legal_allowed_values('MX_RFCL', %w[DSR850311SA3])
ValidatesIdentity::ShouldaMatchers.register_legal_disallowed_values('MX_RFCL', %w[HEGG560427MVCRRL04 DSRT850311SA3])
# Person
ValidatesIdentity.register_person_identity_type('MX_RFCP', ValidatesIdentity::MxRfc::PersonValidator)
ValidatesIdentity::ShouldaMatchers.register_person_allowed_values('MX_RFCP', %w[DSRT850311SA3])
ValidatesIdentity::ShouldaMatchers.register_person_disallowed_values('MX_RFCP', %w[HEGG560427MVCRRL04 DSR850311SA3])
