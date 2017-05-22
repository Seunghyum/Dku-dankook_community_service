# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( pagination_n_filter.js morphemes.js plugins/minimap.js plugins/jstree.js blogings.js chartist.js chart.js owl_carousel.js pickme.js jquery_package.js rehearsal.js  rehearsal_sign.js jquery.vticker.min.js loading/fakeloader.js loading/pace.js )
Rails.application.config.assets.precompile += %w( owl.carousel.css owl.theme.css pickme.css rehearsal.css rehearsal_sign.css fakeloader.css )
# Rails.application.config.assets.precompile += %w( pages/*.js )
