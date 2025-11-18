// Scroll-based fade/slide-in effect for .truck-tile elements
function handleScrollAnimations() {
  const tiles = document.querySelectorAll('.truck-tile');
  const triggerBottom = window.innerHeight * 0.92;
  tiles.forEach(tile => {
    const tileTop = tile.getBoundingClientRect().top;
    if (tileTop < triggerBottom) {
      tile.classList.add('scrolled-into-view');
    } else {
      tile.classList.remove('scrolled-into-view');
    }
  });
}

window.addEventListener('scroll', handleScrollAnimations);
window.addEventListener('DOMContentLoaded', handleScrollAnimations);
window.addEventListener('resize', handleScrollAnimations);
