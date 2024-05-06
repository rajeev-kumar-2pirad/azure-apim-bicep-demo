@description('The name of the API Management service instance')
param apiManagementServiceName string = 'APIM-Hello-World-GraphQL-Demo-${uniqueString(resourceGroup().id)}'

@description('The name of the GraphQL API')
@minLength(1)
param apiName string = 'graphql'

@description('The path of the API')
@minLength(1)
param apiPath string = 'graphql'

@description('The description of the API')
@minLength(1)
param apiDescription string = 'A GraphQL API via Bicep'

@description('The Display Name of the API')
@minLength(1)
param apiDisplayName string = 'Countries-GraphQL-API'

@description('The GraphQl API Service Url')
@minLength(1)
param apiServiceUrl string = 'https://countries.trevorblades.com/graphql'

resource apimService 'Microsoft.ApiManagement/service@2023-05-01-preview' existing = {
  name: apiManagementServiceName
}

resource graphqlApi 'Microsoft.ApiManagement/service/apis@2023-05-01-preview' = {
  name: apiName
  parent: apimService
  properties: {
    description: apiDescription
    displayName: apiDisplayName
    serviceUrl: apiServiceUrl
    path: apiPath
    protocols: [ 'https', 'wss' ]
    authenticationSettings: {
      oAuth2AuthenticationSettings: []
      openidAuthenticationSettings: []
    }
    subscriptionKeyParameterNames: {
      header: 'Ocp-Apim-Subscription-Key'
      query: 'subscription-key'
    }
    subscriptionRequired: false
    type: 'graphql'
  }
}

resource graphqlSchema 'Microsoft.ApiManagement/service/apis/schemas@2023-05-01-preview' = {
  name: 'graphql'
  parent: graphqlApi
  properties: {
    contentType: 'application/vnd.ms-azure-apim.graphql.schema'
    document: {
      value: loadTextContent('../schemas/countries-graphql.schema')
    }
  }
}

resource graphqlPolicy 'Microsoft.ApiManagement/service/apis/policies@2023-05-01-preview' = {
  name: 'policy'
  parent: graphqlApi
  properties: {
    format: 'rawxml'
    value: loadTextContent('../policies/countries-api-policy.xml')
  }
}
