STOP = {}

--
-- Shorthand for table.insert
--
push = (array, item) ->
  table.insert(array, item)

--
-- Add at the beginning of an array
--
prepend = (array, item) ->
  table.insert(array, 1, item)

--
-- Returns a property or a default value
--
get = (obj, prop, default = nil) ->
  return default if obj == nil or obj[prop] == nil
  obj[prop]

--
-- Calls a method on each item of an array
--
-- breaks if STOP is returned
--
-- @param {table} array the list to iterate over
-- @param {function} cb the callback to trigger for each item
--
each = (array, cb) ->
  return if type(array) != 'table'
  for key, it in pairs array
    break if cb(it, key) == STOP

--
-- Calls a method on each item of an array, starting from the end
--
-- breaks if STOP is returned
--
-- @param {table} array the list to iterate over
-- @param {function} cb the callback to trigger for each item
--
each_reversed = (array, cb) ->
  return if type(array) != 'table'
  for i = #array, 1, -1
    break if cb(array[i], i) == STOP

--
-- A reduce method
--
-- @param {table} array the list to iterate over
-- @param {any} acc the accumulator variable
-- @param {function} cb the callback to trigger for each item
-- @returns {any} the accumulated value
--
reduce = (array, acc, fn) ->
  each array, (it, key) ->
    res = fn(acc, it, key)
    return STOP if res == STOP
    acc = res
  acc

--
-- @return {number} a unique identifier
--
uuid = (() ->
  last_id = 0
  () ->
    last_id += 1
    last_id
)!

--
-- Finds an object based on a predicate
--
-- @param {table} array the list to search the item in
-- @param {function} predicate the predicate to verify the item against
-- @returns {any} the item
--
find = (array, cb) ->
  return nil if type(array) != 'table'
  for key, it in pairs array
    return it if cb(it, key)
  return nil

--
-- Filters items out of an array
--
-- @param {table} array the list to filter the items from
-- @param {function} predicate the predicate to verify the item against
-- @returns {table} the list without the items
--
filter = (array, cb) ->
  return {} if type(array) != 'table'
  reduce array, {}, (res, it, key) ->
    push(res, it) if cb(it, key)
    res

--
-- Removes items based on a predicate
--
-- @param {table} array the list to remove the items from
-- @param {function} predicate the predicate to verify the item against
--
remove = (array, cb, limit = #array) ->
  return if type(array) != 'table'
  counter = 0
  each_reversed array, (it, idx) ->
    should_remove = cb(it, idx)
    return STOP if should_remove == STOP
    if should_remove
      table.remove(array, idx)
      counter +=1
      return STOP if counter == limit

--
-- Removes on item based on a predicate
--
-- @param {table} array the list to remove the item from
-- @param {function} predicate the predicate to verify the item against
--
remove_one = (array, cb) ->
  remove(array, cb, 1)


--
-- Creates an equality predicate
--
-- @param {any} obj the object that will be compared by the predicate
-- @returns {function} an equality predicate
--
equality = (obj) -> (it) -> it == obj

--
-- An empty method
--
noop = () ->

--
--
--
cache = (func) ->
  _cache = {}
  (param) ->
    _cache[param] = func(param) unless _cache[param]
    _cache[param]


return {
  stop:           STOP
  each:           each
  each_reversed:  each_reversed
  reduce:         reduce
  uuid:           uuid
  push:           push
  append:         push
  prepend:        prepend
  find:           find
  filter:         filter
  remove:         remove
  remove_one:     remove_one
  equality:       equality
  noop:           noop,
  get:            get,
  cache:          cache
}