Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4EE3B8D6E
	for <regressions@lists.linux.dev>; Sat,  6 Dec 2025 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765018009; cv=none; b=TvqhfCAQ20a+DU4hi9WNd/pfhRrEiw1B1slZBsJ66fKE7+ia4ijGuDaT6i7Mi5WEzmJKk6GFXJhozeGpXcUlU8agi479+EVsC8AEW6slGY5X7l5w2tgaxuR7iMSy4/omJx2E/ZvcUrmd3RudUFJX3T1EsXmI/8s4uj1LVG8hU70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765018009; c=relaxed/simple;
	bh=3Ne55HYvIGzsxE6lBs+J9kvbp/auKRJ4342PVym7TfI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeOHwPhoUVq6KafzYcKEsnC9V1wF4m6SVS6bubDc+CE+DVgmBiL7LODAfkniX1a95Jc4S5r8z5idC3MJzXz8t+luQ8pzCEl2a4niNlmMW2rkGqL0qUrNWozydOzyBc9/bJX6itr1Kn42SQshfAatU45lnX28jnzfCKJI67HKFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXk2bDX7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXk2bDX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E26C116D0
	for <regressions@lists.linux.dev>; Sat,  6 Dec 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765018008;
	bh=3Ne55HYvIGzsxE6lBs+J9kvbp/auKRJ4342PVym7TfI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=PXk2bDX7KdAbJQCo/RoiJHfPdbpC9vrxGKemcap4xb3fWP5yXDUqKJkw/ZsQMGM5k
	 dVXrnFaR2Y95oDVgcabaEqot4tL2SD+iiU7jNgyrGWKPIxqYJRK4sHqo0WuvWG5+69
	 VHYcM71S6ZTquS+OZtfulO7D2wmbh0NH0TskKYn27QdeoFDmIs5YWhLhNVYLXM+2Mf
	 TfKLOrO5m5d/uwRLU3Q17UUQYHIMRTjbwAB89212sxOtc7Sls3XtVwzUXzVUi7YrUx
	 Zvv0sUP3CiXc2bqW1i0rTW+HMAOLEQrBmBGxJwE0s8wTFzJHOz+0U28NZmDuIgu3LC
	 tL6vxWH6ya1gA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so25739651fa.0
        for <regressions@lists.linux.dev>; Sat, 06 Dec 2025 02:46:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDrt0ysIW+vNOVDMS+EahwL0J3Wc5GrA41wGMxvESMr6MBe0Z/Zsc1UjlmdCMybQ7AC6CJt+KwNSSpjA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+AY0LqfVRxGHxLEjyAE+XGMOXQYb3A/7ueyfoygp6NiKwJpQE
	w7gibPxYomAWvYa1Rnm9Dv5GzWbyk+6dCc+5DUmtkkJmQiw83kgbkV/c55i3zwGY+TTJKYokTXW
	Mlvmy1gkbwlOdpHDtBk5CyGea1ltbmrbaUav/HPvnbw==
X-Google-Smtp-Source: AGHT+IHjoTCsoXdOpEYFwbC11jycFi+lPXHBD3lo6btqHsUrnQCOleubWzoKMCLteiJ+hJuRMdyLLJxIfO2MOTTbpPY=
X-Received: by 2002:a05:6512:a96:b0:595:7e9c:ce00 with SMTP id
 2adb3069b0e04-5987e8be416mr630010e87.25.1765018007594; Sat, 06 Dec 2025
 02:46:47 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 6 Dec 2025 02:46:46 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 6 Dec 2025 02:46:46 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251205230724.2374682-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205230724.2374682-1-safinaskar@gmail.com>
Date: Sat, 6 Dec 2025 02:46:46 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfN_gak+b2hmaZQKno1ehCKPDrH0UvGcXDsdye-MjDVow@mail.gmail.com>
X-Gm-Features: AQt7F2p5gAad-Rcjwp1NtHEEbD32fqDeg8j4vtF6lmcmVkYXUW6ISuG07Qo4dTw
Message-ID: <CAMRc=MfN_gak+b2hmaZQKno1ehCKPDrH0UvGcXDsdye-MjDVow@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Add quirk for Dell Precision 7780
To: Askar Safin <safinaskar@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Dell.Client.Kernel@dell.com, 
	Mario Limonciello <superm1@kernel.org>, patches@lists.linux.dev, 
	Askar Safin <safinaskar@zohomail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi!

Thanks for the patch.

On Fri, 5 Dec 2025 23:32:42 +0100, Askar Safin <safinaskar@gmail.com> said:
> Dell Precision 7780 often wakes up on its own from suspend. Sometimes
> wake up happens immediately (i. e. within 7 seconds), sometimes it happens
> after, say, 30 minutes.
>
> Fixes: 1796f808e4bb ("HID: i2c-hid: acpi: Stop setting wakeup_capable")
> Reported-by: Askar Safin <safinaskar@zohomail.com>
> Link: https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
> Cc: <stable@vger.kernel.org>
> Tested-by: Askar Safin <safinaskar@gmail.com>
> Signed-off-by: Askar Safin <safinaskar@gmail.com>

Please don't add Tested-by, Reported-by, etc. if you're the author of the.
Tested-by should be added by someone else who tested your patch, it doesn't
make much sense otherwise because I sure do expect you test your changes if
you have access to the right hardware. :)

> ---
>  drivers/gpio/gpiolib-acpi-quirks.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
> index 7b95d1b03361..a0116f004975 100644
> --- a/drivers/gpio/gpiolib-acpi-quirks.c
> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
> @@ -370,6 +370,28 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>  			.ignore_wake = "ASCP1A00:00@8",
>  		},
>  	},
> +	{
> +		/*
> +		 * Spurious wakeups, likely from touchpad controller
> +		 * Dell Precision 7780
> +		 * Found in BIOS 1.24.1
> +		 *
> +		 * Found in touchpad firmware, installed by Dell Touchpad Firmware Update Utility version 1160.4196.9, A01
> +		 * ( Dell-Touchpad-Firmware-Update-Utility_VYGNN_WIN64_1160.4196.9_A00.EXE ),
> +		 * released on 11 Jul 2024
> +		 *
> +		 * https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 7780"),
> +			DMI_MATCH(DMI_BOARD_NAME, "0C6JVW"),
> +		},
> +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
> +			.ignore_wake = "VEN_0488:00@355",
> +		},
> +	},
>  	{} /* Terminating entry */
>  };
>

Looks good to me, but I'll give GPIO ACPI maintainers time to chime in.

Bart
