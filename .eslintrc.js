module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint',
  },
  env: {
    browser: true,
  },
  extends: [
    'standard',
    'plugin:vue/recommended',
    'plugin:prettier/recommended',
    'prettier/vue',
  ],
  plugins: [
    'vue',
    'prettier', // prettierをESLintと併用します
  ],
  rules: {
    // この先はPrettierのルール
    "prettier/prettier": [
      "error",
      {
        printWidth: 120,
        tabWidth: 4,
        useTabs: true,
        singleQuote: true,
        trailingComma: 'all',
        bracketSpacing: true,
      },
    ]
  }
}
