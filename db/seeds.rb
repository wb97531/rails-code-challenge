@ship_times = []

5.times {
  @ship_times += [nil]
  @ship_times += [Time.now + rand(0..99) * 60]
}

10.times { Order.create!(shipped_at: @ship_times.pop) }
