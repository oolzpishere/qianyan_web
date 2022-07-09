document.addEventListener("turbo:load", function () {

  if (document.querySelector('.choice')){
    console.log('choice')
    const element = document.querySelector('.choice');
    const choices = new Choices(element, { removeItemButton: true});
  }

})