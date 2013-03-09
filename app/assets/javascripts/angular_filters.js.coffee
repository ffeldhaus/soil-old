angular.module("soil.filters", []).filter "checkmark", ->
  (input) ->
    (if input then "✓" else "✘")