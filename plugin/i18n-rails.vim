" Easy maintain I18N keys in Ruby on Rails projects
" Last Change: 2013 Feb 10
" Maintainer: Szymon Kieloch <skieloch@gmail.com>
" License: This file is placed in the public domain.
"
" Features:
" * Add new key based on a selected text
"     ` - start & end of selection
"
"     1) Views (*.html.erb):
"       E.g. we have a line like:
"         <h1>`Header`</h1>
"
"       Changed to:
"         <h1><%= t('views.items.index.header') %></h1>
"
"     2) Controllers (*_controller.rb):
"       E.g. we have a line like:
"         @page_title = '`Header`'
"
"       Changed to:
"         @page_title = t('views.items.index.header')
"
"     2) Models & other files (*.rb):
"       E.g. we have a line like:
"         @user.role = '`admin`'
"
"       Changed to:
"         @user.role = I18n.t('user.roles.admin')
"
" * Add new value based on a key under the cursor
"     ` - start & end of selection
"
"     E.g. we have a line like:
"       <%= t('`views.items.index.header`') %>
"
"     It should show input and ask, what text you like to see under this key.
"
" * See what value is for a key under the cursor
"     ` - start & end of selection
"
"     E.g. we have a line like:
"       <%= t('`views.items.index.header`') %>
"
"     Or:
"       <%= t(`'views.items.index.header'`) %>
"
"     Or:
"       <%= t('`.header`') %>
"
"     Or:
"       <%= t(`:header`) %>
"
"     Or:
"       <%= t(`:header, :scope => :some_scope`) %>
"
"     Or:
"       <%= t(`'some_key', :scope => :some_scope`) %>
"
"     It should display current text under this key.
"
" * Set default translation:
"   let g:I18nDefaultTranslation = 'en'
"
"
" Changelist:
"
" * 2013 Feb 10
"   Added feature 'See what value is for a key under the cursor'

ruby << EOF
require 'yaml'

def file_names_for_locale(locale)
  files = Dir[File.expand_path(File.dirname(__FILE__) + "/config/locales/**/#{locale}.yml")]
  raise "Sorry, there's no translation for locale: #{locale}" if files.empty?
  files
end

def get_value(hash, key)
  return if hash.nil?
  keys = key.split('.')
  current_key = keys.delete_at(0)
  rest = keys.join('.')
  val = hash[current_key]

  return val if rest.empty?
  get_value(val, rest)
end

def load_yaml(file_name)
  begin
    YAML.load(File.open(file_name))
  rescue
    raise "There's a problem with parsing translations from file: #{file_name}"
  end
end

def normalize_key(key)
  key
end

def look_for_translation(org_key, locale)
  raise 'You are looking for empty key!' if org_key.empty?

  normalized_key = normalize_key(org_key)
  full_key = "#{locale}.#{normalized_key}"

  value = nil
  file_names_for_locale(locale).each do |file_name|
    hash = load_yaml(file_name)
    value = get_value(hash, full_key)
    break unless value.nil?
  end

  print value ? value : "Sorry, there's no translation for the key: '#{org_key}', with locale: '#{locale}'"
end
EOF

if !exists('g:I18nDefaultTranslation')
  let g:I18nDefaultTranslation = 'en-GB'
endif

function! GetSelectedText()
  try
    let a_save = @a
    normal! gv"ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

function! DisplayTranslation()
  let selected_key = GetSelectedText()
  ruby look_for_translation(Vim.evaluate('selected_key'),
                          \ Vim.evaluate('g:I18nDefaultTranslation'))
endfunction
