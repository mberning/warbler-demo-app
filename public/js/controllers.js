DemoApp.controller('DemoController', ['$scope', '$http', function ($scope, $http) {
    $scope.slides = [{title: 'Slide Title', body: 'Slide Body'}];

    $scope.newSlide = function () {
        $scope.slides.push({title: 'Change Me', body: 'Change Me'});
    };

    $scope.generateSlideshow = function () {
        $http.post('slideshow', $scope.slides).success(function (response) {
            $scope.$broadcast("download", response);
        });
    };
}]);