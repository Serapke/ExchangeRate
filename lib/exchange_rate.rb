module ExchangeRate
  class Rate
    include Singleton

    def at(date, from, to)
      currency_from = get(from, date)
      currency_to = get(to, date)

      currency_to.value / currency_from.value
    end

    def set(currency, value, date)
      record = Record.where(currency: currency, date: date)
      if !record.present?
        Record.create(currency: currency, value: value, date: date)
      end
    end

    def get(currency, date)
      record = find(currency, date)
      record if record.present?
    end

    private

    def find(currency, date)
      Record.where(currency: currency)
            .where('rates.date <= ?', date)
            .order('rates.date DESC')
            .first
    end

  end

  class Record < ActiveRecord::Base
    self.table_name = 'rates'
  end
end
