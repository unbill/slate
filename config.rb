require 'date'

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
config.billerName = 'Netflix'
config.billerLogo = 'https://s3-us-west-2.amazonaws.com/cdn.unbill.com/uploads/utility-provider-logos/7242937ba29042cce61a8e4745269fce.png'
config.billerLogoSvg = 'https://s3-us-west-2.amazonaws.com/cdn.unbill.com/uploads/utility-provider-logos/7242937ba29042cce61a8e4745269fce.svg'
config.billerColor = 'FF041F'
config.billerLogin = 'https://www.netflix.com/Login'
config.billerSignup = 'https://www.netflix.com'
config.futureDate = '2016-10-25T00:00:00.000Z'

# Response Configuration
config.companyResponseExample = [
'{',
'  "name": "' + config.billerName + '",',
'  "logo": {',
'    "url": "' + config.billerLogo + '",',
'    "background": false,',
'    "svg": {',
'      "url": "' + config.billerLogoSvg + '",',
'      "color": "' + config.billerColor + '"',
'    }',
'  },',
'  "auth": {',
'    "urls": {',
'      "login": "' + config.billerLogin + '",',
'      "signup": "' + config.billerSignup + '"',
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
  '`name` | Name of the company.',
  '`logo` | Company logo object.',
  '`logo.url` | URL of the company logo.',
  '`logo.background` | If this is `true`, then the logo looks best as a background image.',
  '`logo.svg` | Company logo svg object.',
  '`logo.svg.url` | URL of the company svg logo.',
  '`logo.svg.color` | Hex color of the Company logo.',
  '`auth` | Company auth fields.',
  '`auth.urls` | Company Auth Urls (login URL is always available, but the others can by null).',
  '`auth.urls.login` | Login URL.',
  '`auth.urls.signup` | Signup URL.',
  '`auth.urls.forgotPassword` | Forgot password URL.',
  '`auth.urls.forgotUsername` | Forgot username URL.',
  '`auth.loginFields` | Form fields for credentials.',
  '`auth.loginFields.placeholder` | Input `placeholder` field.',
  '`auth.loginFields.formType` | Input `type` field.',
  '`auth.loginFields.name` | Input `name` field.',
  '`auth.loginFields.label` | Label for `input`.',
  '`geo` | Geo based location (not available for regional or national company).',
  '`geo.loc` | Coordinates with syntax `[ longitude, latitude ]`.',
  '`geo.stateShort` | Abbreviated state name.',
  '`geo.stateLong` | Full state name.',
  '`geo.zipcode` | Zipcode.',
  '`geo.address` | Formatted address.',
].join("\n")