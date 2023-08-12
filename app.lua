local greeting = 'Hello World'
local table = {'apples', 'oranges', 'bananas'}

print(table) -- table: 0x55c65db0ff40

for index, fruit in ipairs(table) do
    print(index, fruit)
end

-- 1       apples
-- 2       oranges
-- 3       bananas

dict = {
    ['moon'] = '🌑',
    ['cheese'] = '🧀',
    ['food'] = 'bread',
    ['age'] = 20,
    ['year'] = 2023
}

for k, v in pairs(dict) do
    print(k, v)
end
-- moon    🌑
-- food    bread
-- cheese  🧀
-- year    2023
-- age     20