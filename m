Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DB717751
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693338870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HuHCGMiLx4xW8S2a7hbvjTMXFww51Wxx2CkFqb719KE=;
	b=AjzjeZvK6m5CA6+G823hY/rhK64ZUiIIp9lpiO/jBDbQw3b4A6gMEgY83GGr/JivqX8z54
	/2Stk9riC/g0ogCQLGxNpQLkH9unGpMdWw3uFFSSu0B/gTaJ7UegNQBIL1APQEZX2Lo2Rc
	lp61xnipRnyfC2XbDPvAVJ/23IK6uPw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-YZ_3BLzBNP6ZCowzyR2TcQ-1; Tue, 29 Aug 2023 15:54:28 -0400
X-MC-Unique: YZ_3BLzBNP6ZCowzyR2TcQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50daa85e940so3811569a12.0
        for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 12:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693338868; x=1693943668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuHCGMiLx4xW8S2a7hbvjTMXFww51Wxx2CkFqb719KE=;
        b=Fg21w0Gev9Y2mKVs7mhPen0DAUIRVKFUO2Xuh1rcRb78fvpAwgwfUKiBMx+ElaKnpL
         HCC1tiIKkSMyi4wIOEUP4VSaCJZLFGvgqYYqy2jRYYGm0qX/zC3WAd7yA1QhATc8LAdy
         oDT4joWfjun9hU+XOdBfEN9Q9BfEQqzlJFj2LTlbsrJnfHeyy66UXK8UkG9zSGUuWEvC
         rqqTW0ZJFswYpjBu9eXekuW5oVxsYayWbp12sOHJkgehNuz81MRanqhLiQoRjImXgRO3
         23AMOubOwraDMmGmX8S5aRFcBH0ejyZPxwj868jrUKKXpMOwg59Aow2KdPJ07+WiCZIY
         l20g==
X-Gm-Message-State: AOJu0YwXLRs0mU4iwrE9JbYxVf94tPtTLpjGwOEc1elIo8R6TsOr1wNE
	37huuvWuDdPWZ10nuW1ANXNFyPJl7l+mXvhHs1616Cyx0EncSiHRNVOelRIL2YpdQJ9RzjVPHPr
	DM9+1c1/7lnXWwLTjgTD8Av8=
X-Received: by 2002:a05:6402:1496:b0:522:3790:1303 with SMTP id e22-20020a056402149600b0052237901303mr192334edv.32.1693338867809;
        Tue, 29 Aug 2023 12:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcgynvwSzHT0DF2I6Ry5Urcaus6FNE7lpQUKVX2BsxrF8RbLtoXXMbTzoqySuJa/5OWU5INQ==
X-Received: by 2002:a05:6402:1496:b0:522:3790:1303 with SMTP id e22-20020a056402149600b0052237901303mr192321edv.32.1693338867497;
        Tue, 29 Aug 2023 12:54:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i9-20020aa7c709000000b0052a198d8a4dsm5995023edq.52.2023.08.29.12.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 12:54:26 -0700 (PDT)
Message-ID: <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
Date: Tue, 29 Aug 2023 21:54:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To: Mario Limonciello <mario.limonciello@amd.com>, linus.walleij@linaro.org
Cc: Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, lucapgl2001@gmail.com
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230829165627.156542-4-mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

On 8/29/23 18:56, Mario Limonciello wrote:
> Lenovo ideapad 5 doesn't use interrupts for GPIO 0, and so internally
> debouncing with WinBlue debounce behavior means that the GPIO doesn't
> clear until a separate GPIO is used (such as touchpad).
> 
> Prefer to use legacy debouncing to avoid problems.
> 
> Reported-by: Luca Pigliacampo <lucapgl2001@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217833
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I'm not happy to see yet another DMI quirk solution here.

and I guess you're not happy with this either...

Are we sure there is no other way? Did you check an acpidump
for the laptop and specifically for its ACPI powerbutton handling?

I would expect the ACPI powerbutton handler to somehow clear
the bit, like how patch 1/3 clears it from the GPIO chip's
own IRQ handler.

I see that drivers/acpi/button.c does:

static u32 acpi_button_event(void *data)
{
        acpi_os_execute(OSL_NOTIFY_HANDLER, acpi_button_notify_run, data);
        return ACPI_INTERRUPT_HANDLED;
}

So unless I'm misreading something here, there is some AML being
executed on power-button events. So maybe there is something wrong
with how Linux interprets that AML ?

Regards,

Hans




> ---
>  drivers/pinctrl/pinctrl-amd.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index a2468a988be3..2e1721a9249a 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -8,6 +8,7 @@
>   *
>   */
>  
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/bug.h>
>  #include <linux/kernel.h>
> @@ -41,6 +42,27 @@ module_param(powerbtn, int, 0444);
>  MODULE_PARM_DESC(powerbtn,
>  		 "Power button debouncing: 0=traditional, 1=windows, -1=auto");
>  
> +struct pinctrl_amd_dmi_quirk {
> +	int powerbtn;
> +};
> +
> +static const struct dmi_system_id pinctrl_amd_dmi_quirks[] __initconst = {
> +	{
> +		/*
> +		 * Lenovo Ideapad 5
> +		 * Power button GPIO not cleared until touchpad movement
> +		 * https://bugzilla.kernel.org/show_bug.cgi?id=217833
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82LM"),
> +		},
> +		.driver_data = &(struct pinctrl_amd_dmi_quirk) {
> +			.powerbtn = 0,
> +		},
> +	}
> +};
> +
>  static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
>  {
>  	unsigned long flags;
> @@ -1084,8 +1106,16 @@ static void handle_powerbtn(struct amd_gpio *gpio_dev)
>  {
>  	u32 pin_reg;
>  
> -	if (powerbtn == -1)
> -		return;
> +	if (powerbtn == -1) {
> +		const struct pinctrl_amd_dmi_quirk *quirk = NULL;
> +		const struct dmi_system_id *id;
> +
> +		id = dmi_first_match(pinctrl_amd_dmi_quirks);
> +		if (!id)
> +			return;
> +		quirk = id->driver_data;
> +		powerbtn = quirk->powerbtn;
> +	}
>  
>  	pin_reg = readl(gpio_dev->base + WAKE_INT_MASTER_REG);
>  	switch (powerbtn) {

