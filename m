Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002316;
	b=dv7jnJEMuuUQDeVQdNqUt63RdHbtKS2mogBPjEiCZcoM3HYjqsXhbtfs/jaJR8e43LxZ
	 uMed4oOxVe7gfFdjC7YQteUqNo0J3Ra8bnW63sWRPvSeRHPVrT0av+6vnPTHSYiMHrhjP
	 2uOciJmXhTsY6YeY23Kl1rIjXH4ezK5o6+pUpJZ9lhEpMwItjrxrou9qEWZco9GBzyQ9u
	 PzUVsmaaan+QazdiTMeJDD7VKpyo+XmIZv/oC9skPwVlZvribQkD9x8NG+tCURRmr1ERE
	 l9dfISLowyP8RINSJm9r6aLu91BHBNeXbTIf4TIhT6KUh3PmTMSkAJu603uGwG3djzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DnVN4oQm5vTmEy9Yk/HP88sUnMp8Vqm6PKjzwgqph7k=;
	b=Z/2PYw+dj4hOKAiuTBEyiVy7E8WTeU0CyBICgviMG9eYpgFRwQXiP2/ntgmGXeR7stRP
	 oyGUcIHG4TqfMNnBEiJfiDGci8HpyQ0wUg8W+4Xyg/n6mYo0J5jRcCmbw7XPldT9hV34I
	 hfoZwameW4Ur2nNBlbRFZMp0AcDa3eA7i/4zV3pjpHNoz/jSzmqzprddg+3hTen6pDixU
	 xlvJg/tGTNMNKbk1RHVaBifvvIPeUcxdQDrOtYccg5cS90uXo4w7violLd6diXbTW1xlC
	 1ZvwzFX3mA0RpSiJEC6Wbv8XmPcHp1vu44FfmAgm4OJrRTGGgYWcs9fl0e2BpTaWnyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mlx4RbP1;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F49606A32A
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 11:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F49606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mlx4RbP1
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdab938dc83so475288a12.3
        for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002316; x=1795607116; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnVN4oQm5vTmEy9Yk/HP88sUnMp8Vqm6PKjzwgqph7k=;
        b=Mlx4RbP1F0Fjxjq1/HOuTlwajRtPhoOpmXMAUMTa5f4iKvaJ5qqo/7DxpLyfx12n+R
         4Pfcsc2Yw0LHcRAdiy1SBB6eH9euYvrD5FFKngE9OtEteROgBt2dW7vRkfmKYE8EUoSD
         W/vgVi12sccLKymXqBR3E5pjB7av1w+taTg2AQ6qCLTSvT+zoUqSBH7Tf5EBuDaTu+5f
         uoJh7+DJ0gnYO0Nc9qaDd21y59NQs/2mpe8IWW21RBq8wlZWspgHCNJZK+i8wxD2ISS6
         rMsCvJfDj1CiINUr8WA+FQitExTbe33S8XqAX3d0Jk3nGv20nwa4HEuS+Idy5dkyFu5G
         29/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002316; x=1795607116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnVN4oQm5vTmEy9Yk/HP88sUnMp8Vqm6PKjzwgqph7k=;
        b=SqsJi4Jmag8NhWiOTMaO7aC3NWSXqPvKcD9rMCF5+zseOOUQO7hsq2OjaxwTj733E2
         qHz39Vdl1J/iKIQk3CYpndyyPQoSCbTOPSWdrIJkm6hi9OGlKClj02+vawT71aNeu0tu
         IbsupfxHEoq7VMhxXSGq4jyXWHeU20RDQgwhDj3A+bzu/5GcsAGRx8hPLYH38qNlc9tr
         HtnPVXeZHGxSnqSr9TpRvbIUIHQvXIYpGvJctGglnpnM8n1MFHSCvjg7JFKP+E8BfCz2
         a0ZkyyTElXwV7tglyVXuwHSNuzpPzNOYCGWG0tAVRknsc3Hmf2P3NN/nVLO/nHCAn0Gs
         KkUg==
