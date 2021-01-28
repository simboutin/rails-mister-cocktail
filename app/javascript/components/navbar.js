const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-home');
  const btnAddCocktail = document.querySelector('#btn-add-cocktail');
  const brand = document.querySelector('#navbar-brand');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (navbar.scrollHeight * 2)) {
        navbar.classList.add('navbar-white');
        btnAddCocktail.classList.remove('btn-outline-secondary')
        btnAddCocktail.classList.add('btn-outline-primary')
        brand.classList.remove('navbar-brand-was-white')
        brand.classList.add('navbar-brand-was-primary')
      } else {
        navbar.classList.remove('navbar-white');
        btnAddCocktail.classList.remove('btn-outline-primary')
        btnAddCocktail.classList.add('btn-outline-secondary')
        brand.classList.remove('navbar-brand-was-primary')
        brand.classList.add('navbar-brand-was-white')
      }
    });
  }
}

export { initUpdateNavbarOnScroll };