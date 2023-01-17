Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8D1841
	for <regressions@lists.linux.dev>; Tue, 17 Jan 2023 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673944436; x=1705480436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uH2fB088cGnOr7hqS9w5uSuu3uYOrmGvb6kAqqLC9f8=;
  b=HEOZtIvaHI/gT+tuCgfXPY/S0TQ/aVAhWrYxYeamzCJaw5F5/bsFHXD4
   lNpIUV3cdMXJAjHNz/K2oV891QR3GRxgKU/tB/nNJ6AYo9oo6YPgF5REk
   BajkxGHAtKbibSj3Nq0fcosDJ1VHYE7YNPTPJCXOEDJewbGjSHaUaImA3
   7Cpx3VNBmF3cVp4ypahIJI3C1h5tp2TWjxB5doIrGS5jBz4IK66G+qnF3
   YTOTUrlQ71HlHV1mtUs3sVt8tFhvTMU9Tpm8Ff2Av7cjMh0A2Rd5ju9w4
   vQzTxSbWNXCDI43+BsUpmWr2ed/T/7csj/O5GrquvQDLkWoPNTM2HUJpB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="312506362"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="312506362"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 00:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="661208510"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="661208510"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 17 Jan 2023 00:33:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pHhPi-00ARvt-0S;
	Tue, 17 Jan 2023 10:33:50 +0200
Date: Tue, 17 Jan 2023 10:33:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raul E Rangel <rrangel@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	regressions@lists.linux.dev,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gpiolib: acpi: Add a ignore wakeup quirk for Clevo
 NL5xRU
Message-ID: <Y8ZdbVT+5z+q9xvC@smile.fi.intel.com>
References: <20230116193702.31356-1-mario.limonciello@amd.com>
 <20230116193702.31356-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116193702.31356-3-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jan 16, 2023 at 01:37:02PM -0600, Mario Limonciello wrote:
> commit 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
> changed the policy such that I2C touchpads may be able to wake up the
> system by default if the system is configured as such.
> 
> However on Clevo NL5xRU there is a mistake in the ACPI tables that the
> TP_ATTN# signal connected to GPIO 9 is configured as ActiveLow and level
> triggered but connected to a pull up. As soon as the system suspends the
> touchpad loses power and then the system wakes up.
> 
> To avoid this problem, introduce a quirk for this model that will prevent
> the wakeup capability for being set for GPIO 9.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
> Reported-by: Werner Sembach <wse@tuxedocomputers.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1722#note_1720627
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 4287555a12408..9ef0f5641b521 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -1623,6 +1623,19 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>  			.ignore_interrupt = "AMDI0030:00@18",
>  		},
>  	},
> +	{
> +		/*
> +		 * Spurious wakeups from TP_ATTN# pin
> +		 * Found in BIOS 1.7.8
> +		 * https://gitlab.freedesktop.org/drm/amd/-/issues/1722#note_1720627
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_wake = "ELAN0415:00@9",
> +		},
> +	},
>  	{} /* Terminating entry */
>  };
>  
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


