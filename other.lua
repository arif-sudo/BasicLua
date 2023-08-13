local f1 = {a = 1, b = 2}  -- Represents the fraction a/b.
local f2 = {a = 2, b = 3}

-- This would fail:
-- s = f1 + f2

table = {
    __add = function ()
        local sum = {}
        sum.a = f1.a + f2.a
        sum.b = f1.b + f2.b
        return sum
    end
}

setmetatable(f1, table)
setmetatable(f2, table)

local s = f1 + f2  -- call __add(f1, f2) 

for k, v in pairs(s) do
    print(k .. ':' .. v)
end

print(getmetatable(f1))
--------------------
Dog = {}                                   

function Dog:new()
  local newObj = {sound = 'woof'}
  self.__index = self
  return setmetatable(newObj, self)
end

function Dog:makeSound()
  print('I say ' .. self.sound)
end

local mrDog = Dog:new()
mrDog:makeSound()  -- 'I say woof'

LoudDog = Dog:new()

function LoudDog:makeSound2()
  s = self.sound .. ' '
  print(s .. s .. s)
end

local seymour = LoudDog:new()
seymour:makeSound2()  -- 'woof woof woof'      