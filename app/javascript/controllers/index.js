// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

const copyBtn = document.getElementById('copy-btn');
const roomUrlInput = document.getElementById('room-url');

copyBtn.addEventListener('click', function() {
  roomUrlInput.select();
  roomUrlInput.setSelectionRange(0, 99999); // For mobile devices
  document.execCommand('copy');
  // Change the button text to "Copied"
  copyBtn.textContent = 'Copied';
  // Optionally, revert the button text after a few seconds
  setTimeout(function() {
    copyBtn.textContent = 'Copy URL';
  }, 2000); // 2000 milliseconds = 2 seconds
});

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
