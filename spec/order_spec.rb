require 'order'

describe Order do
  let(:menu) { [Dish.new(36, "Chicken Korma", 7.95)] }
  let(:order) { Order.new(menu) }
  let(:order_items) { OrderList.new }

  before(:each) do
    order_items.add("Chicken Korma", 1)
    @order_total = 7.95
  end

  it "creates a new order from the menu with a total price" do
    order_total = 7.95
    expect(order.place(order_items, order_total)).to eq "order placed"
  end

  it "throws an error when the total is wrong" do
    order_items.add("Pilau Rice", 1)
    order_items.add("Peshwari Naan", 2)
    expect { order.place(order_items, @order_total - 1) }.to raise_error "order cost does not match expected cost"
  end

  # let(:dish_curry) { double :dish, display: "36. Chicken Korma £8.00" }
  # let(:dish_rice) { double :dish, display: "55. Pilau Rice £2.50"}
  # let(:dish_bread) { double :dish, display: "86. Peshwari Naan £3.00"}

  context '#When testing with doubles' do
    let(:this_order) { double :order_list }

    it "receives a new order and returns a success message" do
      total_cost = 9
      allow(this_order).to receive(:calculate_cost) { total_cost }
      expect(order.place(this_order, total_cost)).to eq "order placed"
    end

    it "receives a new order and returns a failure message" do
      total_cost = 9
      allow(this_order).to receive(:calculate_cost) { total_cost - 1 }
      expect { order.place(this_order, total_cost) }.to raise_error "order cost does not match expected cost"
    end
  end
end