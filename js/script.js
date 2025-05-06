// script.js
document.getElementById('checkIn').addEventListener('click', function() {
    this.classList.add('checking-in');
    setTimeout(() => {
        window.location.href = 'index.jsp';
    }, 680);
});