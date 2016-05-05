angular.module("soil").filter "checkmark", ->
  (input) ->
    (if input then "✓" else "✘")