X-Forwarded-Encrypted: i=1; AL+hErFNUnlkSZRmf8QGx2qFrM/N34LCrlkxkEdaQOwV5g2BOJXfL+BbuG+sPAq1ZpIVTYZilw7Iw4fz0n78DA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+LMyb7ggryY0x/3mMzad7yQ4eVqGpGF0opZu+iswhISSQUrUjF
	0M3Mg5FblLjh9XxjExEovD1rooMeDUJAB9G5lAzqWOIYDE6SfPjF250l
X-Gm-Gg: AZFdTZcwR0csxypafDYtdG6wrNpMRw78MY6cYhAhcy7m3y+LzeUtnFpXjs0HgZn2Vz7
	uFP3armNdRxZkG1s1UTVgWJguDI4fD6LfUDSIQwxxB9Gicocla5UQBTDELstMwH9MM43bTCQffV
	8eUv+/Z+NQDNU+SgghhgXg0cszg+uieMtrddoTLVWqOgCcGjm/oot4l3K6koF3iVXoMrB8YTtl4
	EIs/YXV+ZwKfAovNAwMP5ouSqR2AeWfaGhMqAkgIZhDJ7AqVwouYGmne6cPSUDfDGtzFJiPUkYW
	tHE0p6Pmms4zMODy2rBLlZBIYglBJQS6pMKOeR75VuNtuSAvgYi/3atO6GTFbkYYBLvikAaWBxw
	RmtwVve2X05BJrl0OjhEiqLWPslDToa0OIwNu9vc8P8eEBFOUBMQdHy5KDMB9qCgvC42vsdhneS
	yxSKGUr0zVY/USCfyfQB96n4QGCxyyJIvxMKjpl0KJSRs5BL0U3GtdoFmnN0jPZlZ8qHCiq18sy
	JGmnr3qTkvYtug+fUUbRBWk5/5zjap+pQL6MdXGJ6vfc5oRLwsEM+lyJkEyWEz3LrUH6gKFHMBE
	WMkQcJpY5FnFcTTwlMbN3A==
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr2444000a91.36.1795002315663;
        Wed, 18 Nov 2026 03:45:15 -0800 (PST)
Received: from [0.0.0.0] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm8966783a91.3.2026.11.18.03.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:45:14 -0800 (PST)
Message-ID: <bd605c87-542f-43be-8e3c-01f2f3c14f28@gmail.com>
Date: Wed, 18 Nov 2026 19:45:11 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/x86: bitland-mifs-wmi: Add Redmi Book Pro 15
 2023 (TM2209) quirk
To: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev,
 shlyapugin@gmail.com, Musaev Ibragim <atomicus.xyz@gmail.com>
References: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
 <20261111124849.11309-1-rybalov.oleg.dev@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261111124849.11309-1-rybalov.oleg.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 20:48, Oleg Rybalov wrote:
> On TM2209 the power mode is the STNM byte in EC RAM. Fn+K rotates it
> in EV20 and the EC0._Q24 handler then applies the matching SoC limits
> with HPTC. SystemPerMode does not affect STNM, so changing the platform
> profile had no effect on power.
>
> Read the mode from STNM and, on set, write STNM and evaluate EC0.HPTC
> as the Fn+K handler does. HPTC returns AE_AML_BUFFER_LIMIT because SVRP
> declares its ALIB buffer one byte longer than its data; the limits are
> already sent at that point, so treat it as success.
>
> The board reports DMI_SYS_VENDOR "XIAOMI" with TM2209 in
> DMI_BOARD_NAME, returns the WMI return code at the end of the buffer
> and charges over USB-C only.
>
> Signed-off-by: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
> ---
> Based on v15 of "Merge redmi-wmi into bitland-mifs-wmi":
> https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com
>
> Tested on BIOS RMAPH5B0P0909 only.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 83 ++++++++++++++++++++++++-
>   1 file changed, 81 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a431d3fef..b63b139a6 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -21,6 +21,7 @@
>   #include <linux/input-event-codes.h>
>   #include <linux/input.h>
>   #include <linux/input/sparse-keymap.h>
> +#include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/leds.h>
>   #include <linux/module.h>
> @@ -99,6 +100,10 @@ struct bitland_mifs_quirks {
>   
>   	bool return_code_at_end;
>   	bool skip_ac_type_check;
> +
> +	const char *ec_mode_field;
> +	const char *ec_mode_apply;
> +	phys_addr_t ec_mode_addr;
>   };
>   
>   static const struct bitland_profile_entry default_profile_entries[] = {
> @@ -113,7 +118,30 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2209_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   2 },
> +	{ PLATFORM_PROFILE_BALANCED,    1 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2209_quirks = {
> +	.profile_entries = tm2209_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2209_profile_entries),
> +	.return_code_at_end = true,
> +	.skip_ac_type_check = true,
> +	.ec_mode_field = "\\_SB.PCI0.LPC0.EC0.STNM",
> +	.ec_mode_apply = "\\_SB.PCI0.LPC0.EC0.HPTC",
> +	.ec_mode_addr = 0xFE0B0300 + 0x7E,
> +};

