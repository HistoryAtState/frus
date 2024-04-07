module.exports = { 
    extends: ['@commitlint/config-conventional'], 
    rules: {
        'body-max-line-length': [1, 'always', 200],  
        'type-empty': [1, 'never'],
        'subject-empty': [1, 'never']
      } 
}