'use strict';

App.controller('AttritionPredictionController', ['$scope', 'EmployeeAttritionPrediction', function($scope, EmployeeAttritionPrediction) {
          var self = this;
          self.empAttrPrediction= new EmployeeAttritionPrediction();
          
          self.empAttrPredictions=[];
              
          self.fetchAllEmpAttrPredictions = function(){
        	  self.empAttrPredictions = EmployeeAttritionPrediction.query();
          };
           
          self.createEmployeeAttritionPrediction = function(){
        	  self.empAttrPrediction.$save(function(){
        		  self.fetchAllEmpAttrPredictions();
        	  });
          };

          self.updateEmpAttrPrediction = function(){
        	  self.empAttrPrediction.$update(function(){
    			  self.fetchAllEmpAttrPredictions();
    		  });
          };

         self.deleteEmpAttrPrediction = function(identity){
        	 var empAttrPrediction = EmployeeAttritionPrediction.get({tradeId:identity}, function() {
        		 empAttrPrediction.$delete(function(){
        			  console.log('Deleting employeeAttritionPrediction with id ', identity);
        			  self.fetchAllEmpAttrPredictions();
        		  });
        	 });
          };

          self.fetchAllEmpAttrPredictions();

          self.submit = function() {
              if(self.empAttrPrediction.tradeId==null){
                  console.log('Saving New employeeAttritionPrediction', self.empAttrPrediction);    
                  self.createEmpAttrPrediction();
              }else{
    			  console.log('Upddating employeeAttritionPrediction with id ', self.empAttrPrediction.tradeId);
                  self.updateEmpAttrPrediction();
                  console.log('EmployeeAttritionPrediction updated with id ', self.empAttrPrediction.tradeId);
              }
              self.reset();
          };
              
          self.edit = function(tradeId){
              console.log('id to be edited', tradeId);
              for(var i = 0; i < self.empAttrPredictions.length; i++){
                  if(self.empAttrPredictions[i].tradeId === tradeId) {
                     self.empAttrPrediction = angular.copy(self.empAttrPredictions[i]);
                     break;
                  }
              }
          };
              
          self.remove = function(tradeId){
              console.log('id to be deleted', tradeId);
              if(self.empAttrPrediction.tradeId === tradeId) {//If it is the one shown on screen, reset screen
                 self.reset();
              }
              self.deleteEmpAttrPrediction(tradeId);
          };

          
          self.reset = function(){
              self.empAttrPrediction= new EmployeeAttritionPrediction();
              $scope.myForm.$setPristine(); //reset Form
          };

      }]);
