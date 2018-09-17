// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", () => {
  const editableTitles = document.querySelectorAll('.js-editable-title');

  editableTitles.forEach(t => {
    const editListTitle = t.querySelector('.js-edit-list-title');
    const listTitle = t.querySelector('.js-list-title');
    const listTitleForm = t.querySelector('.js-list-title-form');
    const listFormSubmit = t.querySelector('.js-submit-form');

    editListTitle.addEventListener('click', () => {
      listTitle.classList.toggle('hidden');
      listTitleForm.classList.toggle('hidden');

      t.querySelector('#list_name').focus();
    })

    listFormSubmit.addEventListener('click', () => {
      listTitle.classList.toggle('hidden');
      listTitleForm.classList.toggle('hidden');
    })
  })
})