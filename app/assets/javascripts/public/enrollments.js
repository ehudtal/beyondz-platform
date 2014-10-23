$(document).ready(function() {
<<<<<<< HEAD
=======
    // make the readonly form actually readonly by prohibiting submissions and restricting edits
    $('#enrollment-form-holder.readonly form').submit(function() { return false; });
    $('#enrollment-form-holder.readonly input, #enrollment-form-holder.readonly textarea').attr('readonly', 'readonly');


>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
    // update the charater counter on textareas that have a maxlength property:
    function updateCountdown(el) {
      var maxlength = $(el).prop('maxlength')
      var currentlength =  $(el).val().length;
      $(el).next('.countdown').text(currentlength + '/' + maxlength);
    }
    // add a character counter textareas that have a maxlength property and make the count update as users type.
    $('[maxlength]').change(function(){updateCountdown(this)}).keyup(function(){updateCountdown(this)}).after('<span class="countdown"></span>').change();

    // set autofocus in case browser doesn't support html5
      if (!('autofocus' in document.createElement('input'))) {
        $(['autofocus']).focus();
      }
    
    // expand fields based on radio button selection:
    $('.expandable').children('.extra').hide();
    $('.complex :radio').click(function(){
      var parent = $(this).closest('.expandable');
      $(parent).siblings('.expandable').children('.extra').slideUp('fast')
      $(parent).children('.extra').slideDown('fast');
    });
<<<<<<< HEAD


    // hide all other fields until one of the applying as is selected
    if(!$('#position_coach').prop('checked'))
      $('.coach:not(.student)').fadeOut('fast');
    if(!$('#position_student').prop('checked'))
      $('.student:not(.coach)').fadeOut('fast');
    
    // Show or hide questions based on user type and program:
    $('[value=student]').click(function(){
      console.log('student');
=======
    
    // Generate TOC:
    $('h2').not('.sr-only, #form-almost-done h2').each(function() {
      $('#jumplinks').append('<li class="page-jump '+$(this).closest('div').prop('class')+'"><a href="#'+$(this).closest('div').prop('id')+'"><div class="jump-icon"></div>'+$(this).text()+'</a></li>');
    });


    // hide all other fields until one of the applying as is selected
    if(!$('#position_coach').prop('checked') && !$('#position_student').prop('checked'))
      $('.coach, .student').hide(); // none are selected, hide everything
    else {
      // one is selected but not the other, so need to be more careful about what we hide
      if(!$('#position_coach').prop('checked'))
        $('.coach:not(.student)').fadeOut('fast');
      if(!$('#position_student').prop('checked'))
        $('.student:not(.coach)').fadeOut('fast');
    }
    
    // Show or hide questions based on user type and program upon selection change:
    $('[value=student]').click(function(){
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
      $('.coach').fadeOut('fast');
      $('.student').fadeIn('fast');
    });
    $('[value=coach]').click(function(){
      $('.student').fadeOut('fast');
      $('.coach').fadeIn('fast');
    });
<<<<<<< HEAD
    
    // Generate TOC:
    $('h2').not('.sr-only, #form-almost-done h2').each(function() {
      $('#jumplinks').append('<li class="page-jump"><a href="#'+$(this).closest('div').prop('id')+'"><div class="jump-icon"></div>'+$(this).text()+'</a></li>');
    });
=======
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec

    // Hide "other" checkbox/radio detail inputs 
    //$('input.other').hide();


    // Sets a timer whenever data is changed which updates the server
    // to ensure the user's data are transparently saved if they stop
    // and come back later

    var saveTimer = null;
<<<<<<< HEAD
    $('input, textarea').change(function() {
=======
    function saveEnrollment() {
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
      if(saveTimer === null) {
        // the timer keeps it from pounding the server too hard
        // if someone does rapid changes
        saveTimer = setTimeout(function() {
          var form = $('#enrollment-form-holder form');
<<<<<<< HEAD
          $.post(form.action, form.serialize());
          saveTimer = null;
        }, 5000);
      }
    });
=======
          $.post(form[0].action, form.serialize());
          saveTimer = null;
        }, 1000);
      }
    }

    // see: http://stackoverflow.com/questions/166221/how-can-i-upload-files-asynchronously-with-jquery
    function saveEnrollmentwithFile() {
      if(!FormData) return; // old browsers don't support ajax file upload, in their case we'll just use the other code as a graceful fallback, even when the file is changed, so they can submit normally w/o JS errors
      if(saveTimer) {
        // cancel any pending non-file save
        clearTimeout(saveTimer);
	saveTimer = null;
      }

      // save including the file
      var form = $('#enrollment-form-holder form');
      $.ajax({
        url: form[0].action,
        type: 'POST',
        data: new FormData(form[0]),
        cache: false,
        contentType: false,
        processData: false
      });
    }

    $('input, textarea').change(saveEnrollment);

    // We'll also do it on keydown to save more frequently
    // on the long answer portions
    $('input, textarea').keydown(saveEnrollment);

    // upload the file only when it changes to save bandwidth - don't
    // want the file to re-upload each time they hit a key!
    $('input[type=file]').change(saveEnrollmentwithFile);
>>>>>>> 816a2beca283a0b66ac0ee6b63a248a9fd50d1ec
    
  // replace programming languages (testing only) with actual majors
  var majors = [
    'ActionScript',
    'AppleScript',
    'Asp',
    'BASIC',
    'C',
    'C++',
    'Clojure',
    'COBOL',
    'ColdFusion',
    'Erlang',
    'Fortran',
    'Groovy',
    'Haskell',
    'Java',
    'JavaScript',
    'Lisp',
    'Perl',
    'PHP',
    'Python',
    'Ruby',
    'Scala',
    'Scheme'
  ];
  $('#major').autocomplete({
    source: majors
  });
});
