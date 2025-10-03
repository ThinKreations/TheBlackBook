import { getPrestamosUsuario } from "./prestamos.js";

document.addEventListener("DOMContentLoaded", async function () {
  const calendarEl = document.getElementById("calendar");
  const monthYearEl = document.getElementById("monthYear");
  const prevBtn = document.getElementById("prevMonth");
  const nextBtn = document.getElementById("nextMonth");

  const correo = localStorage.getItem("correo");
  if (!correo) return;

  const prestamos = await getPrestamosUsuario(correo);

  let date = new Date();

  function sameDay(d1, d2) {
    return d1.getFullYear() === d2.getFullYear() &&
           d1.getMonth() === d2.getMonth() &&
           d1.getDate() === d2.getDate();
  }

  const prestamosDates = prestamos.map(p => new Date(p.fecha_prestamo));
  const devolucionDates = prestamos.map(p => new Date(p.fecha_lim_dev));
  const multaDates = prestamos
      .filter(p => p.multa != null)
      .map(p => {
        if(p.fecha_devolucion){
          const d = new Date(p.fecha_devolucion);
          d.setDate(d.getDate() + 3);
          return d;
        }
        return new Date(p.fecha_lim_dev); 
      });

  function renderCalendar() {
    calendarEl.innerHTML = "";
    const year = date.getFullYear();
    const month = date.getMonth();

    const monthNames = [
      "Enero","Febrero","Marzo","Abril","Mayo","Junio",
      "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"
    ];
    monthYearEl.textContent = `${monthNames[month]} ${year}`;
    
    const daysOfWeek = ["D","L","M","M","J","V","S"];
    daysOfWeek.forEach(d => {
      const header = document.createElement("div");
      header.classList.add("calendar-day","header");
      header.textContent = d;
      calendarEl.appendChild(header);
    });

    const firstDay = new Date(year, month, 1).getDay();
    const lastDate = new Date(year, month+1, 0).getDate();
    const today = new Date();

    for (let i = 0; i < firstDay; i++) {
      const empty = document.createElement("div");
      empty.classList.add("calendar-day");
      calendarEl.appendChild(empty);
    }

    for (let d = 1; d <= lastDate; d++) {
      const dayEl = document.createElement("div");
      dayEl.classList.add("calendar-day");
      dayEl.textContent = d;

      const currentDate = new Date(year, month, d);

      if (
        currentDate.getDate() === today.getDate() &&
        currentDate.getMonth() === today.getMonth() &&
        currentDate.getFullYear() === today.getFullYear()
      ) {
        dayEl.classList.add("hoy");
      }
      
      if (prestamosDates.some(pd => sameDay(pd, currentDate))) dayEl.classList.add("prestamo");
      else if (devolucionDates.some(dd => sameDay(dd, currentDate))) dayEl.classList.add("devolucion");
      else if (multaDates.some(md => sameDay(md, currentDate))) dayEl.classList.add("multa");
      

      calendarEl.appendChild(dayEl);
    }
  }

  prevBtn.addEventListener("click", () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
  });

  nextBtn.addEventListener("click", () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
  });

  renderCalendar();
});

