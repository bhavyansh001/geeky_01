// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

document.addEventListener('turbo:load', function() {
    const copyBtn = document.getElementById('copy-btn');
    const roomUrlInput = document.getElementById('room-url');
   
    if (copyBtn && roomUrlInput) {
       copyBtn.addEventListener('click', function() {
         roomUrlInput.select();
         roomUrlInput.setSelectionRange(0, 99999);
         document.execCommand('copy');
         copyBtn.textContent = 'Copied';
         setTimeout(function() {
           copyBtn.textContent = 'Copy URL';
         }, 2000);
       });
    }
   });
