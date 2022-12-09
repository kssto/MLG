const form = document.querySelector("form"),
        nextBtn = form.querySelector(".nextBtn"),
        backBtn = form.querySelector(".backBtn"),
        allInput = form.querySelectorAll(".first input");


nextBtn.addEventListener("click", ()=> {
    allInput.forEach(input => {
        if(input.value != ""){
            form.classList.add('secActive');
        }else{
            form.classList.remove('secActive');
        }
    })
})

backBtn.addEventListener("click", () => form.classList.remove('secActive'));
function myFunction() {
    var x = document.getElementById("DivForm");
    var z = document.getElementById("actualizar");
    var y = document.getElementById("agregar");
    var list = document.getElementById("lista");
    var add = document.getElementById("add");
    if (x.style.display === "none") {
        x.style.display = "block";
        y.style.display = "block";
      z.style.display = "none";
      list.style.display="none"
      add.style.display="none";
    } else {
      x.style.display = "none";
      z.style.display = "block";
      list.style.display="block"
      add.style.display="block";
    }
  }
  function actualizar() {
    var x = document.getElementById("DivForm");
    var z = document.getElementById("agregar");
    var y = document.getElementById("actualizar");
    var list = document.getElementById("lista");
    var add = document.getElementById("add");
    if (x.style.display === "none") {
      x.style.display = "block";
      y.style.display = "block";
      z.style.display = "none";
      list.style.display="none"
      add.style.display="none";
    } else {
      x.style.display = "none";
      z.style.display = "block";
      list.style.display="block"
      add.style.display="block";
    }
  }
  function ocultarMostrarForm() {
    var list = document.getElementById("lista");
    var x = document.getElementById("DivForm");
    var add = document.getElementById("add");
    if (list.style.display === "none") {
        list.style.display="block";
        x.style.display = "none";
        add.style.display="block";
    } else {
        list.style.display="none";
        x.style.display = "block";
    }
  }