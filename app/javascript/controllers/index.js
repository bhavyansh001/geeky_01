// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

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

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
