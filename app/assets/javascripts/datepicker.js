$(function() {
  $('#datepicker').datepicker({
    title: '依頼日',
    showButtonPanel: true,
    defaultViewDate: Date(),
    duration: 300,
    showAnim: 'show',
    dateFormat: 'yy/mm/dd',

  });
});