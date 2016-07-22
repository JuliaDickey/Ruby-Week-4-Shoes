require('spec_helper')

describe(Brand) do
  it "allows users to type a maximum of 20 character" do
    brand = Brand.new({:name => "a".*(21)})
    expect(brand.save).to(eq(false))
  end
  it "does not save a brand if the field is empty" do
    brand = Brand.new({:name => ""})
    expect(brand.save).to(eq(false))
  end
  it "shows all of the stores that sell that brand" do
    store1 = Store.new({:name => "Oddball", :location => "Nw Portland"})
    store1.save
    store2 = Store.new({:name => "Nordstrom", :location => "Pioneer Square"})
    store2.save
    brand = Brand.new({:name => "Saucony"})
    brand.save
    store1.brands.push(brand)
    expect(brand.stores).to(eq([store1]))
  end
end
