const selectRating = () => {
  $('.rating input').change(function () {
    var $radio = $(this);
    $('.rating .selected').removeClass('selected');
    $radio.closest('label').addClass('selected');
    console.log($radio);
  });
}

export { selectRating };
