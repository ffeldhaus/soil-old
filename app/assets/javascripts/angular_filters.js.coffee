angular.module("app.soil").filter "checkmark", ->
  (input) ->
    (if input then "✓" else "✘")
