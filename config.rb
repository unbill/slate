# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567

# Api Configuration
config.host = 'https://unbill.co/partner/v2'
config.auth = 'dc220490-e6ee-11e5-8a94-e7385a8d929e'

# Response Configuration
config.companyResponseExample = [
'{',
'  "name": "The Grove at Auburn",',
'  "logo": "https://s3-us-west-2.amazonaws.com/cdn.unbill.com/uploads/utility-provider-logos/1464a31cee5efe688ee989dc0f4b56b7.jpg",',
'  "paysRent": true,',
'  "auth": {',
'    "urls": {',
'      "login": "https://groveatauburn.residentportal.com/resident_portal/?module=authentication",',
'      "signup": "https://groveatauburn.residentportal.com/resident_portal/?module=authentication"',
'    },',
'    "loginFields": [{',
'      "placeholder": "Username",',
'      "formType": "text",',
'      "name": "username",',
'      "label": "Username"',
'    }, {',
'      "placeholder": "Password",',
'      "formType": "password",',
'      "name": "password",',
'      "label": "Password"',
'    }]',
'  },',
'  "geo": {',
'    "loc": [ -95.53, 30.70 ],',
'    "state_short": "TX",',
'    "state_long": "Texas",',
'    "zipcode": "77340"',
'  }',
'}'
].join("\n")

config.companyResponseDescription = [
  '`company` | Unbill company.',
  '`company.name` | Name of the company.',
  '`company.logo` | URL of the company logo.',
  '`company.paysRent` | Whether this company accepts rent payments (if `true`, the logo looks best as a background image).',
  '`company.auth` | company auth fields.',
  '`company.auth.urls` | company Auth Urls (login URL is always available, but the others can by null).',
  '`company.auth.urls.login` | Login URL.',
  '`company.auth.urls.signup` | Signup URL.',
  '`company.auth.urls.forgotPassword` | Forgot password URL.',
  '`company.auth.urls.forgotUsername` | Forgot username URL.',
  '`company.auth.loginFields` | Form fields for credentials.',
  '`company.auth.loginFields.placeholder` | Input `placeholder` field.',
  '`company.auth.loginFields.formType` | Input `type` field.',
  '`company.auth.loginFields.name` | Input `name` field.',
  '`company.auth.loginFields.label` | Label for `input`.',
  '`company.auth.geo` | Geo based location (not available for regional or national company).',
  '`company.auth.geo.loc` | Coordinates with syntax `[ longitude, latitude ]`.',
  '`company.auth.geo.stateShort` | Abbreviated state name.',
  '`company.auth.geo.stateLong` | Full state name.',
  '`company.auth.geo.zipcode` | Zipcode.',
  '`company.auth.geo.address` | Formatted address.',
].join("\n")
