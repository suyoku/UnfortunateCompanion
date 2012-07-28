List = {}

function List:new()
    list = {}
    list.array = {}
    list.size = 0
    setmetatable(list, self)
    self.__index = self
    return list
end

function List:length()
    return self.size
end

function List:append(item)
    self.array[self.size] = item
    self.size = self.size + 1
end

function List:get(idx)
    return self.array[idx]
end
