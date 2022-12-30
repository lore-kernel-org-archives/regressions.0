Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014497E
	for <regressions@lists.linux.dev>; Fri, 30 Dec 2022 10:04:38 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id f184so5911642vkh.2
        for <regressions@lists.linux.dev>; Fri, 30 Dec 2022 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ExYPh7ZCQLAcVoV2/SqeVJ+2V2M6l9fcSXq3tB4QxWY=;
        b=oEYPzAA+zkVxpKYc173YYeMY/bnwwE6uQr5YAZo6wkXXeoKXrRVo9ECSbBJMGIodQW
         1O6DKlbOtBU5Wao+gvmkDjnAiSMurzBgSMPK+3BxWoq20LgoRTLWLsDGojFukSjc+kkJ
         6qV7cHBzbTe5vnBE0r+68GkTFBybeLL9PyRf17h15eJtni37WNzNzfRSJ+PbBpeVZMsu
         xsPqO3HqoMLhNVtqaml4WnVIo+U/5Tq3uTo45N+R3gQvXUTUgZuRHqATrUasLLcaTGQF
         v1jmNG81SIs2OgyLXk2veo+CsIGQbhe24bTql+LNvBgvh92SOO+EWMdgSFSzq9Vrp4su
         WHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExYPh7ZCQLAcVoV2/SqeVJ+2V2M6l9fcSXq3tB4QxWY=;
        b=o9aJ07PqbrcWDdyJdHQ8Sk29/q0DjeOd/CraufVyfCi7UjDYI2kDtI1aqYWOzj23u6
         /PGWZlJa7ZAq8ZQneGK3nO8GkDf/84tzjGWyDmYC+YlkzF5/kBBTpTWOIfdTjScOes6g
         mJ+uAvCft28IyJZE8m1Uj7sXRoOaLEzwT93Cg7rNWp+pteTdQOMDPtBs4klcBa2YKPtO
         ULfT161LU13kxzZmfQSrTzpSJ1ilmemC2uu6vXlcbwJcZUQaBJMmJSfw+EbP5T5GJ77D
         CZ48n59QRT6zsEgUVZM7/uCOpOZs5p1/ZAu+2y/Ua8i3y2sqLuWLjik0w3nRCZkHzfP9
         WkHQ==
X-Gm-Message-State: AFqh2krEjyEJapvQXo68pKl52QtgUdwoA9ZBY5aXeocvU9MX09wrvyCd
	9TPTVDyhdLYzb4KSJuOvp3joqzdxHAVm+fFXmsG8kw==
X-Google-Smtp-Source: AMrXdXt7wuPRN1BtM7zjBgL/feVCI7O7KUPBfnqtP4FXAjQdG6O7OsnSKbdt+QnfbTIcRLLsLMiNIt47C0DxHFImiUA=
X-Received: by 2002:a1f:2508:0:b0:3b7:bd26:9251 with SMTP id
 l8-20020a1f2508000000b003b7bd269251mr3407821vkl.25.1672394677740; Fri, 30 Dec
 2022 02:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221229164501.76044-1-hdegoede@redhat.com>
In-Reply-To: <20221229164501.76044-1-hdegoede@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 30 Dec 2022 11:04:26 +0100
Message-ID: <CAMRc=MeZ407hS2D2-PGgeyhOMfVopYTxCS-Y0CAnaKJeJHSZsA@mail.gmail.com>
Subject: Re: [PATCH 6.2 regression fix] gpiolib: Fix using uninitialized
 lookup-flags on ACPI platforms
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	"regressions @ lists . linux . dev" <regressions@lists.linux.dev>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 29, 2022 at 5:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups") refactors
> fwnode_get_named_gpiod() and gpiod_get_index() into a unified
> gpiod_find_and_request() helper.
>
> The old functions both initialized their local lookupflags variable to
> GPIO_LOOKUP_FLAGS_DEFAULT, but the new code leaves it uninitialized.
>
> This is a problem for at least ACPI platforms, where acpi_find_gpio()
> only does a bunch of *lookupflags |= GPIO_* statements and thus relies
> on the variable being initialized.
>
> The variable not being initialized leads to:
>
> 1. Potentially the wrong flags getting used
> 2. The check for conflicting lookup flags in gpiod_configure_flags():
>    "multiple pull-up, pull-down or pull-disable enabled, invalid config"
>    sometimes triggering, making the GPIO unavailable
>
> Restore the initialization of lookupflags to GPIO_LOOKUP_FLAGS_DEFAULT
> to fix this.
>
> Fixes: 8eb1f71e7acc ("gpiolib: consolidate GPIO lookups")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note I'm not working and not reading work email until Monday January 9th.
> I hit this while doing some hobby stuff and I decided to send this out
> right away to avoid others potentially wasting time debugging this, but
> I will not see any replies until Monday January 9th.
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5a66d9616d7c..939c776b9488 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3905,8 +3905,8 @@ static struct gpio_desc *gpiod_find_and_request(struct device *consumer,
>                                                 const char *label,
>                                                 bool platform_lookup_allowed)
>  {
> +       unsigned long lookupflags = GPIO_LOOKUP_FLAGS_DEFAULT;
>         struct gpio_desc *desc = ERR_PTR(-ENOENT);
> -       unsigned long lookupflags;
>         int ret;
>
>         if (!IS_ERR_OR_NULL(fwnode))
> --
> 2.38.1
>

Queued for fixes, thanks!

Bart
