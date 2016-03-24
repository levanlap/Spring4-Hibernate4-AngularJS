var gulp = require('gulp');
var minifyCss = require('gulp-minify-css');
 
gulp.task('minify-css', function() {
  return gulp.src('css/**/*.css')
    .pipe(minifyCss({compatibility: 'ie8'}))
    .pipe(gulp.dest('css_mini'));
});

gulp.task('default', ['minify-css'], function() {
  // watch for HTML changes
  gulp.watch('css/**/*.css', function() {
    gulp.run('minify-css');
  });
});