I think this is an anti-pattern.

Do we get a WMI method for this?

> +
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2209"),
> +		},
> +		.driver_data = (void *)&tm2209_quirks,
> +	},
>   	{}
>   };
>   
> @@ -271,6 +299,48 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>   	return 0;
>   }
>   
> +static int bitland_ec_mode_get(const struct bitland_mifs_quirks *quirks, u8 *val)
> +{
> +	unsigned long long v;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(NULL, (acpi_string)quirks->ec_mode_field,
> +				       NULL, &v);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	*val = v;
> +	return 0;
> +}
> +
> +static int bitland_ec_mode_set(const struct bitland_mifs_quirks *quirks, u8 val)
> +{
> +	void __iomem *addr;
> +	acpi_status status;
> +	u32 glk;
> +
> +	addr = ioremap(quirks->ec_mode_addr, 1);
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	status = acpi_acquire_global_lock(1000, &glk);
> +	if (ACPI_FAILURE(status)) {
> +		iounmap(addr);
> +		return -EBUSY;
> +	}
> +	writeb(val, addr);
> +	acpi_release_global_lock(glk);
> +	iounmap(addr);
> +
> +	status = acpi_execute_simple_method(NULL, (char *)quirks->ec_mode_apply, val);
> +	if (status == AE_AML_BUFFER_LIMIT)
> +		return 0;
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
>   static int laptop_profile_get(struct device *dev,
>   			      enum platform_profile_option *profile)
>   {
> @@ -282,14 +352,20 @@ static int laptop_profile_get(struct device *dev,
>   	};
>   	struct bitland_mifs_output_head_rc result;
>   	size_t i;
> +	u8 val;
>   	int ret;
>   
> -	ret = bitland_mifs_wmi_call(data, &input, &result);
> +	if (quirks->ec_mode_field) {
> +		ret = bitland_ec_mode_get(quirks, &val);
> +	} else {
> +		ret = bitland_mifs_wmi_call(data, &input, &result);
> +		val = result.data[0];
> +	}
>   	if (ret)
>   		return ret;
>   
>   	for (i = 0; i < quirks->num_profile_entries; i++) {
> -		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
> +		if (quirks->profile_entries[i].wmi_val == val) {
>   			*profile = quirks->profile_entries[i].profile;
>   			return 0;
>   		}
> @@ -350,6 +426,9 @@ static int laptop_profile_set(struct device *dev,
>   	for (i = 0; i < quirks->num_profile_entries; i++) {
>   		if (quirks->profile_entries[i].profile == profile &&
>   		    !quirks->profile_entries[i].no_set) {
> +			if (quirks->ec_mode_addr)
> +				return bitland_ec_mode_set(quirks,
> +							   quirks->profile_entries[i].wmi_val);
>   			input.payload[0] = quirks->profile_entries[i].wmi_val;
>   			return bitland_mifs_wmi_call(data, &input, NULL);
>   		}
