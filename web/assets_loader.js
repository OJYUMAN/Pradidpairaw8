  function loadAudio(url) {
      var audio = new Audio(url);
      // Optionally, you can preload the audio file
      audio.preload = 'auto';
      console.log("Audio loaded:", url);
      // Optionally, you can add the audio to the document body to pre-load it
      // document.body.appendChild(audio);
    }

   function audioLoadedCallback() {
  // This function will be executed when all audio files are loaded
  console.log("All audio files loaded.");
  // Do whatever you need to do when all audio files are loaded
}

function playAudio(url) {

  var audio = new Audio(url);
  audio.play();
  console.log("Audio play:", url);
}



//function loadAudio(urls) {
//console.log("Audio loaded fk:", urls);
//  urls.forEach(url => {
//    var audio = new Audio(url);
//    audio.load();
//    audio.dataset.loaded = "true";
//  });
//
//}
//let audioElements = [];
//
//function loadAudio(audioUrls) {
//console.log("Audio loaded:", audioUrls);
//
//  audioUrls.forEach(url => {
//    let audio = new Audio();
//    audio.src = url;
//    audio.onloadeddata = function() {
//      audioElements.push(audio);
//      console.log("Audio loaded:", url);
//      if (audioElements.length === audioUrls.length) {
//        // All audio files are loaded, execute the callback function
//        audioLoadedCallback();
//      }
//    };
//    audio.load();
//  });
//}









//function loadAudio(url) {
//      var audio = new Audio(url);
//      // Optionally, you can preload the audio file
//      audio.preload = 'auto';
//      console.log("Audio loaded:", url);
//      // Optionally, you can add the audio to the document body to pre-load it
//      // document.body.appendChild(audio);
//    }
//
//function audioLoadedCallback() {
//  // This function will be executed when all audio files are loaded
//  console.log("All audio files loaded.");
//  // Do whatever you need to do when all audio files are loaded
//}
//
//function playAudio(url) {
//
//  var audio = new Audio(url);
//  audio.play();
//  console.log("Audio play:", url);
//}

