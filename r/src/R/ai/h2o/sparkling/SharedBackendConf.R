#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if (!exists("ConfUtils.getOption", mode = "function")) source(file.path("R", "ConfUtils.R"))

#' @export SharedBackendConf
SharedBackendConf <- setRefClass("SharedBackendConf", methods = list(

#
# Getters
#
    backendClusterMode = function() { invoke(jconf, "backendClusterMode") },

    cloudName = function() { ConfUtils.getOption(invoke(jconf, "cloudName")) },

    nthreads = function() { invoke(jconf, "nthreads") },

    isH2OReplEnabled = function() { invoke(jconf, "isH2OReplEnabled") },

    scalaIntDefaultNum = function() { invoke(jconf, "scalaIntDefaultNum") },

    isClusterTopologyListenerEnabled = function() { invoke(jconf, "isClusterTopologyListenerEnabled") },

    isSparkVersionCheckEnabled = function() { invoke(jconf, "isSparkVersionCheckEnabled") },

    isFailOnUnsupportedSparkParamEnabled = function() { invoke(jconf, "isFailOnUnsupportedSparkParamEnabled") },

    jks = function() { ConfUtils.getOption(invoke(jconf, "jks")) },

    jksPass = function() { ConfUtils.getOption(invoke(jconf, "jksPass")) },

    jksAlias = function() { ConfUtils.getOption(invoke(jconf, "jksAlias")) },

    hashLogin = function() { invoke(jconf, "hashLogin") },

    ldapLogin = function() { invoke(jconf, "ldapLogin") },

    kerberosLogin = function() { invoke(jconf, "kerberosLogin") },

    loginConf = function() { ConfUtils.getOption(invoke(jconf, "loginConf")) },

    userName = function() { ConfUtils.getOption(invoke(jconf, "userName")) },

    password = function() { ConfUtils.getOption(invoke(jconf, "password")) },

    sslConf = function() { ConfUtils.getOption(invoke(jconf, "sslConf")) },

    autoFlowSsl = function() { invoke(jconf, "autoFlowSsl") },

    h2oNodeLogLevel = function() {
      warning("The method 'h2oNodeLogLevel' is deprecated and will be removed in 3.34. Use 'logLevel' instead!")
      invoke(jconf, "logLevel")
    },

    logLevel = function() { invoke(jconf, "logLevel") },

    h2oNodeLogDir = function() {
      warning("The method 'h2oNodeLogDir' is deprecated and will be removed in 3.34. Use 'logDir' instead!")
      ConfUtils.getOption(invoke(jconf, "logDir"))
    },

    logDir = function() { ConfUtils.getOption(invoke(jconf, "logDir")) },

    backendHeartbeatInterval = function() { invoke(jconf, "backendHeartbeatInterval") },

    cloudTimeout = function() { invoke(jconf, "cloudTimeout") },

    nodeNetworkMask = function() { ConfUtils.getOption(invoke(jconf, "nodeNetworkMask")) },

    stacktraceCollectorInterval = function() { invoke(jconf, "stacktraceCollectorInterval") },

    contextPath = function() { ConfUtils.getOption(invoke(jconf, "contextPath")) },

    flowScalaCellAsync = function() { invoke(jconf, "flowScalaCellAsync") },

    maxParallelScalaCellJobs = function() { invoke(jconf, "maxParallelScalaCellJobs") },

    internalPortOffset = function() { invoke(jconf, "internalPortOffset") },

    mojoDestroyTimeout = function() { invoke(jconf, "mojoDestroyTimeout") },

    nodeBasePort = function() {
      warning("The method 'nodeBasePort' is deprecated and will be removed in 3.34. Use 'basePort' instead!")
      invoke(jconf, "basePort")
    },

    basePort = function() { invoke(jconf, "basePort") },

    nodeExtraProperties = function() {
      warning("The method 'nodeExtraProperties' is deprecated and will be removed in 3.34. Use 'extraProperties' instead!")
      ConfUtils.getOption(invoke(jconf, "extraProperties"))
    },

    extraProperties = function() { ConfUtils.getOption(invoke(jconf, "extraProperties")) },

    flowExtraHttpHeaders = function() { ConfUtils.getOption(invoke(jconf, "flowExtraHttpHeaders")) },

    isInternalSecureConnectionsEnabled = function() { invoke(jconf, "isInternalSecureConnectionsEnabled") },

    isInsecureXGBoostAllowed = function() { invoke(jconf, "isInsecureXGBoostAllowed") },

    flowDir = function() { ConfUtils.getOption(invoke(jconf, "flowDir")) },

    clientIp = function() { ConfUtils.getOption(invoke(jconf, "clientIp")) },

    clientIcedDir = function() {
        warning("The method 'clientIcedDir' is deprecated and will be removed in 3.34. Use 'icedDir' instead!")
        ConfUtils.getOption(invoke(jconf, "icedDir"))
    },

    h2oClientLogLevel = function() {
      warning("The method 'h2oClientLogLevel' is deprecated and will be removed in 3.34. Use 'logLevel' instead!")
      invoke(jconf, "logLevel")
    },

    h2oClientLogDir = function() {
      warning("The method 'h2oClientLogDir' is deprecated and will be removed in 3.34. Use 'logDir' instead!")
      ConfUtils.getOption(invoke(jconf, "logDir"))
    },

    clientBasePort = function() {
      warning("The method 'clientBasePort' is deprecated and will be removed in 3.34. Use 'basePort' instead!")
      invoke(jconf, "basePort")
    },

    clientWebPort = function() { invoke(jconf, "clientWebPort") },

    clientVerboseOutput = function() { invoke(jconf, "clientVerboseOutput") },

    clientNetworkMask = function() { ConfUtils.getOption(invoke(jconf, "clientNetworkMask")) },

    clientFlowBaseurlOverride = function() { ConfUtils.getOption(invoke(jconf, "clientFlowBaseurlOverride")) },

    clientExtraProperties = function() {
      warning("The method 'clientExtraProperties' is deprecated and will be removed in 3.34. Use 'extraProperties' instead!")
      ConfUtils.getOption(invoke(jconf, "extraProperties"))
    },

    runsInExternalClusterMode = function() { invoke(jconf, "runsInExternalClusterMode") },

    runsInInternalClusterMode = function() { invoke(jconf, "runsInInternalClusterMode") },

    clientCheckRetryTimeout = function() { invoke(jconf, "clientCheckRetryTimeout") },

    verifySslCertificates = function() { invoke(jconf, "verifySslCertificates") },

    isKerberizedHiveEnabled = function() { invoke(jconf, "isKerberizedHiveEnabled") },

    hiveHost = function() { ConfUtils.getOption(invoke(jconf, "hiveHost")) },

    hivePrincipal = function() { ConfUtils.getOption(invoke(jconf, "hivePrincipal")) },

    hiveJdbcUrlPattern = function() { ConfUtils.getOption(invoke(jconf, "hiveJdbcUrlPattern")) },

    hiveToken = function() { ConfUtils.getOption(invoke(jconf, "hiveToken")) },

    icedDir = function() { ConfUtils.getOption(invoke(jconf, "icedDir")) },

#
# Setters
#
    setInternalClusterMode = function() { invoke(jconf, "setInternalClusterMode"); .self },

    setExternalClusterMode = function() { invoke(jconf, "setExternalClusterMode"); .self },

    setCloudName = function(cloudName) { invoke(jconf, "setCloudName", cloudName); .self },

    setNthreads = function(nthreads) { invoke(jconf, "setNthreads", as.integer(nthreads)); .self },

    setReplEnabled = function() { invoke(jconf, "setReplEnabled"); .self },

    setReplDisabled = function() { invoke(jconf, "setReplDisabled"); .self },

    setDefaultNumReplSessions = function(numSessions) { invoke(jconf, "setDefaultNumReplSessions", as.integer(numSessions)); .self },

    setClusterTopologyListenerEnabled = function() { invoke(jconf, "setClusterTopologyListenerEnabled"); .self },

    setClusterTopologyListenerDisabled = function() { invoke(jconf, "setClusterTopologyListenerDisabled"); .self },

    setSparkVersionCheckEnabled = function() { invoke(jconf, "setSparkVersionCheckEnabled"); .self },

    setSparkVersionCheckDisabled = function() { invoke(jconf, "setSparkVersionCheckDisabled"); .self },

    setFailOnUnsupportedSparkParamEnabled = function() { invoke(jconf, "setFailOnUnsupportedSparkParamEnabled"); .self },

    setFailOnUnsupportedSparkParamDisabled = function() { invoke(jconf, "setFailOnUnsupportedSparkParamDisabled"); .self },

    setJks = function(path) { invoke(jconf, "setJks", path); .self },

    setJksPass = function(password) { invoke(jconf, "setJksPass", password); .self },

    setJksAlias = function(alias) { invoke(jconf, "setJksAlias", alias); .self },

    setHashLoginEnabled = function() { invoke(jconf, "setHashLoginEnabled"); .self },

    setHashLoginDisabled = function() { invoke(jconf, "setHashLoginDisabled"); .self },

    setLdapLoginEnabled = function() { invoke(jconf, "setLdapLoginEnabled"); .self },

    setLdapLoginDisabled = function() { invoke(jconf, "setLdapLoginDisabled"); .self },

    setKerberosLoginEnabled = function() { invoke(jconf, "setKerberosLoginEnabled"); .self },

    setKerberosLoginDisabled = function() { invoke(jconf, "setKerberosLoginDisabled"); .self },

    setLoginConf = function(filePath) { invoke(jconf, "setLoginConf", filePath); .self },

    setUserName = function(username) { invoke(jconf, "setUserName", username); .self },

    setPassword = function(password) { invoke(jconf, "setPassword", password); .self },

    setSslConf = function(path) { invoke(jconf, "setSslConf", path); .self },

    setAutoFlowSslEnabled = function() { invoke(jconf, "setAutoFlowSslEnabled"); .self },

    setAutoFlowSslDisabled = function() { invoke(jconf, "setAutoFlowSslDisabled"); .self },

    setH2ONodeLogLevel = function(level) {
      warning("The method 'setH2ONodeLogLevel' is deprecated and will be removed in 3.34. Use 'setLogLevel' instead!")
      invoke(jconf, "setLogLevel", level); .self
    },

    setLogLevel = function(level) { invoke(jconf, "setLogLevel", level); .self },

    setH2ONodeLogDir = function(dir) {
      warning("The method 'setH2ONodeLogDir' is deprecated and will be removed in 3.34. Use 'setLogDir' instead!")
      invoke(jconf, "setLogDir", dir); .self
    },

    setLogDir = function(dir) { invoke(jconf, "setLogDir", dir); .self },

    setBackendHeartbeatInterval = function(interval) { invoke(jconf, "setBackendHeartbeatInterval", as.integer(interval)); .self },

    setCloudTimeout = function(timeout) { invoke(jconf, "setCloudTimeout", as.integer(timeout)); .self },

    setNodeNetworkMask = function(mask) { invoke(jconf, "setNodeNetworkMask", mask); .self },

    setStacktraceCollectorInterval = function(interval) { invoke(jconf, "setStacktraceCollectorInterval", as.integer(interval)); .self },

    setContextPath = function(contextPath) { invoke(jconf, "setContextPath", contextPath); .self },

    setFlowScalaCellAsyncEnabled = function() { invoke(jconf, "setFlowScalaCellAsyncEnabled"); .self },

    setFlowScalaCellAsyncDisabled = function() { invoke(jconf, "setFlowScalaCellAsyncDisabled"); .self },

    setMaxParallelScalaCellJobs = function(limit) { invoke(jconf, "setMaxParallelScalaCellJobs", as.integer(limit)); .self },

    setInternalPortOffset = function(offset) { invoke(jconf, "setInternalPortOffset", as.integer(offset)); .self },

    setNodeBasePort = function(port) {
      warning("The method 'setNodeBasePort' is deprecated and will be removed in 3.34. Use 'setBasePort' instead!")
      invoke(jconf, "setBasePort", as.integer(port)); .self
    },

    setBasePort = function(port) { invoke(jconf, "setBasePort", as.integer(port)); .self },

    setMojoDestroyTimeout = function(timeoutInMilliseconds) { invoke(jconf, "setMojoDestroyTimeout", as.integer(timeoutInMilliseconds)); .self },

    setNodeExtraProperties = function(extraProperties) {
      warning("The method 'setNodeExtraProperties' is deprecated and will be removed in 3.34. Use 'setExtraProperties' instead!")
      invoke(jconf, "setExtraProperties", extraProperties); .self
    },

    setExtraProperties = function(extraProperties) { invoke(jconf, "setExtraProperties", extraProperties); .self },

    setFlowExtraHttpHeaders = function(headers) { invoke(jconf, "setFlowExtraHttpHeaders", headers); .self },

    setInternalSecureConnectionsEnabled = function() { invoke(jconf, "setInternalSecureConnectionsEnabled"); .self },

    setInternalSecureConnectionsDisabled = function() { invoke(jconf, "setInternalSecureConnectionsDisabled"); .self },

    setInsecureXGBoostAllowed = function() { invoke(jconf, "setInsecureXGBoostAllowed"); .self },

    setInsecureXGBoostDenied = function() { invoke(jconf, "setInsecureXGBoostDenied"); .self },

    setFlowDir = function(dir) { invoke(jconf, "setFlowDir", dir); .self },

    setClientIp = function(ip) { invoke(jconf, "setClientIp", ip); .self },

    setClientIcedDir = function(dir) {
        warning("The method 'setClientIcedDir' is deprecated and will be removed in 3.34. Use 'setIcedDir' instead!")
        invoke(jconf, "setIcedDir", dir); .self
    },

    setH2OClientLogLevel = function(level) {
      warning("The method 'setH2OClientLogLevel' is deprecated and will be removed in 3.34. Use 'setLogLevel' instead!")
      invoke(jconf, "setLogLevel", level); .self
    },

    setH2OClientLogDir = function(dir) {
      warning("The method 'setH2OClientLogDir' is deprecated and will be removed in 3.34. Use 'setLogDir' instead!")
      invoke(jconf, "setLogDir", dir); .self
    },

    setClientBasePort = function(port) {
      warning("The method 'setClientBasePort' is deprecated and will be removed in 3.34. Use 'setBasePort' instead!")
      invoke(jconf, "setBasePort", as.integer(port)); .self
    },

    setClientWebPort = function(port) { invoke(jconf, "setClientWebPort", as.integer(port)); .self },

    setClientVerboseEnabled = function() { invoke(jconf, "setClientVerboseEnabled"); .self },

    setClientVerboseDisabled = function() { invoke(jconf, "setClientVerboseDisabled"); .self },

    setClientNetworkMask = function(mask) { invoke(jconf, "setClientNetworkMask", mask); .self },

    setClientFlowBaseurlOverride = function(baseUrl) { invoke(jconf, "setClientFlowBaseurlOverride", baseUrl); .self },

    setClientCheckRetryTimeout = function(timeout) { invoke(jconf, "setClientCheckRetryTimeout", as.integer(timeout)); .self },

    setClientExtraProperties = function(extraProperties) {
      warning("The method 'setClientExtraProperties' is deprecated and will be removed in 3.34. Use 'setExtraProperties' instead!")
      invoke(jconf, "setExtraProperties", extraProperties); .self
    },

    setVerifySslCertificates = function(verify) { invoke(jconf, "setVerifySslCertificates", verify); .self },

    setKerberizedHiveEnabled = function() { invoke(jconf, "setKerberizedHiveEnabled"); .self },

    setKerberizedHiveDisabled = function() { invoke(jconf, "setKerberizedHiveDisabled"); .self },

    setHiveHost = function(host) { invoke(jconf, "setHiveHost", host); .self },

    setHivePrincipal = function(principal) { invoke(jconf, "setHivePrincipal", principal); .self },

    setHiveJdbcUrlPattern = function(pattern) { invoke(jconf, "setHiveJdbcUrlPattern", pattern); .self },

    setHiveToken = function(token) { invoke(jconf, "setHiveToken", token); .self },

    setIcedDir = function(dir) { invoke(jconf, "setIcedDir", dir); .self }
))
