//= require jquery3
//= require jquery_ujs
//= require libs/popper.js/dist/umd/popper.min
//= require libs/bootstrap/dist/js/bootstrap.min
//= require libs/metisMenu/dist/metisMenu.min
//= require jquery.slimscroll.min
//= require libs/app.min


//= require bootbox


/* Sobrescreve  data-confirm do Rails */
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
        confirm: {
            label: 'Sim',
            className: 'btn-success'
        },
        cancel: {
            label: 'Não',
            className: 'btn-danger'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}