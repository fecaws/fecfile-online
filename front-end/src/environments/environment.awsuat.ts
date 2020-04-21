export const environment = {
  production: true,
  name: 'awsuat',
  apiUrl: 'https://uat-fecfile-api.efdev.fec.gov/api/v1',
  validateSuccess: 'All required fields have passed validation',
  appTitle: 'FECfile',
  awsRegion: 'us-east-1',
  awsIdentityPoolId: '######################################',
  ACCESS_KEY: _process.env.ACCESS_KEY,
  SECRET_KEY: _process.env.SECRET_KEY
};
