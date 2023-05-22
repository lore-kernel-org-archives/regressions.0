Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404679DD
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 09:22:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-96aae59bbd6so1088924866b.3
        for <regressions@lists.linux.dev>; Mon, 22 May 2023 02:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684747327; x=1687339327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWgSPwQBspND+l5FgxYrCxjRrLfV4tAi/ncxGD1tzmY=;
        b=FkHTI+fsiFLIfDjjZ5x1vzvdzg/Inx3IhlSoCyRzBEtiI70M5Nj+tA+uHH2VbWzUpL
         fskgMO/+VQoj9OTYF1PLxgBzIfdKclOsHauE2Zw81v2nIT7oW2PG8NC6tNJE0TQht1Xd
         yf8D413LRuH8vlGkP5ACgqTW18Yrebli52a3/XIfkAvYCAY/5ST6JOW5lDqZnI6UE423
         hSNEh12LVhDuP26ei7qxgD3UMcF82/amjXo+LbwF/3eW0VUpbfNNL+D4JrtFcDZIrWCo
         Dka81MifnVt59oqHEfppyf6i41K5blguutbWMCsUgJpSI0jGoiHe8QqgFG9cTha+bMXJ
         Z+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684747327; x=1687339327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWgSPwQBspND+l5FgxYrCxjRrLfV4tAi/ncxGD1tzmY=;
        b=dx70H4+aKg/1QS66C7XaohQWF/sAXKNcu0Jz0egbjPxzJxI0H5fO/4+VrYNLhfYuwZ
         saMFBkC1L/ALHX4D5c3SDuEk+LEuAJxmz+9o4razwoAjOeTMejj5vFZxCwbf25wcFMpc
         x/ezMiiOpp1NRt1gqqn4BKRoUxKuqi377P97aLdnRdOvyyQq7/6VUC0ZkAwTyrrLr04D
         POjruR8+9ZrYYHLlMtGCfC5Ky8MGrtasxym/PdfxCsHbO4I/zmC2dQGGRSm8GCpxIymR
         Y0xAjaIePY/9sKkgzyg9Hd+hcm8hYdWp83HRuVCbIU9gBH+18Jij/rmfSx6bmVjkXor0
         PIdg==
X-Gm-Message-State: AC+VfDwL+cC8FAnPGck/QxdgQ3cwqBYkucmEoaTwFvYbl8qI6r76cHhf
	AIkUmtwiCjTqgDvqCKoBC8dewQ==
X-Google-Smtp-Source: ACHHUZ4llMsUm3mMQoEICKe9reTv0ubUpgf7y1rkTtZnCilVcgETeccWP3R23LSJ4AHV9kWAwFh8hw==
X-Received: by 2002:a17:907:1611:b0:966:37b2:7354 with SMTP id hb17-20020a170907161100b0096637b27354mr10227963ejc.31.1684747327487;
        Mon, 22 May 2023 02:22:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id kt26-20020a170906aada00b009663cf5dc3bsm2892334ejb.53.2023.05.22.02.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 02:22:07 -0700 (PDT)
Message-ID: <0c8a54ae-7f32-2614-9717-a00fe561513e@linaro.org>
Date: Mon, 22 May 2023 10:22:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, todd.e.brandt@intel.com, vigneshr@ti.com,
 pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 bagasdotme@gmail.com, regressions@lists.linux.dev, joneslee@google.com,
 Todd Brandt <todd.e.brandt@linux.intel.com>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
 <20230522102953.2fdf2b02@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230522102953.2fdf2b02@xps-13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/22/23 09:29, Miquel Raynal wrote:
> Hi Tudor,

Hi, Miquel,

> 
> tudor.ambarus@linaro.org wrote on Thu, 18 May 2023 08:54:40 +0000:
> 
>> We failed to initialize n_banks for spi-nor-generic flashes, which
>> caused a devide by zero when computing the bank_size.
>>
>> By default we consider that all chips have a single bank. Initialize
>> the default number of banks for spi-nor-generic flashes. Even if the
>> bug is fixed with this simple initialization, check the n_banks value
>> before dividing so that we make sure this kind of bug won't occur again
>> if some other struct instance is created uninitialized.
>>
>> Suggested-by: Todd Brandt <todd.e.brandt@linux.intel.com>
>> Reported-by: Todd Brandt <todd.e.brandt@linux.intel.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217448
>> Fixes: 9d6c5d64f028 ("mtd: spi-nor: Introduce the concept of bank")
>> Link: https://lore.kernel.org/all/20230516225108.29194-1-todd.e.brandt@intel.com/
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/mtd/spi-nor/core.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 0bb0ad14a2fc..5f29fac8669a 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2018,6 +2018,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>>  
>>  static const struct flash_info spi_nor_generic_flash = {
>>  	.name = "spi-nor-generic",
>> +	.n_banks = 1,
> 
> I definitely missed that structure.
> 
>>  	/*
>>  	 * JESD216 rev A doesn't specify the page size, therefore we need a
>>  	 * sane default.
>> @@ -2921,7 +2922,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>>  		spi_nor_init_default_locking_ops(nor);
>>  
>> -	nor->params->bank_size = div64_u64(nor->params->size, nor->info->n_banks);
>> +	if (nor->info->n_banks > 1)
>> +		params->bank_size = div64_u64(params->size, nor->info->n_banks);
> 
> I'm fine with the check as it is written because it also look like an
> optimization, but bank_size should never be 0 otherwise it's a real bug

bank_size was introduced just for chips featuring several banks, but we
made this field mandatory for all flashes, regardless of their type. I
find this restriction unnecessary, because we can differentiate the RWW
flashes by checking the SNOR_F_RWW flag. So the alternative to this
patch is to remove the n_banks restriction and set it just for the RWW
flashes. I think I prefer this, but keep in mind that I never read a RWW
flash's datasheet, not publicly available, so the decision is in your
court. Happy to make a patch.

> that must be catch and fixed. We do not want uninitialized bank_size's.>
>>  }
>>  
>>  /**
>> @@ -2987,6 +2989,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>>  	/* Set SPI NOR sizes. */
>>  	params->writesize = 1;
>>  	params->size = (u64)info->sector_size * info->n_sectors;
>> +	params->bank_size = params->size;
>>  	params->page_size = info->page_size;
> 
> We actually discarded that line in a previous discussion:
> https://lore.kernel.org/linux-mtd/20230331194620.839899-1-miquel.raynal@bootlin.com/T/#mcb4f90f7ca48ffe3d9838b2ac6f74e44460c51bd
> 
> I'm fine to re-add it though, it does not hurt.

we would get rid of this init as well with my suggestion.

Keep in mind that the bug was introduced in 6.4, so we'll have to fix
this fast, let's come to an agreement.

Cheers,
ta
> 
>>  
>>  	if (!(info->flags & SPI_NOR_NO_FR)) {
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> Thanks,
> Miquèl
