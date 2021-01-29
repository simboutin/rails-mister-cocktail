import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelectorAll(selector);
  if (swalButton) { // protect other pages
    swalButton.forEach(button => {
      // console.log(button);
      button.addEventListener('click', () => {
        swal(options)
          .then((value) => {
            if (value) {
              const link = button.nextElementSibling;
              console.log(link);
              link.click();
            }
          });
      });
    });
  };
};

export { initSweetalert };
