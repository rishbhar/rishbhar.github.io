$( document ).ready(function() {
   var handlesSlider = document.getElementById('slider-handles');

noUiSlider.create(handlesSlider, {
  start: [ 0.0,3.5 ],
  step: .5,
  connect: true,
  tooltips: [true, wNumb({ decimals: 1 })],
  range: {
    'min': [ 0.0 ],
    'max': [ 3.5 ]
  },
  format: {
    to: function ( value ) {
    return value;
    },
    from: function ( value ) {
    return value;
    }
  }
});

var marginMin = document.getElementById('slider-margin-value-min'),
  marginMax = document.getElementById('slider-margin-value-max');

handlesSlider.noUiSlider.on('update', function ( values, handle ) {
  if ( handle ) {
    marginMax.innerHTML = values[handle];
    if(selectedFilters!=null)
    shuffleDiscoveries();
  } else {
    marginMin.innerHTML = values[handle];
    if(selectedFilters!=null)
    shuffleDiscoveries();
  }
});


$('#locationCatBar').click(function(){
      if ( $('#locationTagToggle').hasClass( "glyphicon-minus" ) ) {

        $('#locationTagToggle').removeClass('glyphicon-minus');
        $('#locationTagToggle').addClass('glyphicon-chevron-down');

      }
      else 
        {
          $('#locationTagToggle').removeClass('glyphicon-chevron-down');
          $('#locationTagToggle').addClass('glyphicon-minus');
  
        }

    $('#locationTagOptionsBlock').slideToggle(100,function(){});
});

$('#speciesTagBar').click(function(){
  if ( $('#speciesTagToggle').hasClass( "glyphicon-minus" ) ) {

        $('#speciesTagToggle').removeClass('glyphicon-minus');
        $('#speciesTagToggle').addClass('glyphicon-chevron-down');

      }
      else 
        {
          $('#speciesTagToggle').removeClass('glyphicon-chevron-down');
          $('#speciesTagToggle').addClass('glyphicon-minus');
  
        }
    $('#speciesTagOptionsBlock').slideToggle(100,function(){});
});

$('#behavioursTagBar').click(function(){
   if ( $( '#behavioursTagToggle' ).hasClass( "glyphicon-minus" ) ) {

        $('#behavioursTagToggle').removeClass('glyphicon-minus');
        $('#behavioursTagToggle').addClass('glyphicon-chevron-down');

      }
      else 
        {
          $('#behavioursTagToggle').removeClass('glyphicon-chevron-down');
          $('#behavioursTagToggle').addClass('glyphicon-minus');
  
        }
    $('#behavioursTagOptionsBlock').slideToggle(100,function(){});
});

$('#cognitionTagBar').click(function(){
  if ( $( '#cognitionTagToggle' ).hasClass( "glyphicon-minus" ) ) {

        $('#cognitionTagToggle').removeClass('glyphicon-minus');
        $('#cognitionTagToggle').addClass('glyphicon-chevron-down');

      }
      else 
        {
          $('#cognitionTagToggle').removeClass('glyphicon-chevron-down');
          $('#cognitionTagToggle').addClass('glyphicon-minus');
  
        }
    $('#cognitionTagOptionsBlock').slideToggle(100,function(){});
});

var selectedFilters = ["dummy"];

Array.prototype.remove= function(){
    var what, a= arguments, L= a.length, ax;
    while(L && this.length){
        what= a[--L];
        while((ax= this.indexOf(what))!= -1){
            this.splice(ax, 1);
        }
    }
    return this;
}

function searchStringInArray (str, strArray) {
    for (var j=0; j<strArray.length; j++) {
        if (strArray[j].match(str)) return 1;
    }
    return -1;
}


// $('#filterForDiscoveries').affix({
//   offset: {top: 340}
// });

/*
var fixmeTop = $('#filterForDiscoveries').offset().top;       // get initial position of the element

$(window).scroll(function() {                  // assign scroll event listener

    var currentScroll = $(window).scrollTop(); // get current position

    if (currentScroll >= fixmeTop) {           // apply position: fixed if you
        $('#filterForDiscoveries').addClass("forDiscoveriesScroll");                     // scroll to that element or below it);
    } 
    
    else {                                   // apply position: static
        $('#filterForDiscoveries').removeClass("forDiscoveriesScroll");
      }

});*/



$('.tagMargin').click(function(){

if(searchStringInArray($(this).attr('id'),selectedFilters)>0)
selectedFilters.remove($(this).attr('id'));
else
selectedFilters.push($(this).attr('id'));

//alert(selectedFilters);
shuffleDiscoveries();
});

var Dikika = ["eastafrica","australopithecus","preoldo"];
var Lomekwi = ["eastafrica", "preoldo", "australopithecus"];
var Gona = ["eastafrica","oldowan", "planning", "problem-solving", "imitation"];
var Dmanisi = ["westafrica","oldowan", "homoerectus", "memory"];
var KanjeraSouth = ["eastafrica","oldowan", "planning", "hunting", "imitation","butchery"];
var Kokiselei4 = ["africa","acheulian", "planning", "imitation","memory","language"];
var Sangiran = ["southasia","homoerectus"];
var SimadelElefante = ["westeurope","hunting"];
var WoloSege = ["southasia","seafaring","planning","language"];
var WonderwerkCave = ["southafrica","fire", "homoerectus", "memory","planning","language"];
var Olorgesailie = ["eastafrica","language","acheulian"];
var KathuPan = ["southafrica","haftedtools", "planning","language","memory"];
var Boxgrove = ["westeurope","acheulian","butchery","planning","imitation"];
var Trinil = ["southasia","homoerectus","language","art"];
var Simadeloshuesos = ["westeurope","acheulian","burial","planning","problem-solving"];
var TerraAmata = ["westeurope","fire","livingstructures","problem-solving","planning"];
var Campitello = ["southeurope","haftedtools","homoneanderthalensis","fire","memory","language"];
var PinnaclePoint = ["fire","problem-solving","southafrica"];
var EsSkhulCave = ["westasia", "ornamentation"];
var Krapina = ["southeurope","ornamentation","homoneanderthalensis","planning","burial","language"];
var BlombosCave = ["southafrica","art"];


var locationFilters=["eastafrica", "westeurope", "westasia", "southafrica","southeurope","southasia"];
var behaviourFilters=["preoldo","oldowan","art","butchery","acheulian","hunting","seafaring","fire","livingstructures","haftedtools","burials"];
var speciesFilters=["australopithecus","homoerectus","homoneanderthalensis"];
var cognitionFilters=["planning","imitation","language","imitation","memory","problem-solving"];

var datedTo= new Map();

        datedTo.set('Dikika','3.42-3.24');

       datedTo.set('Lomekwi','3.3');

        datedTo.set('Gona','2.6');

        datedTo.set('Dmanisi','1.85-1.78');

        datedTo.set('KanjeraSouth','2');

        datedTo.set('Kokiselei4','1.76');

        datedTo.set('Sangiran','1.6');

        datedTo.set('SimadelElefante','1.2');

        datedTo.set('WoloSege','1.02');

        datedTo.set('WonderwerkCave','1');

        datedTo.set('Olorgesailie','.9');

        datedTo.set('KathuPan','.55-.50');

        datedTo.set('Boxgrove','.5');
        
        datedTo.set('Trinil','.5');

        datedTo.set('Simadeloshuesos','.43');

        datedTo.set('TerraAmata','.4');

        datedTo.set('Campitello','.2');

        datedTo.set('PinnaclePoint','.164');

        datedTo.set('EsSkhulCave','.135-.1');

        datedTo.set('Krapina','.13');

        datedTo.set('BlombosCave','.1-.75');
      




var totalDiscoveriesShown=21;

//$('#totalDiscoveriesShown').text(totalDiscoveriesShown+" discoveries");


function datedToCheck(discovery)
{
  
    var timePeriod = datedTo.get(discovery);
    //alert(timePeriod);
    var startTime = $('#slider-margin-value-min').text();
    var endTime = $('#slider-margin-value-max').text();
    //alert(datedTo.get(discovery));
    var dashOccur = timePeriod.indexOf('-');
    var discoveryStartTime = timePeriod.substring(0,dashOccur);
    var discoveryEndTime = timePeriod.substring(dashOccur+1,timePeriod.length);
    //alert(discoveryStartTime);
    //alert(discoveryEndTime);
    var startTimeInt = parseFloat(startTime);
    var endTimeInt = parseFloat(endTime);
    var discoveryStartTimeInt = parseFloat(discoveryStartTime);
    var discoveryEndTimeInt = parseFloat(discoveryEndTime);


    if((discoveryStartTimeInt>=startTimeInt) && (discoveryStartTimeInt<=endTimeInt))
      {return 1;}

    if((discoveryEndTimeInt>=startTimeInt) && (discoveryEndTimeInt<=endTimeInt))
      {return 1;}


}




function arraysAreIdentical(arr1, arr2){
   var equals = 0;

  for (var i = 0, len1 = arr1.length; i < len1; i++){
        for (var j = 0, len2 = arr2.length; j < len2; j++){
        if (arr1[i] == arr2[j]){
            equals++;
        }
      }
    }
    //alert(equals);
    
    // if(selectedFilters.length == (equals+1))
    // {return 1;}
    // else 
    // return 2;

   if(equals>0)
    {return 1;}
    else 
    return 2;
}




function filterInUseCompareFunction(arr1, arr2){
   var equals = 0;

  for (var i = 0, len1 = arr1.length; i < len1; i++){
        for (var j = 0, len2 = arr2.length; j < len2; j++){
        if (arr1[i] == arr2[j]){
            equals++;
        }
      }
    }
    //alert(equals);
    if(equals>0)
    return 1;
    else if(equals==0)
    return 2;
}



function shuffleDiscoveries()
{

  
  if(selectedFilters.length ==1)
  {
    totalDiscoveriesShown=0;
      $('#discoveriesBlock').css('opacity', '0.6');
      $('#Dikika').fadeOut(500);
      $('#Lomekwi').fadeOut(500);
      $('#Gona').fadeOut(500);
      $('#KanjeraSouth').fadeOut(500);
      $('#Dmanisi').fadeOut(500);
      $('#Kokiselei4').fadeOut(500);
      $('#Sangiran').fadeOut(500);
      $('#SimadelElefante').fadeOut(500);
      $('#WoloSege').fadeOut(500);
      $('#WonderwerkCave').fadeOut(500);
      $('#Olorgesailie').fadeOut(500);
      $('#KathuPan').fadeOut(500);
      $('#Boxgrove').fadeOut(500);
      $('#Trinil').fadeOut(500);
      $('#Simadeloshuesos').fadeOut(500);
      $('#TerraAmata').fadeOut(500);
      $('#Campitello').fadeOut(500);
      $('#PinnaclePoint').fadeOut(500);
      $('#EsSkhulCave').fadeOut(500);
      $('#Krapina').fadeOut(500);
      $('#BlombosCave').fadeOut(500);


 var datedToDikika = datedToCheck('Dikika');
  var datedToLomekwi = datedToCheck('Lomekwi');
  var datedToGona = datedToCheck('Gona');
  var datedToKanjeraSouth = datedToCheck('KanjeraSouth');
  var datedToDmanisi = datedToCheck('Dmanisi');
  var datedToKokiselei4 = datedToCheck('Kokiselei4');
  var datedToSangiran = datedToCheck('Sangiran');
  var datedToSimadelElefante = datedToCheck('SimadelElefante');
  var datedToWoloSege = datedToCheck('WoloSege');
  var datedToWonderwerkCave = datedToCheck('WonderwerkCave');
  var datedToOlorgesailie = datedToCheck('Olorgesailie');
  var datedToKathuPan = datedToCheck('KathuPan');
  var datedToBoxgrove = datedToCheck('Boxgrove');
  var datedToTrinil = datedToCheck('Trinil');
  var datedToSimadeloshuesos = datedToCheck('Simadeloshuesos');
  var datedToTerraAmata = datedToCheck('TerraAmata');
  var datedToCampitello = datedToCheck('Campitello');
  var datedToPinnaclePoint= datedToCheck('PinnaclePoint');
  var datedToEsSkhulCave = datedToCheck('EsSkhulCave');
  var datedToKrapina = datedToCheck('Krapina');
  var datedToBlombosCave = datedToCheck('BlombosCave');


  if(datedToDikika==1) {totalDiscoveriesShown+=1;}
  if(datedToLomekwi==1){totalDiscoveriesShown+=1;}
  if(datedToGona==1){totalDiscoveriesShown+=1;}
  if(datedToKanjeraSouth==1){totalDiscoveriesShown+=1;}
  if(datedToDmanisi==1){totalDiscoveriesShown+=1;}
  if(datedToKokiselei4==1){totalDiscoveriesShown+=1;}
  if(datedToSangiran==1) {totalDiscoveriesShown+=1;}
  if(datedToSimadelElefante==1){totalDiscoveriesShown+=1;}
  if(datedToWoloSege==1){totalDiscoveriesShown+=1;}
  if(datedToWonderwerkCave==1){totalDiscoveriesShown+=1;}
  if(datedToOlorgesailie==1){totalDiscoveriesShown+=1;}
  if(datedToKathuPan==1){totalDiscoveriesShown+=1;}
  if(datedToTrinil==1){totalDiscoveriesShown+=1;}
  if(datedToBoxgrove==1){totalDiscoveriesShown+=1;}
  if(datedToSimadeloshuesos==1){totalDiscoveriesShown+=1;}
  if(datedToTerraAmata==1){totalDiscoveriesShown+=1;}
  if(datedToCampitello==1){totalDiscoveriesShown+=1;}
  if(datedToPinnaclePoint==1){totalDiscoveriesShown+=1;}
  if(datedToEsSkhulCave==1){totalDiscoveriesShown+=1;}
  if(datedToKrapina==1){totalDiscoveriesShown+=1;}
  if(datedToBlombosCave==1){totalDiscoveriesShown+=1;}

      $('#discoveriesBlock').css('opacity', '1');


  
  if(datedToDikika==1)
  $('#Dikika').fadeIn(500);

  if(datedToLomekwi==1)
  $('#Lomekwi').fadeIn(500);

  if(datedToGona==1)
  $('#Gona').fadeIn(500);

  if(datedToKanjeraSouth==1)
  $('#KanjeraSouth').fadeIn(500);

   if(datedToDmanisi==1)
  $('#Dmanisi').fadeIn(500);

  if(datedToKokiselei4==1)
  $('#Kokiselei4').fadeIn(500);

  if(datedToSangiran==1)
  $('#Sangiran').fadeIn(500);

  if(datedToSimadelElefante==1)
  $('#SimadelElefante').fadeIn(500);

   if(datedToWoloSege==1)
  $('#WoloSege').fadeIn(500);

  if(datedToWonderwerkCave==1)
  $('#WonderwerkCave').fadeIn(500);

  if(datedToOlorgesailie==1)
  $('#Olorgesailie').fadeIn(500);


   if(datedToKathuPan==1)
  $('#KathuPan').fadeIn(500);

  if(datedToTrinil==1)
  $('#Trinil').fadeIn(500);

  if(datedToBoxgrove==1)
  $('#Boxgrove').fadeIn(500);

  if(datedToSimadeloshuesos==1)
  $('#Simadeloshuesos').fadeIn(500);

   if(datedToTerraAmata==1)
  $('#TerraAmata').fadeIn(500);

  if(datedToCampitello==1)
  $('#Campitello').fadeIn(500);

  if(datedToPinnaclePoint==1)
  $('#PinnaclePoint').fadeIn(500);

  if(datedToEsSkhulCave==1)
  $('#EsSkhulCave').fadeIn(500);
  
  if(datedToKrapina==1)
  $('#Krapina').fadeIn(500);

  if(datedToBlombosCave==1)
  $('#BlombosCave').fadeIn(500);


$('#locationFilterApplied').text('');
$('#behaviourFilterApplied').text('');
$('#speciesFilterApplied').text('');
$('#cognitionFilterApplied').text('');
$('#totalDiscoveriesShown').text('');

 


      if(totalDiscoveriesShown!=21)
      $('#totalDiscoveriesShown').text("("+totalDiscoveriesShown+" discoveries, filters applied)");
      return 1;
  
  }


  var showDikika = arraysAreIdentical(selectedFilters,Dikika);
  var showLomekwi= arraysAreIdentical(selectedFilters,Lomekwi);
  var showGona = arraysAreIdentical(selectedFilters,Gona);
  var showKanjeraSouth = arraysAreIdentical(selectedFilters,KanjeraSouth);
  var showDmanisi = arraysAreIdentical(selectedFilters,Dmanisi);
  var showKokiselei4 = arraysAreIdentical(selectedFilters,Kokiselei4);
  var showSangiran = arraysAreIdentical(selectedFilters,Sangiran);
  var showSimadelElefante = arraysAreIdentical(selectedFilters,SimadelElefante);
  var showWoloSege = arraysAreIdentical(selectedFilters,WoloSege);
  var showWonderwerkCave = arraysAreIdentical(selectedFilters,WonderwerkCave);
  var showOlorgesailie = arraysAreIdentical(selectedFilters,Olorgesailie);
  var showKathuPan = arraysAreIdentical(selectedFilters,KathuPan);
  var showBoxgrove = arraysAreIdentical(selectedFilters,Boxgrove);
  var showTrinil = arraysAreIdentical(selectedFilters,Trinil);

  var showSimadeloshuesos = arraysAreIdentical(selectedFilters,Simadeloshuesos);
  var showTerraAmata = arraysAreIdentical(selectedFilters,TerraAmata);
  var showCampitello = arraysAreIdentical(selectedFilters,Campitello);
  var showPinnaclePoint = arraysAreIdentical(selectedFilters,PinnaclePoint);
  var showEsSkhulCave = arraysAreIdentical(selectedFilters,EsSkhulCave);
  var showKrapina = arraysAreIdentical(selectedFilters,Krapina);
  var showBlombosCave = arraysAreIdentical(selectedFilters,BlombosCave);

  var datedToDikika = datedToCheck('Dikika');
  var datedToLomekwi = datedToCheck('Lomekwi');
  var datedToGona = datedToCheck('Gona');
  var datedToKanjeraSouth = datedToCheck('KanjeraSouth');
  var datedToDmanisi = datedToCheck('Dmanisi');
  var datedToKokiselei4 = datedToCheck('Kokiselei4');
  var datedToSangiran = datedToCheck('Sangiran');
  var datedToSimadelElefante = datedToCheck('SimadelElefante');
  var datedToWoloSege = datedToCheck('WoloSege');
  var datedToWonderwerkCave = datedToCheck('WonderwerkCave');
  var datedToOlorgesailie = datedToCheck('Olorgesailie');
  var datedToKathuPan = datedToCheck('KathuPan');
  var datedToBoxgrove = datedToCheck('Boxgrove');
  var datedToTrinil = datedToCheck('Trinil');
  var datedToSimadeloshuesos = datedToCheck('Simadeloshuesos');
  var datedToTerraAmata = datedToCheck('TerraAmata');
  var datedToCampitello = datedToCheck('Campitello');
  var datedToPinnaclePoint= datedToCheck('PinnaclePoint');
  var datedToEsSkhulCave = datedToCheck('EsSkhulCave');
  var datedToKrapina = datedToCheck('Krapina');
  var datedToBlombosCave = datedToCheck('BlombosCave');


//alert(selectedFilters);


var locationFilterApplied = filterInUseCompareFunction(selectedFilters,locationFilters);
var speciesFilterApplied = filterInUseCompareFunction(selectedFilters,speciesFilters);
var behaviourFilterApplied = filterInUseCompareFunction(selectedFilters,behaviourFilters);
var cognitionFilterApplied = filterInUseCompareFunction(selectedFilters,cognitionFilters);


// alert("location"+arraysAreIdentical(selectedFilters,locationFilters));
// alert("behavior"+arraysAreIdentical(selectedFilters,behaviourFilters));
// alert("spec"+arraysAreIdentical(selectedFilters,speciesFilters));
// alert("cognition"+arraysAreIdentical(selectedFilters,cognitionFilters));


  if(locationFilterApplied==1)
   { $('#locationFilterApplied').text('(filter in use)');}
  else if(locationFilterApplied==2)
    {$('#locationFilterApplied').text('');}



  if(behaviourFilterApplied==1)
   {$('#behaviourFilterApplied').text('(filter in use)');}
 else if(behaviourFilterApplied==2)
  {$('#behaviourFilterApplied').text('');}



  if(speciesFilterApplied==1)
     {$('#speciesFilterApplied').text('(filter in use)');}
   else if(speciesFilterApplied==2)
    {$('#speciesFilterApplied').text('');}



  if(cognitionFilterApplied==1)  
     {$('#cognitionFilterApplied').text('(filter in use)');}
   else if(cognitionFilterApplied==2)  
    {$('#cognitionFilterApplied').text('');}


totalDiscoveriesShown=0;
  
if((showDikika==1) && (datedToDikika==1)) {totalDiscoveriesShown+=1;}
if((showLomekwi==1) && (datedToLomekwi==1)){totalDiscoveriesShown+=1;}
 if((showGona==1) && (datedToGona==1)){totalDiscoveriesShown+=1;}
if((showKanjeraSouth==1) && (datedToKanjeraSouth==1)){totalDiscoveriesShown+=1;}
if((showDmanisi==1) && (datedToDmanisi==1)){totalDiscoveriesShown+=1;}
if((showKokiselei4==1) && (datedToKokiselei4==1)){totalDiscoveriesShown+=1;}
if((showSangiran==1) && (datedToSangiran==1)) {totalDiscoveriesShown+=1;}
if((showSimadelElefante==1) && (datedToSimadelElefante==1)){totalDiscoveriesShown+=1;}
 if((showWoloSege==1) && (datedToWoloSege==1)){totalDiscoveriesShown+=1;}
if((showWonderwerkCave==1) && (datedToWonderwerkCave==1)){totalDiscoveriesShown+=1;}
if((showOlorgesailie==1) && (datedToOlorgesailie==1)){totalDiscoveriesShown+=1;}
if((showKathuPan==1) && (datedToKathuPan==1)){totalDiscoveriesShown+=1;}
if((showTrinil==1) && (datedToTrinil==1)){totalDiscoveriesShown+=1;}
if((showBoxgrove==1) && (datedToBoxgrove==1)){totalDiscoveriesShown+=1;}
if((showSimadeloshuesos==1) && (datedToSimadeloshuesos==1)){totalDiscoveriesShown+=1;}
if((showTerraAmata==1) && (datedToTerraAmata==1)){totalDiscoveriesShown+=1;}
if((showCampitello==1) && (datedToCampitello==1)){totalDiscoveriesShown+=1;}
if((showPinnaclePoint==1) && (datedToPinnaclePoint==1)){totalDiscoveriesShown+=1;}
if((showEsSkhulCave==1) && (datedToEsSkhulCave==1)){totalDiscoveriesShown+=1;}
if((showKrapina==1) && (datedToKrapina==1)){totalDiscoveriesShown+=1;}
if((showBlombosCave==1) && (datedToBlombosCave==1)){totalDiscoveriesShown+=1;}
  //alert(showDikika,showLomekwi,showGona,showKanjeraSouth);
  $('#totalDiscoveriesShown').text("("+totalDiscoveriesShown+" discoveries, filters applied)");

  $('#discoveriesBlock').css('opacity', '0.6');
  $('#Dikika').fadeOut(500);
  $('#Lomekwi').fadeOut(500);
  $('#Gona').fadeOut(500);
  $('#KanjeraSouth').fadeOut(500);
  $('#Dmanisi').fadeOut(500);
  $('#Kokiselei4').fadeOut(500);
  $('#Sangiran').fadeOut(500);
  $('#SimadelElefante').fadeOut(500);
  $('#WoloSege').fadeOut(500);
  $('#WonderwerkCave').fadeOut(500);
  $('#Olorgesailie').fadeOut(500);
  $('#KathuPan').fadeOut(500);
  $('#Trinil').fadeOut(500);
  $('#Boxgrove').fadeOut(500);
  $('#Simadeloshuesos').fadeOut(500);
  $('#TerraAmata').fadeOut(500);
  
  $('#Campitello').fadeOut(500);
  $('#PinnaclePoint').fadeOut(500);
  $('#EsSkhulCave').fadeOut(500);
  $('#Krapina').fadeOut(500);
  $('#BlombosCave').fadeOut(500);


  $('#discoveriesBlock').css('opacity', '1');
  if((showDikika==1) && (datedToDikika==1))
  $('#Dikika').fadeIn(500);

  if((showLomekwi==1) && (datedToLomekwi==1))
  $('#Lomekwi').fadeIn(500);

  if((showGona==1) && (datedToGona==1))
  $('#Gona').fadeIn(500);

  if((showKanjeraSouth==1) && (datedToKanjeraSouth==1))
  $('#KanjeraSouth').fadeIn(500);

   if((showDmanisi==1) && (datedToDmanisi==1))
  $('#Dmanisi').fadeIn(500);

  if((showKokiselei4==1) && (datedToKokiselei4==1))
  $('#Kokiselei4').fadeIn(500);

  if((showSangiran==1) && (datedToSangiran==1))
  $('#Sangiran').fadeIn(500);

  if((showSimadelElefante==1) && (datedToSimadelElefante==1))
  $('#SimadelElefante').fadeIn(500);

   if((showWoloSege==1) && (datedToWoloSege==1))
  $('#WoloSege').fadeIn(500);

  if((showWonderwerkCave==1) && (datedToWonderwerkCave==1))
  $('#WonderwerkCave').fadeIn(500);

  if((showOlorgesailie==1) && (datedToOlorgesailie==1))
  $('#Olorgesailie').fadeIn(500);



   if((showKathuPan==1) && (datedToKathuPan==1))
  $('#KathuPan').fadeIn(500);

  if((showTrinil==1) && (datedToTrinil==1))
  $('#Trinil').fadeIn(500);

  if((showBoxgrove==1) && (datedToBoxgrove==1))
  $('#Boxgrove').fadeIn(500);

  if((showSimadeloshuesos==1) && (datedToSimadeloshuesos==1))
  $('#Simadeloshuesos').fadeIn(500);

   if((showTerraAmata==1) && (datedToTerraAmata==1))
  $('#TerraAmata').fadeIn(500);

  if((showCampitello==1) && (datedToCampitello==1))
  $('#Campitello').fadeIn(500);

  if((showPinnaclePoint==1) && (datedToPinnaclePoint==1))
  $('#PinnaclePoint').fadeIn(500);

  if((showEsSkhulCave==1) && (datedToEsSkhulCave==1))
  $('#EsSkhulCave').fadeIn(500);
  
  if((showKrapina==1) && (datedToKrapina==1))
  $('#Krapina').fadeIn(500);

  if((showBlombosCave==1) && (datedToBlombosCave==1))
  $('#BlombosCave').fadeIn(500);
  


  //$('html, body').animate({
    //    scrollTop: $("#discoveriesBlock").offset().top-100
   // }, 100);

}




var lastPosition=0;

$('.discoveryName, .readMoreDiscovery').click(function(){
  //alert($(this).attr('alt'));
  showDetails($(this).attr('alt'));
  var attrValue = $(this).attr('alt');

  $('[alt="'+attrValue+'"]').closest(".readMoreDiscovery").toggle();  

  //$('[alt="'+attrValue+'"]').css('display','block');
  $('[alt="'+attrValue+'"]').closest(".goBack").css('display','block');
  lastPosition=$('[alt="'+attrValue+'"]').closest('#'+attrValue).position().top;
  //alert(""+lastPosition);
});




$('.goBack').click(function(){
  //alert($(this).attr('alt'));
  goBack($(this).attr('alt'));
  var attrValue = $(this).attr('alt');


$('[alt="'+attrValue+'"]').closest(".readMoreDiscovery").toggle();  

  $('[alt="'+attrValue+'"]').closest(".goBack").css('display','none');
  //$('.goBack [alt="'+attrValue+'"]').css('display','none');
});




function showDetails(discovery)
  {
    //alert($(this).attr("class"));
//alert($(this).parent().css().position().top);
// var block='#'+discovery;
//     lastPosition=$(''+block+'').position().top;
    
  $('#discoveriesBlock').css('opacity', '0.6');
  $('#Dikika').fadeOut(100);
  $('#Lomekwi').fadeOut(100);
  $('#Gona').fadeOut(100);
  $('#KanjeraSouth').fadeOut(100);
  $('#Dmanisi').fadeOut(100);
  $('#Kokiselei4').fadeOut(100);
  $('#Sangiran').fadeOut(100);
  $('#SimadelElefante').fadeOut(100);
  $('#WoloSege').fadeOut(100);
  $('#WonderwerkCave').fadeOut(100);
  $('#Olorgesailie').fadeOut(100);
  $('#KathuPan').fadeOut(100);
  $('#Trinil').fadeOut(100);
  $('#Boxgrove').fadeOut(100);
  $('#Simadeloshuesos').fadeOut(100);
  $('#TerraAmata').fadeOut(100);
  
  $('#Campitello').fadeOut(100);
  $('#PinnaclePoint').fadeOut(100);
  $('#EsSkhulCave').fadeOut(100);
  $('#Krapina').fadeOut(100);
  $('#BlombosCave').fadeOut(100);

  
  $('#prehistoricArchaeologyTitleBlock').css('margin-top','0%')
  $('#filterForDiscoveries').fadeOut(100);
  $('#prehistoricArchaeologyDiscoveryTitleBlock').fadeOut(100);
  $('#prehistoricArchaeologyTitle').fadeOut(100);
  $('#prehistoricArchaeologyBlurlb').fadeOut(100);


  var block = "#"+discovery+"";
  var blockDetails = "#"+discovery+"Details";
  var blockGoBack = "#goBack"+discovery;
  $('#discoveriesBlock').css('opacity', '1');

  $(''+block+'Image').fadeOut(100);
  $(''+block+'FullImage').fadeIn(100);
  $(''+block+'').fadeIn(100);
  $(''+blockDetails+'').fadeIn(100);

  $('#preArchaeologyLink').text(' | '+discovery);
  $(''+blockGoBack+'').css('display','block');
  $('.majorDiscoveryBlock').css('background-color','transparent');
  $('.majorDiscoveryBlock').css('border-top','none');
  $('.majorDiscoveryBlock').css('padding','2% 3% 0% 0%');
  $(window).scrollTop(0);
  

  }

 function goBack(discovery){
  var block = "#"+discovery+"";
  var blockDetails = "#"+discovery+"Details";
  var blockGoBack = "#goBack"+discovery;
  $(''+block+'').fadeOut(100);
  $(''+blockDetails+'').fadeOut(100);
  $(''+block+'Image').fadeIn(100);
  $(''+block+'FullImage').fadeOut(100);
  
  $('#prehistoricArchaeologyTitleBlock').css('margin-top','2.4%');
  $('#filterForDiscoveries').fadeIn(100);
  $('#prehistoricArchaeologyDiscoveryTitleBlock').fadeIn(100);
  $('#prehistoricArchaeologyTitle').fadeIn(100);
  $('#prehistoricArchaeologyBlurlb').fadeIn(100);
  

  /*$('#Dikika').fadeIn(100);
  $('#Lomekwi').fadeIn(100);
  $('#Gona').fadeIn(100);
  $('#KanjeraSouth').fadeIn(100);
  $('#Dmanisi').fadeIn(100);
  $('#Kokiselei4').fadeIn(100);
  $('#Sangiran').fadeIn(100);
  $('#SimadelElefante').fadeIn(100);
  $('#WoloSege').fadeIn(100);
  $('#WonderwerkCave').fadeIn(100);
  $('#Olorgesailie').fadeIn(100);
  $('#KathuPan').fadeIn(100);
  $('#Trinil').fadeIn(100);
  $('#Boxgrove').fadeIn(100);
  $('#Simadeloshuesos').fadeIn(100);
  $('#TerraAmata').fadeIn(100);
  
  $('#Campitello').fadeIn(100);
  $('#PinnaclePoint').fadeIn(100);
  $('#EsSkhulCave').fadeIn(100);
  $('#Krapina').fadeIn(100);
  $('#BlombosCave').fadeIn(100);*/
  shuffleDiscoveries();
  
  
  $('#preArchaeologyLink').text('');
  $('.majorDiscoveryBlock').css('background-color','#012E40');
  $('.majorDiscoveryBlock').css('border-top','1px solid #547887');
  $('.majorDiscoveryBlock').css('padding','2% 3% 2% 2%');
  //$(window).scrollTop($("#discoveriesBlock").offset().top-50);
  //alert(lastPosition);
  lastPosition+=280;//alert(lastPosition);
//$(window).scrollTop(lastPosition);$(window).scrollTop(lastPosition);
$('html, body').animate({
        scrollTop: lastPosition
    }, 100);
}




$("#imagemodal").click(function(e) {


    var senderElement = e.target;
    //check if sender is the DIV element
    //alert(senderElement.getAttribute("class"));
    var clickedItem = senderElement.getAttribute("class");

    if(clickedItem==null)
    $('#imagemodal').modal('hide');
    else if(clickedItem!="modalImage")
      $('#imagemodal').modal('hide');
      else if(clickedItem=="modal-body")
        return;//alert("lamlam");
        
    //alert(senderElement);
    
});


   



});