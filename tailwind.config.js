module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './components/admin/app/views/**/*.html.erb',
    './components/frontend/app/views/**/*.html.erb',
  ],
  theme: {
    extend: {
      fontFamily: {
        // sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      backgroundImage: {
        // 'footer': "url('footer-bg.jpg')"
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    // require('@tailwindcss/aspect-ratio'),
    // require('@tailwindcss/typography'),
  ]
}
