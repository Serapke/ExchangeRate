require 'rails_helper'

describe ExchangeRate do

  subject(:rates) { ExchangeRate::Rate.instance }

  context 'Getting and setting values' do
    it 'creates rate' do
      rates.set('USD', 1.0681, '2017-01-27')
      @rate = rates.get('USD', '2017-01-27')
      expect(@rate.value).to eql(1.0681)
    end
  end

  context 'when selected day\'s rates are in the database' do
    it 'calculates rate correctly' do
      rates.set('USD', 1.0681, '2017-01-27')
      rates.set('GBP', 0.8517, '2017-01-27')
      @rate = rates.at('2017-01-27', 'USD', 'GBP')
      expect(@rate).to eql(0.8517/1.0681)
    end
  end

  context 'when selected day\'s rates are not in the database' do
    it 'calculates rate correctly' do
      rates.set('USD', 1.0681, '2017-01-27')
      rates.set('GBP', 0.8517, '2017-01-27')
      @rate = rates.at(Date.today, 'USD', 'GBP')
      expect(@rate).to eql(0.8517/1.0681)
    end

    it 'calculates from latest known date' do
      rates.set('USD', 1.0681, '2017-01-25')
      rates.set('GBP', 0.8517, '2017-01-25')
      rates.set('USD', 1.0741, '2017-01-27')
      rates.set('GBP', 0.86013, '2017-01-27')
      @rate = rates.at(Date.today, 'USD', 'GBP')
      expect(@rate).to eql(0.86013/1.0741)
    end

    it 'calculates from correct date' do
      rates.set('USD', 1.0681, '2017-01-25')
      rates.set('GBP', 0.8517, '2017-01-25')
      rates.set('USD', 1.0741, '2017-01-27')
      rates.set('GBP', 0.86013, '2017-01-27')
      @rate = rates.at('2017-01-26', 'USD', 'GBP')
      expect(@rate).to eql(0.8517/1.0681)
    end
  end

end