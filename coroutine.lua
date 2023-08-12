local function foo (a)
    print("foo", a)
    print('Status -- ' .. coroutine.status(co))
    return coroutine.yield(2*a)
  end

 co = coroutine.create(function (a,b)
    print("co-body", a, b)
    local r = foo(a+1)
    print("co-body", r)
    local r, s = coroutine.yield(a+b, a-b)
    print("co-body", r, s)
    return b, "end"
end)

print("main", coroutine.resume(co, 2, 8))

print("main", coroutine.resume(co, "t1", "t2"))
print("main", coroutine.resume(co, "x", "y"))
print("main", coroutine.resume(co, "x", "y"))


 --[[Routine1 = coroutine.create(function()
  for i = 1, 10 do
    print('Routine 1 -- ' .. i)
    if i==5 then
      coroutine.yield()
    end
  end
end)

local routine2 = coroutine.create(function ()
  for i = 11, 20 do
    print('Routine 2 ' .. i)
  end
coroutine.resume(Routine1)
end)


coroutine.resume(Routine1)
print('Status 1 - ' .. coroutine.status(Routine1))
coroutine.resume(routine2)
print('Status 2 - ' .. coroutine.status(Routine1))
--]]
