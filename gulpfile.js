const del = require('del')
gulp = require('gulp')
pug = require('gulp-pug')
Fiber = require('fibers')
sass = require('gulp-sass')
cssnano = require('cssnano')
babel = require('gulp-babel')
uglify = require('gulp-terser')
concat = require('gulp-concat')
rename = require('gulp-rename')
plumber = require('gulp-plumber')
postcss = require('gulp-postcss')
prefixer = require('autoprefixer')
srcmap = require('gulp-sourcemaps')
browserSync = require('browser-sync')
readFileSync = require('graceful-fs').readFileSync
sass.compiler = require('dart-sass');

// Task Concat css
gulp.task('mergeCSS', function () {
	let cssGlob = JSON.parse(readFileSync('./_plugins.json'))
	return gulp.src(cssGlob.css)
		// .pipe(postcss([
		// 	prefixer({
		// 		browsers: ['last 4 version', "IE 10"],
		// 		cascade: false,
		// 	}),
		// 	cssnano()
		// ]))
		.pipe(concat('core.min.css'))
		.pipe(gulp.dest('./dist/css'));
})


// Task Concat css
gulp.task('mergeJS', function () {
	let cssGlob = JSON.parse(readFileSync('./_plugins.json'))
	return gulp.src(cssGlob.js)
		.pipe(concat('core.min.js'))
		.pipe(uglify())
		.pipe(gulp.dest('./dist/js'));
})


// Task html
gulp.task('html', function () {
	return gulp.src([
		'./templates/*.pug',
		'!./templates/{\_**/**,\_**}.pug'
	])
		.pipe(pug({
			pretty: '\t',
		}))
		.pipe(plumber())
		.pipe(gulp.dest('./dist'))
		.pipe(browserSync.reload({ stream: true }));
})


// Task css
gulp.task('css', function () {
	return gulp.src([
		'./_components/*.sass',
		'!./_components/{\_**/**,\_**}.sass'
	])
		.pipe(sass.sync({ fiber: Fiber }).on('error', sass.logError))
		.pipe(postcss([
			prefixer({
				browsers: ['last 4 version', "IE 10"],
				cascade: false,
			}),
			cssnano(),
		]))
		.pipe(rename({
			suffix: '.min'
		}))
		.pipe(gulp.dest('./dist/css'))
		.pipe(browserSync.reload({ stream: true }));
})


// Task js
gulp.task('scripts', function () {
	return gulp.src('./_components/**/**.js')
		.pipe(srcmap.init())
		.pipe(concat('main.min.js'))
		.pipe(babel({
			presets: ['@babel/env']
		}))
		.pipe(uglify())
		.pipe(srcmap.write('./.'))
		.pipe(gulp.dest('./dist/js'))
		.pipe(browserSync.reload({ stream: true }));
})

// Task clean images
gulp.task('copyPolyfill', function () {
	return gulp.src('./node_modules/@babel/polyfill/dist/polyfill.min.js')
		.pipe(gulp.dest('./dist/js'))
})


// Task clean
gulp.task('clean', function () {
	return del(['./dist']);
})


// Task clean images
gulp.task('cleanImages', function () {
	return del(['./dist/img'])
})


// Task clean images
gulp.task('copyFavicon', function () {
	return gulp.src('./favicon.ico')
		.pipe(gulp.dest('./dist'))
})


// Task copy fonts
gulp.task('copyFonts', function () {
	let cssGlob = JSON.parse(readFileSync('./_plugins.json'))
	return gulp.src(cssGlob.font)
		.pipe(gulp.dest('./dist/fonts'));
})


// Task copy img
gulp.task('copyImages', function () {
	return gulp.src('img/**/**.{svg,gif,png,jpg,jpeg}')
		.pipe(gulp.dest('./dist/img'));
})


// Task watch
gulp.task('serve', function () {
	browserSync.init({
		server: {
			baseDir: './dist',
		},
		port: 8000
	})
	gulp.watch(['./_plugins.json', './_plugins/*.css', './_plugins/*.js'], gulp.parallel('mergeCSS', 'mergeJS'))
	gulp.watch(['./templates/**/**.pug', './_components/**/**.pug'], { since: gulp.lastRun('html', 500) }, gulp.series('html'))
	gulp.watch(['./_components/**/**.sass',], { since: gulp.lastRun('css', 500) }, gulp.series('css'))
	gulp.watch(['./_components/**/**.js'], { since: gulp.lastRun('scripts', 500) }, gulp.series('scripts'))
	gulp.watch(['./img/**/**.{svg,gif,png,jpg,jpeg}'], gulp.series('cleanImages', 'copyImages'))
	gulp.watch('./dist').on('change', browserSync.reload)
})


gulp.task('default', gulp.series(
	'clean',
	'copyImages',
	'copyFavicon',
	'copyFonts',
	'copyPolyfill',
	'mergeJS',
	'mergeCSS',
	'html',
	'css',
	'scripts',
	'serve',
))
