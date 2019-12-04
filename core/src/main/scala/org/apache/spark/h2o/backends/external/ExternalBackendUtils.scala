/*
* Licensed to the Apache Software Foundation (ASF) under one or more
* contributor license agreements.  See the NOTICE file distributed with
* this work for additional information regarding copyright ownership.
* The ASF licenses this file to You under the Apache License, Version 2.0
* (the "License"); you may not use this file except in compliance with
* the License.  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package org.apache.spark.h2o.backends.external

import java.io.File

import org.apache.spark.h2o.H2OConf
import org.apache.spark.h2o.backends.{ArgumentBuilder, SharedBackendUtils}
import water.{ExternalFrameUtils, H2O, Paxos}

private[backends] trait ExternalBackendUtils extends SharedBackendUtils {


  protected[backends] def waitForCloudSize(expectedSize: Int, timeoutInMilliseconds: Long): Int = {
    val start = System.currentTimeMillis()
    while (System.currentTimeMillis() - start < timeoutInMilliseconds) {
      if (H2O.CLOUD.size() >= expectedSize && Paxos._commonKnowledge) {
        return H2O.CLOUD.size()
      }
      try {
        Thread.sleep(100)
      } catch {
        case _: InterruptedException =>
      }
    }
    H2O.CLOUD.size()
  }

  /**
    * Get arguments for H2O client
    *
    * @return array of H2O client arguments.
    */
  override def getH2OClientArgs(conf: H2OConf): Seq[String] = {
    new ArgumentBuilder()
      .add("-flatfile", new File(conf.externalBackendFlatFileName().get).getAbsolutePath)
      .add(super.getH2OClientArgs(conf))
      .addIf("-watchdog_client", conf.isAutoClusterStartUsed)
      .buildArgs()
  }

  def prepareExpectedTypes(classes: Array[Class[_]]): Array[Byte] = {
    classes.map { clazz =>
      if (clazz == classOf[java.lang.Boolean]) {
        ExternalFrameUtils.EXPECTED_BOOL
      } else if (clazz == classOf[java.lang.Byte]) {
        ExternalFrameUtils.EXPECTED_BYTE
      } else if (clazz == classOf[java.lang.Short]) {
        ExternalFrameUtils.EXPECTED_SHORT
      } else if (clazz == classOf[java.lang.Character]) {
        ExternalFrameUtils.EXPECTED_CHAR
      } else if (clazz == classOf[java.lang.Integer]) {
        ExternalFrameUtils.EXPECTED_INT
      } else if (clazz == classOf[java.lang.Long]) {
        ExternalFrameUtils.EXPECTED_LONG
      } else if (clazz == classOf[java.lang.Float]) {
        ExternalFrameUtils.EXPECTED_FLOAT
      } else if (clazz == classOf[java.lang.Double]) {
        ExternalFrameUtils.EXPECTED_DOUBLE
      } else if (clazz == classOf[java.lang.String]) {
        ExternalFrameUtils.EXPECTED_STRING
      } else if (clazz == classOf[java.sql.Timestamp]) {
        ExternalFrameUtils.EXPECTED_TIMESTAMP
      } else if (clazz == classOf[org.apache.spark.ml.linalg.Vector]) {
        ExternalFrameUtils.EXPECTED_VECTOR
      } else {
        throw new RuntimeException("Unsupported class: " + clazz)
      }
    }
  }
}
