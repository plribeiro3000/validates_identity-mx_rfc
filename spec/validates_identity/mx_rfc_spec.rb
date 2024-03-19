# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::MxRfc do
  let(:user) { User.new }

  context 'with a legal identity type' do
    context 'with a valid value' do
      context 'without formatting' do
        before do
          user.legal_identity = 'DSR850311SA3'
          user.legal_identity_type = 'MX_RFC_LEGAL'
          user.valid?
        end

        it 'leaves the value as it is' do
          expect(user.legal_identity).to eq('DSR850311SA3')
        end
      end

      context 'with formatting' do
        before do
          user.legal_formatted_identity = 'DSR850311SA3'
          user.legal_identity_type = 'MX_RFC_LEGAL'
          user.valid?
        end

        it 'formats the value' do
          expect(user.legal_formatted_identity).to eq('DSR850311SA3')
        end
      end
    end

    context 'with an invalid value' do
      before do
        user.legal_identity = '123456'
        user.legal_identity_type = 'MX_RFC_LEGAL'
        user.valid?
      end

      it 'leaves the original value' do
        expect(user.legal_identity).to eq('123456')
      end
    end
  end

  context 'with a person identity type' do
    context 'with a valid value' do
      context 'without formatting' do
        before do
          user.person_identity = 'DSRT850311SA3'
          user.person_identity_type = 'MX_RFC_PERSON'
          user.valid?
        end

        it 'leaves the value as it is' do
          expect(user.person_identity).to eq('DSRT850311SA3')
        end
      end

      context 'with formatting' do
        before do
          user.person_formatted_identity = 'DSRT850311SA3'
          user.person_identity_type = 'MX_RFC_PERSON'
          user.valid?
        end

        it 'formats the value' do
          expect(user.person_formatted_identity).to eq('DSRT850311SA3')
        end
      end
    end

    context 'with an invalid value' do
      before do
        user.person_identity = '123456'
        user.person_identity_type = 'MX_RFC_PERSON'
        user.valid?
      end

      it 'leaves the original value' do
        expect(user.person_identity).to eq('123456')
      end
    end
  end
end
