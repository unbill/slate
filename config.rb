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
config.host = 'https://unbill.co/partner/v1'
config.auth = 'dc220490-e6ee-11e5-8a94-e7385a8d929e'

# Response Configuration
config.billerResponseExample = [
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

config.billerResponseDescription = [
  '`biller` | Unbill biller.',
  '`biller.name` | Name of the biller.',
  '`biller.logo` | URL of the biller logo.',
  '`biller.paysRent` | Whether this biller accepts rent payments (if `true`, the logo looks best as a background image).',
  '`biller.auth` | Biller auth fields.',
  '`biller.auth.urls` | Biller Auth Urls (login URL is always available, but the others can by null).',
  '`biller.auth.urls.login` | Login URL.',
  '`biller.auth.urls.signup` | Signup URL.',
  '`biller.auth.urls.forgotPassword` | Forgot password URL.',
  '`biller.auth.urls.forgotUsername` | Forgot username URL.',
  '`biller.auth.loginFields` | Form fields for credentials.',
  '`biller.auth.loginFields.placeholder` | Input `placeholder` field.',
  '`biller.auth.loginFields.formType` | Input `type` field.',
  '`biller.auth.loginFields.name` | Input `name` field.',
  '`biller.auth.loginFields.label` | Label for `input`.',
  '`biller.auth.geo` | Geo based location (not available for regional or national biller).',
  '`biller.auth.geo.loc` | Coordinates with syntax `[ longitude, latitude ]`.',
  '`biller.auth.geo.stateShort` | Abbreviated state name.',
  '`biller.auth.geo.stateLong` | Full state name.',
  '`biller.auth.geo.zipcode` | Zipcode.',
  '`biller.auth.geo.address` | Formatted address.',
].join("\n")
