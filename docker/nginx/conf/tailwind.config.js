/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/static/*.{js,ts,php,html}',
    './templates/**/*.{js,ts,php,html,phtml,twig}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
