Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285AC63D
	for <regressions@lists.linux.dev>; Wed,  1 Jun 2022 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654086557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+VBIBuP9XH5+e4gdIzNU2MNtABdrYAbgVzv2JZq6v4g=;
	b=U/uuhiM84wysGYBp3AN8gOHr5THmTXrob8dmO8NyzgSwdyABK1eCkr0cRW0MnwMraCcv57
	PggBtIRVspp0DOygkM0c61clPSQl1Ej4eOyXGzOlLq85wIjNLjO2Z+rV9/Xfq+yq7R7Tqk
	V7MCrHx1GLe8U6j01oBbgO5aC49M+XA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-KpwhrHfbOLy44UocELxXvg-1; Wed, 01 Jun 2022 08:29:16 -0400
X-MC-Unique: KpwhrHfbOLy44UocELxXvg-1
Received: by mail-wm1-f72.google.com with SMTP id bg7-20020a05600c3c8700b0039468585269so849869wmb.3
        for <regressions@lists.linux.dev>; Wed, 01 Jun 2022 05:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+VBIBuP9XH5+e4gdIzNU2MNtABdrYAbgVzv2JZq6v4g=;
        b=LBLWKs6q3U51DFKqDvvuPiDKmj5fFo1wpiVPDgDj6cUgISoKjG3mrzkIB94L5OjIav
         AzYl7zTNPb/JcFvTp0iayhfVZuB+QuMtLNrP7oAhRRQUtJJ441Rbj+1CinHY+W2Xgfuj
         ajMo47Booyk/PRwtQT97FY52Xn8VMn/nRE/QrHDZpHTZRfcOxGpdgNtLLSYEI5miJFGQ
         4C3oV8ssDTJj2rmJ0R3tKJdeAYu6a0Hr9lC5wrYU8BcKcCadWByFX2/O/4M5wLpmN/QQ
         RU1QGXkEZ/Vvg067iJg75/FR74mvJpZSpG2JjV+/+8RXrbmKeqEy3oNfOx3RY9uSxFxL
         x2PA==
X-Gm-Message-State: AOAM533SI4rxthAeLY5Ex4S3WbmgvARtC40CEmSfWUUH+e+vGlZge5Jf
	E+cqRKU0l3J6vFq8Ve5ObYvRT2kszQVNkBkWRT32yuzrTX8obwJBgU2QsX66wvcG2gbq2LhIL0e
	smQdtlXPsL+X8xfd1DLxrWLw=
X-Received: by 2002:a05:600c:21d0:b0:397:33e6:fd42 with SMTP id x16-20020a05600c21d000b0039733e6fd42mr28453946wmj.179.1654086555696;
        Wed, 01 Jun 2022 05:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkz1Y8pjn1ricjS6peAGoSHjCadpq4kbMUdRVXVI5Te6LpiY9GuLx6Lm3WXA+ZVVnsqQzwpQ==
X-Received: by 2002:a05:600c:21d0:b0:397:33e6:fd42 with SMTP id x16-20020a05600c21d000b0039733e6fd42mr28453932wmj.179.1654086555454;
        Wed, 01 Jun 2022 05:29:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367? ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
        by smtp.gmail.com with ESMTPSA id t67-20020a1c4646000000b003942a244f33sm5189360wma.12.2022.06.01.05.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 05:29:15 -0700 (PDT)
Message-ID: <66419e2f-8a68-0e0c-334b-96b211a96e50@redhat.com>
Date: Wed, 1 Jun 2022 14:29:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [REGRESSION] VGA output with AST 2600 graphics.
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kuohsiang_chou@aspeedtech.com, David Airlie <airlied@redhat.com>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org
References: <d84ba981-d907-f942-6b05-67c836580542@redhat.com>
 <6e9f84f9-dc97-9ff4-57c8-97fbffd3a996@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <6e9f84f9-dc97-9ff4-57c8-97fbffd3a996@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/06/2022 12:33, Thomas Zimmermann wrote:
> Hi Jocelyn,
> 
> thanks for reporting this bug.
> 
> Am 01.06.22 um 11:33 schrieb Jocelyn Falempe:
>> Hi,
>>
>> I've found a regression in the ast driver, for AST2600 hardware.
>>
>> before the upstream commit f9bd00e0ea9d
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f9bd00e0ea9d9b04140aa969a9a13ad3597a1e4e 
>>
>>
>> The ast driver handled AST 2600 chip like an AST 2500.
>>
>> After this commit, it uses some default values, more like the older 
>> AST chip.
>>
>> There are a lot of places in the driver like this:
>> https://elixir.bootlin.com/linux/v5.18.1/source/drivers/gpu/drm/ast/ast_post.c#L82 
>>
>> where it checks for (AST2300 || AST2400 || AST2500) but not for AST2600.
>>
>> This makes the VGA output, to be blurred and flickered with whites 
>> lines on AST2600.
>>
>> The issue is present since v5.11
>>
>> For v5.11~v5.17 I propose a simple workaround (as there are no other 
>> reference to AST2600 in the driver):
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -146,7 +146,8 @@ static int ast_detect_chip(struct drm_device *dev, 
>> bool *need_post)
>>
>>       /* Identify chipset */
>>       if (pdev->revision >= 0x50) {
>> -        ast->chip = AST2600;
>> +        /* Workaround to use the same codepath for AST2600 */
>> +        ast->chip = AST2500;
> 
> The whole handling of different models in this driver is broken by 
> design and needs to be replaced.  I don't have much of the affected 
> hardware, so such things are going slowly. :(
> 
> For an intermediate fix, it would be better to change all tests for 
> AST2500 to include AST2600 as well. There aren't too many IIRC.

I feel a bit uncomfortable doing this, because I don't know if this 
settings are good for AST2600 or not. I just know that AST2500 settings 
are better than the "default".

Also it may not apply cleanly up to v5.11

I will do a test patch and see what it gives.

Another solution would be to just revert f9bd00e0ea9d for v5.11 to v5.17 ?

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>>           drm_info(dev, "AST 2600 detected\n");
>>       } else if (pdev->revision >= 0x40) {
>>           ast->chip = AST2500;
>>
>> starting from v5.18, there is another reference to AST2600 in the code
>> https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ast/ast_main.c#L212 
>>
>>
>> So I think someone with good aspeed knowledge should review all 
>> locations where there is a test for AST2500, and figure out what 
>> should be done for AST2600
>>
>> Thanks,
>>
> 

