Account = {balance=0, 
  withdraw=function(self,v)
    self.balance=self.balance-v
  end, 
  deposit=function(self,v) 
    self.balance=self.balance+v
  end
}

function Account:new (o)
  o = o or {}
  self.__index = self
  setmetatable(o, self)
  return o
end

SpecialAccount = Account:new()


function SpecialAccount:getLimit()
  return self.limit or 0
end

function SpecialAccount:withdraw(v)
  --if (self.balance-v < 0 or v>self:getLimit()) then error "Insufficient funds" end
  if (v-self.balance >= self:getLimit()) then error "Insufficient funds" end
  self.balance=self.balance-v
end

a = SpecialAccount:new{limit = 1000}
--a= SpecialAccount:new()

a:deposit(3000)  

a:withdraw(3999)


print (("New balance:%d"):format(a.balance))