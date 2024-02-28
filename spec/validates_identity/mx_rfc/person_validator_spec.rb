# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::MxRfc::PersonValidator do
  it 'rejects RAA921127RI6' do
    expect(described_class.new('RAA921127RI6')).not_to be_valid
  end

  it 'rejects DST850311SA3' do
    expect(described_class.new('DST850311SA3')).not_to be_valid
  end

  it 'rejects IMS120607120' do
    expect(described_class.new('IMS120607120')).not_to be_valid
  end

  it 'accepts RAAA921127RI6' do
    expect(described_class.new('RAAA921127RI6')).to be_valid
  end

  it 'accepts DSRT850311SA3' do
    expect(described_class.new('DSRT850311SA3')).to be_valid
  end

  it 'accepts IMST120607120' do
    expect(described_class.new('IMST120607120')).to be_valid
  end

  it 'rejects KAOB750230MASLHJ07' do
    expect(described_class.new('KAOB750230MASLHJ07')).not_to be_valid
  end

  it 'rejects EOMR330613FDFPKT08' do
    expect(described_class.new('EOMR330613FDFPKT08')).not_to be_valid
  end

  it 'rejects YOOR280801HXXLTK07' do
    expect(described_class.new('YOOR280801HXXLTK07')).not_to be_valid
  end

  it 'rejects EIMV310211MQRPKT1X' do
    expect(described_class.new('EIMV310211MQRPKT1X')).not_to be_valid
  end

  it 'rejects L6NF640805MYNTNN10' do
    expect(described_class.new('L6NF640805MYNTNN10')).not_to be_valid
  end

  it 'rejects MOJL020101HCLKWMXY09' do
    expect(described_class.new('MOJL020101HCLKWMXY09')).not_to be_valid
  end

  it 'rejects HEGG560427MVCRRL04' do
    expect(described_class.new('HEGG560427MVCRRL04')).not_to be_valid
  end

  it 'rejects ZAZD801124MBSYQN13' do
    expect(described_class.new('ZAZD801124MBSYQN13')).not_to be_valid
  end

  it 'rejects RUNO390705HSLPTC02' do
    expect(described_class.new('RUNO390705HSLPTC02')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end
end
