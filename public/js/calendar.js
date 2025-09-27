document.addEventListener("DOMContentLoaded", () => {
  const calendar = document.getElementById("calendar");
  const monthYear = document.getElementById("monthYear");
  const prevMonthBtn = document.getElementById("prevMonth");
  const nextMonthBtn = document.getElementById("nextMonth");

  const meses = ["Enero","Febrero","Marzo","Abril","Mayo","Junio",
                 "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];

  let today = new Date();
  let currentMonth = today.getMonth();
  let currentYear = today.getFullYear();

  function parseDate(str) {
    if (!str || str === "-") return null;
    const [day, month, year] = str.split("/");
    return new Date(2000 + parseInt(year), parseInt(month) - 1, parseInt(day));
  }

  function getPrestamosFromTable() {
    const rows = document.querySelectorAll(".prestamosTable tr#prestamo");
    let data = [];
    rows.forEach(row => {
      const cols = row.querySelectorAll("td span");
      let fPrestamo = parseDate(cols[1].textContent.trim());
      let fLimite = parseDate(cols[2].textContent.trim());
      let fEntrega = parseDate(cols[3].textContent.trim());
      data.push({ fPrestamo, fLimite, fEntrega });
    });
    return data;
  }

  function renderCalendar(month, year) {
    const prestamos = getPrestamosFromTable();

    calendar.innerHTML = ""; 
    monthYear.textContent = `${meses[month]} ${year}`;

    const firstDay = new Date(year, month, 1).getDay(); 
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    for (let i = 0; i < (firstDay === 0 ? 6 : firstDay - 1); i++) {
      const emptyCell = document.createElement("div");
      emptyCell.classList.add("calendar-day", "nada");
      calendar.appendChild(emptyCell);
    }

    for (let d = 1; d <= daysInMonth; d++) {
      const date = new Date(year, month, d);
      const cell = document.createElement("div");
      cell.textContent = d;
      cell.classList.add("calendar-day");

      prestamos.forEach(p => {
        if (p.fPrestamo && sameDate(date, p.fPrestamo)) {
          cell.classList.add("prestamo");
        }
        if (p.fLimite && sameDate(date, p.fLimite)) {
          cell.classList.add("devolucion");
        }
        if (p.fLimite && date > p.fLimite && !p.fEntrega) {
          cell.classList.add("multa");
        }
        if (p.fEntrega && sameDate(date, p.fEntrega)) {
          cell.classList.add("devolucion");
        }
      });

      calendar.appendChild(cell);
    }
  }

  function sameDate(d1, d2) {
    return (
      d1.getFullYear() === d2.getFullYear() &&
      d1.getMonth() === d2.getMonth() &&
      d1.getDate() === d2.getDate()
    );
  }

  prevMonthBtn.addEventListener("click", () => {
    currentMonth--;
    if (currentMonth < 0) {
      currentMonth = 11;
      currentYear--;
    }
    renderCalendar(currentMonth, currentYear);
  });

  nextMonthBtn.addEventListener("click", () => {
    currentMonth++;
    if (currentMonth > 11) {
      currentMonth = 0;
      currentYear++;
    }
    renderCalendar(currentMonth, currentYear);
  });

  renderCalendar(currentMonth, currentYear);
});

