/* =============================================
   PORTFOLIO JAVASCRIPT — JATIN MEHMI
   ============================================= */

// ===== CURSOR =====
const cursor = document.getElementById('cursor');
const cursorFollower = document.getElementById('cursor-follower');
let mouseX = 0, mouseY = 0;
let followerX = 0, followerY = 0;

document.addEventListener('mousemove', (e) => {
  mouseX = e.clientX;
  mouseY = e.clientY;
  cursor.style.left = mouseX + 'px';
  cursor.style.top = mouseY + 'px';
});

function animateFollower() {
  followerX += (mouseX - followerX) * 0.1;
  followerY += (mouseY - followerY) * 0.1;
  cursorFollower.style.left = followerX + 'px';
  cursorFollower.style.top = followerY + 'px';
  requestAnimationFrame(animateFollower);
}
animateFollower();

// ===== NAVBAR SCROLL =====
const navbar = document.getElementById('navbar');
window.addEventListener('scroll', () => {
  navbar.classList.toggle('scrolled', window.scrollY > 50);
});

// ===== HAMBURGER MENU =====
const hamburger = document.getElementById('hamburger');
const navLinks = document.getElementById('nav-links');

hamburger.addEventListener('click', () => {
  navLinks.classList.toggle('open');
  const spans = hamburger.querySelectorAll('span');
  if (navLinks.classList.contains('open')) {
    spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
    spans[1].style.opacity = '0';
    spans[2].style.transform = 'rotate(-45deg) translate(5px, -5px)';
  } else {
    spans[0].style.transform = '';
    spans[1].style.opacity = '';
    spans[2].style.transform = '';
  }
});

navLinks.addEventListener('click', (e) => {
  if (e.target.classList.contains('nav-link')) {
    navLinks.classList.remove('open');
    const spans = hamburger.querySelectorAll('span');
    spans[0].style.transform = '';
    spans[1].style.opacity = '';
    spans[2].style.transform = '';
  }
});

// ===== TYPEWRITER =====
const roles = [
  'Mobile App Developer',
  'Technical Trainer',
  'Android Engineer',
  'Flutter Developer',
  'Kotlin Specialist',
];

let roleIndex = 0;
let charIndex = 0;
let isDeleting = false;
const typedText = document.getElementById('typed-text');

function typeWrite() {
  const currentRole = roles[roleIndex];
  if (!isDeleting) {
    typedText.textContent = currentRole.substring(0, charIndex + 1);
    charIndex++;
    if (charIndex === currentRole.length) {
      isDeleting = true;
      setTimeout(typeWrite, 1800);
      return;
    }
    setTimeout(typeWrite, 90);
  } else {
    typedText.textContent = currentRole.substring(0, charIndex - 1);
    charIndex--;
    if (charIndex === 0) {
      isDeleting = false;
      roleIndex = (roleIndex + 1) % roles.length;
      setTimeout(typeWrite, 300);
      return;
    }
    setTimeout(typeWrite, 45);
  }
}
setTimeout(typeWrite, 1000);

// ===== COUNTER ANIMATION =====
function animateCounter(el, target, duration = 1500) {
  let start = 0;
  const increment = target / (duration / 16);
  function step() {
    start = Math.min(start + increment, target);
    el.textContent = Math.floor(start);
    if (start < target) requestAnimationFrame(step);
    else el.textContent = target;
  }
  requestAnimationFrame(step);
}

// ===== INTERSECTION OBSERVER (Reveal) =====
const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry, i) => {
    if (entry.isIntersecting) {
      setTimeout(() => {
        entry.target.classList.add('visible');
      }, i * 80);
      revealObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.1 });

document.querySelectorAll(
  '.skill-category, .about-grid, .contact-grid, .section-header, .hero-stats, .timeline-card, .highlight-item, .edu-card'
).forEach(el => {
  el.classList.add('reveal');
  revealObserver.observe(el);
});

// ===== TIMELINE STAGGER =====
const timelineCards = document.querySelectorAll('.timeline-item');
const tlObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry, i) => {
    if (entry.isIntersecting) {
      setTimeout(() => {
        entry.target.classList.add('tl-visible');
      }, i * 150);
      tlObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.1 });
