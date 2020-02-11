STOP = {}

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
--
--
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
-- Shorthand for table.insert
--
push = (array, item) ->
  table.insert(array, item)

prepend = (array, item) ->
  table.insert(array, 1, item)

return {
  stop:     STOP
  each:     each
  reduce:   reduce
  uuid:     uuid
  push:     push
  append:   push
  prepend:  prepend
}