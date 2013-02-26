'use strict';

angular.module('soil', ['ui', 'ui.bootstrap', 'soil.filters', 'soil.directives']).
    config(['$routeProvider', function ($routeProvider) {
    $routeProvider.
        when('/field', {templateUrl:'partials/field.html', controller:FieldCtrl}).
        when('/finance', {templateUrl:'partials/finance.html', controller:FinanceCtrl}).
        when('/endRound', {templateUrl:'partials/endRound.html', controller:EndRoundCtrl}).
        otherwise({redirectTo:'/field'});
}]);