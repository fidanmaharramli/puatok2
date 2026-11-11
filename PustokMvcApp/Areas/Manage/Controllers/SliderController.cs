using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using PustokMvcApp.Areas.Manage.ViewModels.SliderVms;
using PustokMvcApp.Areas.Manage.Views.Slider;
using PustokMvcApp.Data;
using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.Controllers
{
    [Area("Manage")]
    [Authorize(Roles = "Admin")]
    public class SliderController(AppDbContext context) : Controller
    {
        public IActionResult Index()
        {
            var sliders = context.Sliders.ToList();
            return View(sliders);
        }

        public IActionResult Details(Guid id)
        {
            var slider = context.Sliders.FirstOrDefault(s => s.Id == id);
            if (slider is null)
            {
                return NotFound();
            }

            return View(slider);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(SliderCreateVm sliderVm)
        {
            if (!ModelState.IsValid)
            {
                return View(sliderVm);
            }

            var slider = new Slider
            {
                Title = sliderVm.Title,
                Order = sliderVm.Order,
                Description = sliderVm.Description,
                ButtonUrl = sliderVm.ButtonUrl,
                ButtonText = sliderVm.ButtonText
            };
            var file = sliderVm.ImageFile;
            if (file != null)
            {
                if (!file.ContentType.Contains("image/"))
                {
                    ModelState.AddModelError("ImageFile", "File must be image type");
                    return View(sliderVm);
                }

                if (file.Length > 2* 1024 * 1024)
                {
                    ModelState.AddModelError("ImageFile", "File size must be less than 2MB");
                    return View(sliderVm);
                }

                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image","bg-images", fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                slider.ImageUrl = "/image/bg-images/" + fileName;
            }

            context.Sliders.Add(slider);
            context.SaveChanges();

            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public IActionResult Edit(Guid id)
        {
            var slider = context.Sliders.FirstOrDefault(s => s.Id == id);
            if (slider is null)
            {
                return NotFound();
            }
            var sliderEditVm = new SliderEditVm
            {
                Title = slider.Title,
                Description = slider.Description,
                ButtonText = slider.ButtonText,
                ButtonUrl = slider.ButtonUrl,
                Order = slider.Order,
                Image = slider.ImageUrl

            };
            return View(sliderEditVm);
        }

        [HttpPost]
        public IActionResult Edit(Guid id, SliderEditVm sliderEditVm)
        {
            var slider = context.Sliders.FirstOrDefault(s => s.Id == id);
            if (slider is null)
            {
                return NotFound();
            }
            if (!ModelState.IsValid)
            {
                return View(sliderEditVm);
            }
            slider.Title = sliderEditVm.Title;
            slider.Description = sliderEditVm.Description;
            slider.ButtonText = sliderEditVm.ButtonText;
            slider.ButtonUrl = sliderEditVm.ButtonUrl;
            slider.Order = sliderEditVm.Order;
            var file = sliderEditVm.ImageFile;
            if (file != null)
            {
                if (!file.ContentType.Contains("image/"))
                {
                    ModelState.AddModelError("ImageFile", "File must be image type");
                    return View(sliderEditVm);
                }
                if (file.Length > 2 * 1024 * 1024)
                {
                    ModelState.AddModelError("ImageFile", "File size must be less than 2MB");
                    return View(sliderEditVm);
                }

                var oldFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", slider.ImageUrl.TrimStart('/'));
                if (System.IO.File.Exists(oldFilePath))
                {
                    System.IO.File.Delete(oldFilePath);
                }

                var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "bg-images", fileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                slider.ImageUrl = "/image/bg-images/" + fileName;
            }
            context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpGet]
        public async Task<IActionResult> Delete(Guid id)
        {
            var slider = context.Sliders.FirstOrDefault(s => s.Id == id);
            if (slider is null)
            {
                return NotFound();
            }
            string oldFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", slider.ImageUrl.TrimStart('/'));
            if (System.IO.File.Exists(oldFilePath))
            {
                System.IO.File.Delete(oldFilePath);

            }
            context.Sliders.Remove(slider);
            await context.SaveChangesAsync ();
            return RedirectToAction("Index");
        }


    }
}
