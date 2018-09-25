'use strict';


App.factory('EmployeeAttritionPrediction', ['$resource', function ($resource) {
	//$resource() function returns an object of resource class
    return $resource(
    		'http://attritionpredictiondb.mysql.database.azure.com/empAttrPrediction/:tradeId',
    		//'http://sharetrade-env.us-east-2.elasticbeanstalk.com/tradeForecast/:tradeId',
    		{tradeId: '@tradeId'},//Handy for update & delete. id will be set with id of instance
    		{
    			update: {
    			      method: 'PUT' // To send the HTTP Put request when calling this custom update method.
    			}
    			
    		}
    );
}]);

