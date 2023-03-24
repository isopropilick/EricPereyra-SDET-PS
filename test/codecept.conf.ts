import { setCommonPlugins } from '@codeceptjs/configure';
setCommonPlugins();

export const config: CodeceptJS.MainConfig = {
  tests: './*_test.ts',
  output: './output',
  helpers: {
    REST: {
      endpoint: 'http://localhost:8080/'
    },
    JSONResponse: {}
  },
  include: {
    I: './steps_file'
  },
  gherkin: {
    features: './features/*.feature',
    steps: [
      './step_definitions/steps.js',
    ],
  },
  plugins: {
    allure: {
      enabled: true,
      require: '@codeceptjs/allure-legacy',
    }
  },
  name: 'test'
}