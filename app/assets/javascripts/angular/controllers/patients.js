app.factory("Patient", [
  "$resource", function($resource){
    return $resource("/patients/:id.json", {
      id: "@id"
    }, {
      update: {
        method: "PUT"
      }
    });
  }
]);

this.PatientCtrl = ["$scope", "Patient", function($scope, Patient){
  $scope.patients = Patient.query();

  $scope.parse_patient_date = function(input){
    return new Date(input).toDateString();
  }
}];