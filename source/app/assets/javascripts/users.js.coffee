# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  identityChip = $('.chip#user-identity-chip');
  chipContent =  identityChip.find('span');

  original = chipContent.text();
  identityChip.hover(->
    chipContent.text(chipContent.data('hover'));
  , ->
    chipContent.text(original)
  );