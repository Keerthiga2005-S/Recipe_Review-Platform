// scripts.js
document.addEventListener('DOMContentLoaded', function() {
    const reviewForm = document.querySelector('form');

    if (reviewForm) {
        reviewForm.addEventListener('submit', function(event) {
            const rating = document.querySelector('input[name="rating"]').value;
            const comment = document.querySelector('textarea[name="comment"]').value;

            if (!rating || !comment) {
                alert('Please fill in all fields before submitting your review.');
                event.preventDefault();
            }
        });
    }
});
