const selectRating = () => {
  const ratingInputs = document.querySelectorAll('.rating input');
  ratingInputs.forEach(input => {
    input.addEventListener('click', () => {
      const selectedInputs = document.querySelectorAll('.rating .selected');
      selectedInputs.forEach(selectedInput => {
        selectedInput.classList.remove('selected');
      });
      const closest = input.closest('label');
      closest.forEach(closestInput => {
        closestInput.classList.add('selected');
      });
    });
  });
}
