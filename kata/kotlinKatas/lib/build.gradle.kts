plugins {
    // Apply the org.jetbrains.kotlin.jvm Plugin to add support for Kotlin.
    id("org.jetbrains.kotlin.jvm") version "1.9.10"

    // Apply the java-library plugin for API and implementation separation.
    `java-library`
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation("org.jetbrains.kotlin:kotlin-test-junit5")
    testImplementation("org.junit.jupiter:junit-jupiter-engine:5.9.3")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")

    api("org.apache.commons:commons-math3:3.6.1")

    implementation("com.google.guava:guava:32.1.1-jre")
}

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(17))
    }
}

tasks.named<Test>("test") {
    useJUnitPlatform()

    testLogging {
        showStandardStreams = true
    }
}

tasks.register("genKata") {
    doFirst {
        val kataName = properties["NAME"] as? String ?: throw Exception("No kata name provided")
        val packageName = kataName.replace("-", "")
        val fileName = kataName
            .split("-")
            .map { it.capitalize() }
            .joinToString("")

        val mainPackage = File("$projectDir/src/main/kotlin/kotlinkatas/$packageName/")
        val testPackage = File("$projectDir/src/test/kotlin/kotlinkatas/$packageName/")

        mainPackage.mkdir()
        testPackage.mkdir()

        val solutionFile = mainPackage.resolve("${fileName}Solution.kt")
        val testFile = testPackage.resolve("${fileName}Tests.kt")

        solutionFile.createNewFile()
        testFile.createNewFile()

        solutionFile.writeText("""package $packageName

/* solution here */""")

        testFile.writeText("""package $packageName

import kotlin.test.Test

class ${fileName}Test {

    @Test
    fun `Testing`() {
        /* ... */
    }
}""")
    }
}
