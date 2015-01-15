var DemoApp = angular.module('DemoApp', []);

DemoApp.directive('download', function () {
    return {
        restrict: 'E',
        link: function (scope, iElement) {

            scope.$on("download", function (e, url) {
                var iFrame = $('<iframe class="ng-hide"/>');
                iElement.append(iFrame);
                iFrame.attr("src", url);
            });
        }
    };
});