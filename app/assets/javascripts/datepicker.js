$(function() {
  $('#datepicker__request').datepicker({
    title: '依頼日',
    showButtonPanel: true,
    defaultViewDate: Date(),
    duration: 300,
    showAnim: 'show',
    dateFormat: 'yy/mm/dd',
  });
  $('#datepicker__delivery').datepicker({
    title: '納期',
    changeMonth: true,
    showButtonPanel: true,
    duration: 300,
    showAnim: 'show',
    dateFormat: 'yy/mm/dd',
  });
  $('#datepicker__order').datepicker({
    title: '作成日',
    showButtonPanel: true,
    defaultViewDate: Date(),
    duration: 300,
    showAnim: 'show',
    dateFormat: 'yy/mm/dd',
  });
});