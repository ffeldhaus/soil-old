'use strict';

/* Controllers */

function SoilCtrl($scope,$location,$dialog) {
    $scope.fertilize = false;
    $scope.pesicide = false;
    $scope.nutrition = false;
    $scope.organic = false;
    $scope.machine = {percent: '0%'};

    $scope.fields = [
        {content:'Ackerbohne', picture:'ackerbohne.jpg', short:'A'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Hafer', picture:'hafer.jpg', short:'H'},
        {content:'Kartoffel', picture:'kartoffel.jpg', short:'K'},
        {content:'Mais', picture:'mais.jpg', short:'K'},
        {content:'Roggen', picture:'roggen.jpg', short:'R'},
        {content:'Weizen', picture:'weizen.jpg', short:'W'},
        {content:'Zuckerrübe', picture:'zuckerruebe.jpg', short:'Z'},
        {content:'Brachland', picture:'brachland.jpg', short:'B'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Weizen', picture:'weizen.jpg', short:'W'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Weizen', picture:'weizen.jpg', short:'W'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Weizen', picture:'weizen.jpg', short:'W'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'}
    ];

    $scope.soil = [
        {content:'60%', picture:'medium.jpg'},
        {content:'30%', picture:'bad.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'60%', picture:'medium.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'60%', picture:'medium.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'60%', picture:'medium.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'60%', picture:'medium.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'},
        {content:'80%', picture:'good.jpg'}
    ];

    $scope.nutrition = [
        {content:'30%', picture:'bad.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'30%', picture:'bad.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'30%', picture:'bad.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'30%', picture:'bad.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'30%', picture:'bad.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'},
        {content:'90%', picture:'good.jpg'}
    ];

    $scope.cropsequence = [
        {content:'schlecht', picture:'bad.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'schlecht', picture:'bad.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'schlecht', picture:'bad.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'schlecht', picture:'bad.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'schlecht', picture:'bad.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'},
        {content:'gut', picture:'good.jpg'}
    ];

    $scope.harvest = [
        {content:'niedrig', picture:'bad.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'niedrig', picture:'bad.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'niedrig', picture:'bad.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'niedrig', picture:'bad.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'niedrig', picture:'bad.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'},
        {content:'hoch', picture:'good.jpg'}
    ];

    $scope.endRound = function () {
        if ($location.url() == '/endRound') {$scope.endRoundAcknowledgement()};
    }

    $scope.endRoundAcknowledgement = function () {
        var title = 'Runde beenden';
        var msg = 'Soll die Runde wirklich beendet werden und die Angaben abgeschickt werden?';
        var btns = [{result:'cancel', label: 'Abbrechen'}, {result:'send', label: 'Runde beenden', cssClass: 'btn-primary'}];

        $dialog.messageBox(title, msg, btns)
            .open()
            .then(function(result){
                alert('dialog closed with result: ' + result);
            });
    }
}

function FieldCtrl($scope) {
}

// the dialog is injected in the specified controller
function selectPlantationCtrl($scope, dialog) {
    $scope.plantations = [
        {content:'Ackerbohne', picture:'ackerbohne.jpg', short:'A'},
        {content:'Gerste', picture:'gerste.jpg', short:'G'},
        {content:'Hafer', picture:'hafer.jpg', short:'H'},
        {content:'Kartoffel', picture:'kartoffel.jpg'},
        {content:'Mais', picture:'mais.jpg', short:'M'},
        {content:'Roggen', picture:'roggen.jpg', short:'R'},
        {content:'Weizen', picture:'weizen.jpg', short:'W'},
        {content:'Zuckerrübe', picture:'zuckerruebe.jpg', short:'Z'},
        {content:'Tier', picture:'tier.jpg', short:'T'},
        {content:'Brachland', picture:'brachland.jpg', short:'B'}
    ];

    $scope.click = function (plantation) {
        dialog.close(plantation);
    }
}

function FinanceCtrl($scope) {
    $scope.groups = [
        {name:"Gruppe 1", decision_machines:'0%', decision_organic:true, decision_fertilize:true, decision_pesticide:true, decision_organisms:true, overview_machines:'120%', overview_animals:0, overview_organic:true, overview_weather:'normal', overview_vermin:'keine',seedcapital:'20000',expenses_seeds_fieldbean:'0',expenses_seeds_barley:'0',expenses_seeds_oat:'0',expenses_seeds_potatoe: '0',expenses_seeds_corn: '0',expenses_seeds_rye:'0',expenses_seeds_wheat: '0', expenses_seeds_beet: '0'},
        {name:"Gruppe 2", decision_machines:'0%', decision_organic:true, decision_fertilize:true, decision_pesticide:true, decision_organisms:true, overview_machines:'120%', overview_animals:0, overview_organic:true, overview_weather:'normal', overview_vermin:'keine'},
        {name:"Gruppe 3", decision_machines:'0%', decision_organic:true, decision_fertilize:true, decision_pesticide:true, decision_organisms:true, overview_machines:'120%', overview_animals:0, overview_organic:true, overview_weather:'normal', overview_vermin:'keine'},
        {name:"Gruppe 4", decision_machines:'0%', decision_organic:true, decision_fertilize:true, decision_pesticide:true, decision_organisms:true, overview_machines:'120%', overview_animals:0, overview_organic:true, overview_weather:'normal', overview_vermin:'keine'},
        {name:"Gruppe 5", decision_machines:'0%', decision_organic:true, decision_fertilize:true, decision_pesticide:true, decision_organisms:true, overview_machines:'120%', overview_animals:0, overview_organic:true, overview_weather:'normal', overview_vermin:'keine'},
        {name:"Gruppe 6", decision_machines:'0%', decision_organic:true, decision_fertilize:true, decision_pesticide:true, decision_organisms:true, overview_machines:'120%', overview_animals:0, overview_organic:true, overview_weather:'normal', overview_vermin:'keine'}

    ];
}

function EndRoundCtrl($scope) {
    $scope.percentages = [{percent: '0%'},{percent:'10%'},{percent:'20%'},{percent:'30%'},{percent:'40%'},{percent:'50%'}]
}