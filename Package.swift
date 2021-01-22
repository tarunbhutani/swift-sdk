// swift-tools-version:5.3
/**
 * (C) Copyright IBM Corp. 2016, 2019.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

// Note: The Speech to Text and Text to Speech services are not supported with
// Swift Package Manager. Unfortunately, the package manager does not provide
// a convenient way to include the dependencies required for these services
// (e.g. libogg, libopus, and Starscream). If you would like to use Speech
// to Text or Text to Speech, please try an alternative dependency management
// tool (e.g. Carthage). If you would like support for the Swift Package Manager,
// feel free to open an issue or even contribute a pull request that adds
// support for the required libraries.
import PackageDescription

let package = Package(
    name: "WatsonDeveloperCloud",
    platforms: [
        .iOS(.v10), .macOS(.v10_15),
    ],
    products: [
        .library(name: "SpeechToTextV1", targets: ["SpeechToTextV1"])
    ],
    dependencies: [
        .package(name: "IBMSwiftSDKCore", url: "https://github.com/IBM/swift-sdk-core", from: "1.0.0"),
        .package(name: "Starscream", url: "https://github.com/daltoniam/Starscream", from: "3.0.0"),
        .package(name: "Clibogg", url: "https://github.com/apaparazzi0329/Clibogg", .branch("master")),
        .package(name: "Clibopus", url: "https://github.com/apaparazzi0329/Clibopus", .branch("master")),
    ],
    targets: [
        .target(name: "SpeechToTextV1", dependencies: ["IBMSwiftSDKCore", "Starscream", "Clibogg", "Clibopus"], path: "Sources/SpeechToTextV1"),
    ]
)