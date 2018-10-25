# Creating non-shipped orders.
o1 = Order.create!()
o2 = Order.create!()
o3 = Order.create!()
o4 = Order.create!()
o5 = Order.create!()
# Shipped at times are randomly assigned.  What great randomizaiton I've done!
os1 = Order.create!(shipped_at: Time.now + 21.minute)
os2 = Order.create!(shipped_at: Time.now + 20.minute)
os3 = Order.create!(shipped_at: Time.now + 3.minute)
os4 = Order.create!(shipped_at: Time.now + 40.minute)
os5 = Order.create!(shipped_at: Time.now + 5.minute)