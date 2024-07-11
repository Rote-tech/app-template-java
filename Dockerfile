# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM maven:3.8.6-jdk-11 AS builder
COPY src/ src/
COPY pom.xml pom.xml
RUN mvn package

FROM openjdk:11
COPY --from=builder target/*.jar /app.jar
EXPOSE 8080
CMD java -jar app.jar


