env = os.getenv('LOVE_ENV') or 'development'

return {
  env:      env
  is_prod:  env == 'production'
  is_dev:   env == 'development'
  is_test:  env == 'test'
}