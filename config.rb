# Unique header generation
require './lib/unique_head.rb'

# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true,
    renderer: UniqueHeadCounter

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax
ready do
  require './lib/multilang.rb'
end

activate :sprockets

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

helpers do
  require './lib/toc_data.rb'
end

# ====================
# Custom Configuration
# ====================
config.mpToken = '16aa17c5de12dd4ba07edc5c4fb73ddf'; # Prod

# Api Configuration
config.brand = 'Q2'
config.apiName = 'Q2 Biller Direct API'
config.host = 'https://api.unbill.co/v1'
config.auth = 'Authorization: Bearer dc220490-e6ee-11e5-8a94-e7385a8d929e'
config.billerName = 'Netflix'
config.billerLogo = 'https://s3-us-west-2.amazonaws.com/cdn.unbill.com/uploads/utility-provider-logos/7242937ba29042cce61a8e4745269fce.png'
config.billerLogoSvg = 'https://s3-us-west-2.amazonaws.com/cdn.unbill.com/uploads/utility-provider-logos/7242937ba29042cce61a8e4745269fce.svg'
config.statusSvg = 'https://s3-us-west-2.amazonaws.com/cdn.unbill.com/assets/api/bill-status/status.svg'
config.billerColor = 'FF041F'
config.billerLogin = 'https://www.netflix.com/Login'
config.billerSignup = 'https://www.netflix.com'
config.futureDate = '2018-10-25T00:00:00.000Z'
config.futureDateBefore = '2018-10-24T00:00:00.000Z'
config.futureStatus = 'Due Oct 25'
config.s3 = 'https://s3-us-west-2.amazonaws.com/cdn.unbill.com/assets/docs'
config.companyResponseDescription = [
  '`_id` | ID of the company.',
  '`name` | Name of the company.',
  '`status` | The operational status of the company at any given moment of time. Possible values are `operational`, `maintenance`.',
  '`logo` | Company logo object.',
  '`logo.url` | URL of the company logo.',
  '`logo.background` | If this is `true`, then the logo looks best as a background image.',
  '`logo.svg` | Company logo svg object.',
  '`logo.svg.url` | URL of the company svg logo.',
  '`logo.svg.color` | Hex color of the company logo.',
  '`requiredPayment` | If a specific payment method type is required by this company, this will be defined. Possible values are `bank`, `card`.',
  '`schedule` | The [bill payment schedule](#bill-payment-schedule) this company follows. If this parameter is set, the schedule for a bill linked to this company may not be changed. Typically subscription companies such as Netflix have this parameter set since payments must be made on a specific date.',
  '`userPresenceRequired` | If the biller require that the user is present to pass through any [MFA](#auth-mfa) flows. See best practices in the [Connect](#connect) documentation.',
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
  '`geo.lat` | Latitude coordinate.',
  '`geo.lng` | Longitude coordinate.',
  '`geo.stateShort` | Abbreviated state name.',
  '`geo.stateLong` | Full state name.',
  '`geo.zipcode` | Zipcode.',
  '`geo.address` | Formatted address.',
].join("\n")