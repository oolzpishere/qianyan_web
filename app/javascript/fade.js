document.addEventListener("turbo:load", function () {



  var noticeElement = document.querySelector(".notice");
  if (noticeElement){
    setTimeout(() => {
      fadeOut(noticeElement)
    }, "5000")
  }

  var alertElement = document.querySelector(".alert");
  if (alertElement) {
    setTimeout(() => {
      fadeOut(alertElement)
    }, "5000")
  }

  const closeBtns = document.querySelectorAll(".close")
  closeBtns.forEach(function (btn) {
    btn.addEventListener("click", function (e) {
      elem = this.parentElement;
      fadeOut(elem)
    })
  });

  if (!window.requestAnimationFrame) {
    window.requestAnimationFrame = function (fn) {
      var timer = 16.66; // 60 fps
      setTimeout(fn, timer);
    }
  }

  function fadeOut(element) {
    var opacity = 1;
    function decrease() {
      opacity -= 0.05;
      if (opacity <= 0) {
        // complete
        element.style.opacity = 0;
        element.style.display = "none";
        return true;
      }
      element.style.opacity = opacity;
      requestAnimationFrame(decrease);
    }
    decrease();
  }


})