Rails.application.config.importmap.draw do
  # Pin the application JavaScript file
  pin "application", preload: true
 
  # Pin your custom JavaScript files
  pin "js", to: "js.js"
 
  # Pin all JavaScript files in the controllers directory
  pin_all_from "app/javascript/controllers", under: "controllers"
 end