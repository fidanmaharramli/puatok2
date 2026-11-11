$(document).ready(function () {
    // Hadisə document-ə bağlanır: səbətin HTML-i yenilənsə də yeni silmə düymələri işləyir.
    $(document).on("submit", ".removeBasketForm", async function (event) {
        event.preventDefault();
        const form = this;
        const $cart = $(form).closest(".cart-block");
        if ($cart.data("removing")) return;

        // Eyni səbətdən ardıcıl kliklə təkrar silmə sorğularının göndərilməsi dayandırılır.
        $cart.data("removing", true);
        $cart.find(".removeBasketForm button").prop("disabled", true);
        $cart.find(".basket-error").prop("hidden", true).text("");

        try {
            // FormData kitabın ID-sini və antiforgery token-i birlikdə göndərir.
            const response = await fetch(form.action, {
                method: "POST",
                body: new FormData(form)
            });
            if (!response.ok || response.redirected) {
                throw new Error("Kitabı səbətdən silmək alınmadı. Səhifəni yeniləyib yenidən yoxlayın.");
            }

            // Serverin qaytardığı partial say, qiymət və kitab siyahısını birlikdə yeniləyir.
            const html = await response.text();
            $cart.html(html);
        } catch (error) {
            // Xəta zamanı mövcud səbət saxlanır və istifadəçiyə xəbər göstərilir.
            $cart.find(".basket-error").text(error.message || "Səbəti yeniləmək alınmadı.").prop("hidden", false);
        } finally {
            $cart.data("removing", false);
            $cart.find(".removeBasketForm button").prop("disabled", false);
        }
    });

    const modalElement = document.getElementById("quickModal");
    if (!modalElement) return;

    const modal = bootstrap.Modal.getOrCreateInstance(modalElement);
    const $dialog = $(modalElement).find(".modal-dialog");
    let activeRequest;
    let requestNumber = 0;
    let trigger;

    function destroySliders() {
        $dialog.find(".slick-initialized").each(function () {
            $(this).slick("unslick");
        });
    }

    function initializeSliders() {
        const $images = $dialog.find("#quickModalImages");
        const $thumbnails = $dialog.find("#quickModalThumbnails");
        if (!$images.length || !$images.children().length) return;

        if (!$images.hasClass("slick-initialized")) {
            $images.slick({
                slidesToShow: 1,
                arrows: false,
                fade: true,
                infinite: false,
                asNavFor: "#quickModalThumbnails"
            });
            $thumbnails.slick({
                slidesToShow: Math.min(4, $thumbnails.children().length),
                arrows: true,
                infinite: false,
                focusOnSelect: true,
                asNavFor: "#quickModalImages",
                prevArrow: '<button type="button" class="slick-prev" aria-label="Previous image"><i class="fa fa-chevron-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next" aria-label="Next image"><i class="fa fa-chevron-right"></i></button>'
            });
        }

        $images.slick("setPosition");
        $thumbnails.slick("setPosition");
        modal.handleUpdate();
    }

    function showMessage(message, isError) {
        destroySliders();
        $dialog.html(
            '<div class="modal-content p-4">' +
            '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>' +
            '<h3 id="quickModalTitle">Book preview</h3>' +
            '<p class="mb-0" role="' + (isError ? "alert" : "status") + '"></p></div>'
        );
        $dialog.find("p").text(message);
    }

    // Delegation also handles the duplicate cards created by Slick.
    $(document).on("click", ".bookModalIcon", async function (event) {
        event.preventDefault();
        trigger = this;
        const url = $(this).attr("href");
        const currentRequest = ++requestNumber;
        if (activeRequest) activeRequest.abort();
        activeRequest = new AbortController();

        showMessage("Loading book…", false);
        modal.show();

        try {
            const response = await fetch(url, { signal: activeRequest.signal });
            if (!response.ok) {
                throw new Error(response.status === 404
                    ? "This book could not be found."
                    : "The book could not be loaded. Please try again.");
            }
            const html = await response.text();
            if (currentRequest !== requestNumber) return;

            destroySliders();
            $dialog.html(html);
            $dialog.find("img").on("load", function () {
                if ($(modalElement).hasClass("show")) initializeSliders();
            });
            if ($(modalElement).hasClass("show")) initializeSliders();
        } catch (error) {
            if (error.name === "AbortError" || currentRequest !== requestNumber) return;
            showMessage(error.message || "The book could not be loaded. Please try again.", true);
        }
    });

    modalElement.addEventListener("shown.bs.modal", initializeSliders);
    modalElement.addEventListener("hide.bs.modal", function () {
        requestNumber++;
        if (activeRequest) activeRequest.abort();
    });
    modalElement.addEventListener("hidden.bs.modal", function () {
        destroySliders();
        $dialog.empty();
        if (trigger && trigger.isConnected) trigger.focus();
    });

    $(".addBasket").click(function (ev) {
        ev.preventDefault();
        let url = $(this).attr("href");
        fetch(url)
            .then((response) => response.text())
            .then((data) => {
                $(".cart-block").html(data);
                console.log(data);
            });
            
    });                       

});


