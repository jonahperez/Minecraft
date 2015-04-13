AWS.config.update({accessKeyId: 'AKIAISPXWWV4Y572QH2Q', secretAccessKey: '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'});
AWS.config.region='us-east-1';
var cloudwatch = new AWS.CloudWatch();
var alarms= { AlarmNames: [ 'awsroute53-IsMinecraftUp-High-Health-Check-Status' ]};

function colorServerState (element,  callback) {
        cloudwatch.describeAlarms(alarms, function(err, data) 
                {
                        if (err) console.log(err, err.stack); // an error occured
                        else {
				callback(element, data.MetricAlarms[0].StateValue);
                        }
                }
        )
};

