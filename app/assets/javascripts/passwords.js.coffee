# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @Password
  encrypt: (key, password)->
    CryptoJS.AES.encrypt(password, key).toString()

  decrypt: (key, encryptedPassword)->
    CryptoJS.AES.decrypt(encryptedPassword, key).
      toString(CryptoJS.enc.Utf8);


class @PasswordForm
  constructor: ->
    form = $('#password-form')
    form.on 'submit', (e) ->
      password = new Password()
      decryptedPassword = $('#decrypted_password').val()
      key = prompt("Please enter encryption key", "")

      if key
        encryptedPassword = password.encrypt(key, decryptedPassword)
        $('#password_password').val(encryptedPassword)
      else
        form.find('.errors').text('Encryption key cant be blank').show()
        e.preventDefault()

class @PasswordShow
  constructor: ->
    $('.decrypt-link').on 'click', (e) ->
      e.preventDefault()
      password = new Password()
      encryptedPassword = $('#encrypted_password').val()
      key = prompt("Please enter encryption key", "")

      if key
        password = password.decrypt(key, encryptedPassword)

        if password
          $('.password').text(password)
          $('.errors').hide()
        else
          $('.errors').text('Wrong encryption key').show()

class @PasswordMigrate
  constructor: ->
    form = $('.migrate-form')
    form.on 'submit', (e) ->
      e.preventDefault()
      key = form.find('#encrypt_key').val()
      password = new Password()
      form.find('.btn').hide()
      form.find('.loading').show()

      $('.migrate-password-form').each (i, e)->
        decryptedPassword = $(e).find('.decrypted-pass').val()
        encryptedPassword = password.encrypt(key, decryptedPassword)
        $(e).find('.encrypted-pass').val(encryptedPassword)

        $(e).on "ajax:success", (event, xhr, settings) =>
          $(e).parent().fadeOut()

        $(e).trigger('submit.rails')
