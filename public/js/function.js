document.addEventListener('DOMContentLoaded', (event) => {
    // JavaScript code here if needed
  });
  
  function toggleUserMenu() {
    document.getElementById('user-menu').classList.toggle('show');
  }
  
  window.onclick = function(event) {
    if (!event.target.matches('.fa-user')) {
      var dropdowns = document.getElementsByClassName("user-menu-content");
      for (var i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
  