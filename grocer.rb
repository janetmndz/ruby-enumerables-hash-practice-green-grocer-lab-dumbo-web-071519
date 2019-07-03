def consolidate_cart(cart)
 
  ### using reduce to return a single hash of all items
  cart.reduce({}) { |memo, item|
    ### using each to acess all of the inner hash
    item.each { |(key, value)|
      memo[key] = value
      ### if count doesn't already exist, add it and set it to one
      if !memo[key][:count]
        memo[key][:count] = 1 
      ### if count does exist, accumilated it by one
      else
        memo[key][:count] += 1
      end
    }
    memo
  }
end

def apply_coupons(cart, coupons)
  coupons.each { |coupon|
  
    ### variable setup for readablity 
    item_name = coupon[:item]
    
    ### if this coupon can be applied AND we have enough items for it to apply
    if cart.keys.include?(item_name) && (cart[item_name][:count] >= coupon[:num])
      
      ### if we already used the same coupon, update existing hash
      if cart["#{item_name} W/COUPON"]
        cart["#{item_name} W/COUPON"][:count] += coupon[:num]
      ### if this is our first time using, create a new hash
      else
        cart["#{item_name} W/COUPON"] = {
          count: coupon[:num],
          price: coupon[:cost]/coupon[:num].to_f,
          clearance: cart[item_name][:clearance]
        }
      end
      
      ### update the count in our cart now that a coupon is applied
      cart[item_name][:count] -= coupon[:num]
    end
  }
  cart
end

def apply_clearance(cart)
  cart.each {|item|
    p cart[item[0]][:clearance]
  }
end

def checkout(cart, coupons)
  # code here
end
