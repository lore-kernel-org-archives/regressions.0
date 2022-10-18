Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953017B
	for <regressions@lists.linux.dev>; Tue, 18 Oct 2022 08:35:23 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id l1so13123999pld.13
        for <regressions@lists.linux.dev>; Tue, 18 Oct 2022 01:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wEe31S7OueGkq2ATsUWNgeMPrSgw0rLvjqo2xewOoPY=;
        b=n0omaL6hS21R8l/phMUF9jY6xR7fhPqREWjC2oG2B51o/rj2Mpu1tatt4o4PF2nd/K
         I2osJfdM7OmnocKcxnlwakiPoCFErGVROE4qb2PwzxMFKzSF+linGrJ+inqTc517Cgwl
         fUgR12cS5zQmS2MY2Kd+u0swoep4JLojQK39p61ouF1rwzU6Yfy/qOZvf5YMi4rIrUEF
         E5nryaZ0FWfVQbiQiLBwDpZLFzJCClDJepxouekIiYyV800JkHgLOlDf/uSlre4lKQB/
         dE4Uec+qEyVeRa2yVV0Dk+vhs924cOIB2qtJ005eYcMs5AGpjcBfCZ8cs0QHc6CANqop
         eClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEe31S7OueGkq2ATsUWNgeMPrSgw0rLvjqo2xewOoPY=;
        b=D4XTXnoXj2V1c8nttJDxN0ggQhpySudRdUbUSNpxQ7RUeG8jjsOc3ATMSyTapZOJ4e
         ZQl9u6J7uq8qVWH/DnSWlzHXFhAGzCogF8IH8OB2PigcHpaG7wtF/rzs1DJejk58wQpg
         76YzfJ3/J9p8gVs5rDXdVH4ItC5x75JsRy8k9JnWxWU62RsndYWUT4GubVIH8h73D91q
         JdWyinQ6XtDqV7OBrbQu7dg/zPVqgfG6T1ZryLpsGAcmSIgRqoMZjlPe4nUphoHpThVm
         4AxpLRCQbJPeM2fwdqPcwj65NNvQGMxFBgrXoyNBWPZ72Nw6DX2O0of79oKWDgh4KwBH
         +rFw==
X-Gm-Message-State: ACrzQf1i3aCJob8r9pOpEg4eA2k4oWO5sAb5snxsJEOTWlfMyg0o1l8L
	NgAaXAyjNfKZWpiwR5EE6S4=
X-Google-Smtp-Source: AMsMyM4RxVuZxAP3xMNpqCjeZKVZLVRruTKutnEPI6ngJu2UocmJu9YAzfuDjOP4IgCEEMsD5s81ag==
X-Received: by 2002:a17:90b:3d85:b0:20c:8f6a:8298 with SMTP id pq5-20020a17090b3d8500b0020c8f6a8298mr38901757pjb.242.1666082123190;
        Tue, 18 Oct 2022 01:35:23 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-76.three.co.id. [180.214.232.76])
        by smtp.gmail.com with ESMTPSA id c7-20020a621c07000000b005619afb745esm8613725pfc.113.2022.10.18.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 01:35:22 -0700 (PDT)
Message-ID: <608e2363-1e51-7aef-746f-e93aac583a13@gmail.com>
Date: Tue, 18 Oct 2022 15:35:19 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>, regressions@leemhuis.info,
 mirsad.todorovac@alu.unizg.hr
Cc: linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 regressions@lists.linux.dev, srw@sladewatkins.net
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
 <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com>
In-Reply-To: <c5980bcb-f345-ff2e-a29b-75e53a6b8708@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/22 16:45, Bagas Sanjaya wrote:
> On 10/16/22 19:21, Bagas Sanjaya wrote:
>>
>> No Verneed warnings so far. However, I need to test for a longer time
>> (a day) to check if any warnings are reported.
>>
> 
> The regression still occurs with this patch applied. Let's see if
> reverting the offending commit helps.
> 

No regressions with the offending commit reverted. Now I have to
try the proposed fix ([1]).

[1]: https://lore.kernel.org/lkml/CAJMQK-hgQEkhgpO9VFOCgn-cKtVsr7Hb_58pAYiGoDi5SzGZtA@mail.gmail.com/

-- 
An old man doll... just what I always wanted! - Clara

