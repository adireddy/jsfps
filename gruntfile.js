module.exports = function (grunt) {

	grunt.initConfig({
		pkg: grunt.file.readJSON("package.json"),

		zip: {
			"fps.zip": ["jsfps/**", "haxelib.json", "README.md"]
		}
	});

	grunt.loadNpmTasks("grunt-zip");
	grunt.loadNpmTasks("grunt-exec");
	grunt.registerTask("default", ["zip"]);
};