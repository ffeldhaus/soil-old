'use strict';

/* Directives */

angular.module('soil.directives', []).
    directive('navBarTop',function () {
        return {
            restrict:'E',
            transclude:true,
            scope:{
                'title':'@'
            },
            template:'<div class="navbar navbar-fixed-top">' +
                '<div class="navbar-inner">' +
                '<div class="container">' +
                '<a class="brand" href="#/">{{title}}</a>' +
                '<ul class="nav" ng-transclude></ul>' +
                '</div>' +
                '</div>' +
                '</div>',
            replace:true
        };
    }).
    directive('navLocation',function ($location) {
        return {
            restrict:'E',
            transclude:true,
            scope:{
                'href':'@',
                'name':'@',
                'show':'=',
                'visible':'&'
            },
            link:function (scope) {
                scope.location = function (href) {
                    return href.substr(1) === $location.url();
                };
            },
            template:'<li ng-class="{active: location(href) && visible()}">' +
                '<a ng-click="show=name" href="{{href}}" ng-transclude></a>' +
                '</li>',
            replace:true
        };
    }).
    directive('uiSelectable',function ($dialog) {
        return function (scope, el, attrs) {
            scope.opts = {
                backdrop:true,
                keyboard:true,
                backdropClick:true,
                backdropFade:true,
                templateUrl:'dialogs/selectPlantation.html',
                controller:'selectPlantationCtrl'
            };

            el.selectable({
                stop:function (evt, ui) {

                    var selected = el.find('.ui-selected').map(function () {
                        var idx = $(this).index();
                        return {content:scope.fields[idx].content, index:idx}
                    }).get();

                    var d = $dialog.dialog(scope.opts);
                    d.open().then(function (plantation) {
                        if (plantation) {
                            for (var i = 0; i < selected.length; i++) {
                                scope.fields[selected[i].index] = plantation;
                            }
                        }
                    });

                    scope.$apply()
                }
            });
        }
    });