timelineCards.forEach(card => {
  card.style.opacity = '0';
  card.style.transform = 'translateX(-20px)';
  card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
  tlObserver.observe(card);
});

// Dynamically add tl-visible class
document.addEventListener('scroll', () => {}, { passive: true });
const tlStyle = document.createElement('style');
tlStyle.textContent = `.tl-visible { opacity: 1 !important; transform: translateX(0) !important; }`;
document.head.appendChild(tlStyle);

// ===== COUNTER OBSERVER =====
const counterObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const nums = entry.target.querySelectorAll('.stat-num[data-target]');
      nums.forEach(num => {
        const target = parseInt(num.getAttribute('data-target'));
        animateCounter(num, target);
      });
      counterObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.5 });

const statsEl = document.getElementById('hero-stats');
if (statsEl) counterObserver.observe(statsEl);

// ===== SKILL BAR OBSERVER =====
const skillObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const fills = entry.target.querySelectorAll('.skill-fill');
      fills.forEach((fill, i) => {
        const width = fill.getAttribute('data-width');
        setTimeout(() => {
          fill.style.width = width + '%';
        }, i * 100 + 200);
      });
      skillObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.3 });

const skillsGrid = document.getElementById('skills-grid');
if (skillsGrid) skillObserver.observe(skillsGrid);

// ===== CONTACT FORM =====
function handleFormSubmit(e) {
  e.preventDefault();
  const form = document.getElementById('contact-form');
  const success = document.getElementById('form-success');
  const submitBtn = document.getElementById('form-submit');

  submitBtn.querySelector('.submit-text').textContent = 'Sending...';
  submitBtn.disabled = true;

  setTimeout(() => {
    form.style.display = 'none';
    success.classList.add('show');
  }, 1500);
}

// ===== SMOOTH SCROLL =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      const offset = 70;
      const top = target.getBoundingClientRect().top + window.pageYOffset - offset;
      window.scrollTo({ top, behavior: 'smooth' });
    }
  });
});

// ===== ACTIVE NAV on scroll =====
const sections = document.querySelectorAll('section[id]');
const navLinksAll = document.querySelectorAll('.nav-link');

const sectionObserver = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      navLinksAll.forEach(link => {
        link.style.color = '';
        if (link.getAttribute('href') === '#' + entry.target.id) {
          link.style.color = 'var(--text-primary)';
        }
      });
    }
  });
}, { threshold: 0.4 });

sections.forEach(section => sectionObserver.observe(section));

// ===== PARTICLES =====
const heroBg = document.querySelector('.hero-bg');
if (heroBg) {
  const particleStyle = document.createElement('style');
  particleStyle.textContent = `
    @keyframes pFloat {
      from { transform: translate(0,0) scale(1); opacity: 0.2; }
      to { transform: translate(var(--dx), var(--dy)) scale(1.4); opacity: 0.6; }
    }
  `;
  document.head.appendChild(particleStyle);

  for (let i = 0; i < 25; i++) {
    const p = document.createElement('div');
    const dx = (Math.random() - 0.5) * 60 + 'px';
    const dy = (Math.random() - 0.5) * 60 + 'px';
    p.style.cssText = `
      position:absolute;
      width:${Math.random()*3+1}px;height:${Math.random()*3+1}px;
      background:rgba(${Math.random()>.5?'124,58,237':'6,182,212'},${Math.random()*.3+.1});
      border-radius:50%;left:${Math.random()*100}%;top:${Math.random()*100}%;
      pointer-events:none;
      --dx:${dx};--dy:${dy};
      animation:pFloat ${Math.random()*6+5}s ease-in-out infinite alternate;
      animation-delay:${Math.random()*-10}s;
    `;
    heroBg.appendChild(p);
  }
}

console.log('%c 👋 Jatin Mehmi — Mobile App Developer & Technical Trainer', 'color:#a855f7;font-size:14px;font-weight:bold;');
console.log('%c 📧 jatinmehmi583@gmail.com | 📞 +91 7658848135', 'color:#22d3ee;font-size:12px;');
console.log('%c 🔗 https://github.com/Jatin2102786', 'color:#22d3ee;font-size:12px;');
