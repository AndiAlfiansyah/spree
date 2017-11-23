require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class RajaOngkir < ShippingCalculator

      def self.description
        'RajaOngkir '
      end

      def compute_package(package)
        100_000
      end


    def compute(package)
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts package.inspect
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "Weight: #{package.weight}"
      # puts "From: #{package.stock_location.city}"
      puts "From: 368"
      puts "Destination: #{package.order.bill_address.subdistrict_id}"
      puts "Code: #{calculable.code}"
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      puts "=============="
      # 107 Cimahi
      # 23 Bandung
      # 24 Bandung Barat
      # 363 Bandung KOTA - Regol
      service = RajaOngkirService.find_rates(363, package.order.bill_address.subdistrict_id, package.weight, calculable.code)
      puts service
      cost    = service.present? ? RajaOngkirService.get_cost(service) : 0
      puts cost
      cost
    end
    end
  end
end
