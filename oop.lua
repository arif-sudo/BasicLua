local Bag = {
    arrows = 16,
    coins = 12,
    -- takeArrows = function (bag)
    --     bag.arrows = bag.arrows - 1;
    --     print(type(bag.arrows) .. ' ' .. bag.arrows)
    -- end
}

-- Bag.takeArrows = function (bag)
--     bag.arrows = bag.arrows - 1;
--     print(type(bag.arrows) .. ' ' .. bag.arrows)
-- end

function Bag:takeArrows()
    self.arrows = self.arrows - 1;
    print(self.arrows .. ' -- ' .. type(self.arrows))
end


Bag.takeArrows(Bag)
Bag:takeArrows()

local MyBag = {
    books = '8'
}

setmetatable(MyBag, {
    __index = Bag
})

print(MyBag.arrows)
MyBag.arrows = 30
print(MyBag.arrows)
print('-----------------------')
print(MyBag.takeArrows)

MyBag:takeArrows()
MyBag:takeArrows()
MyBag:takeArrows()
MyBag:takeArrows()
MyBag:takeArrows()

print('------------------------')

local function Inheritance(parent, instance)
    local newInstance = {}
    if instance ~= nil then
        newInstance = instance
    end
    setmetatable(newInstance, {__index = parent})
    return newInstance
end

local HisBag = Inheritance(Bag, {
    pen = 3,
    pencil = 9
})
print(HisBag.arrows)
print(HisBag.pen)
print(HisBag.pencil)

print('------------------------')

function Bag:New(config)
    return Inheritance(self, config)
end

local HerBag = Bag.New({chocolate = 8})
print(HerBag.chocolate)