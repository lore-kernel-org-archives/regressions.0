Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB997F9
	for <regressions@lists.linux.dev>; Sat, 24 Jun 2023 12:16:04 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6687446eaccso1396454b3a.3
        for <regressions@lists.linux.dev>; Sat, 24 Jun 2023 05:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687608964; x=1690200964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5gqXPV4PTFmPbh9Zh+d+AFfgDSYPHvyuQvmSWXaCHM=;
        b=GSlyV/6jSVuH94sgYqU5l2hZ/vFLVm17jC73az92Vrcd2d/BFlXXxFFxzf6Vp30FCx
         tVRrSaAozJxD7ShYaUpUlNDY7siYc3h8j9GhCsVR6eCxllgrTEWB0U7uzwfTTYVI6W7x
         AZbfqlbw9T8QYbUXWyw6VwUByWJZcodGY9vyeASiKn2e9Di8ypFNy1fgw4BBjstTdrzn
         xCeqoyS/osXPg4iWIkkCAtppNK12CFynje23SverEgCXnwis39rppObDTejJyCXqTh1s
         CmVAglsURQcjwkjzADdbhyt1JRDe0FI6ASOdtcXJ0akfAeNh/nzjQx8y2KlFhcvajhb+
         TpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687608964; x=1690200964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5gqXPV4PTFmPbh9Zh+d+AFfgDSYPHvyuQvmSWXaCHM=;
        b=WS81q5ILVb0WV6EK+mZ8pb37s1EkSQ2C7CFPOrVVhd3cXEwTcSTiI8adF/Ewazb21S
         osZgOU+w3DEbLKxwQ+5TZmU2QZXJM3Tbpimn4gWQX5qz5pxfni1+otXvYG0F3TIMCn8Y
         CZeAMVde+j5yLjFhDIVrLjDPWbEFayEFMidrGhNjPjBZd9raC17GugbhLA9lU/QWMxDD
         IheC5XXg6kRZ8cV9Bez60tIUfgRPZWECSqfFb28jZw001hAw77SEQLXjssndlryRDfj/
         NogXHsY2f2dSt/ZdpxcWh0/96QPl2uWTyPEgeR0aVQziT7BAOrxXjNqrbDt92wjAwjrs
         fOUg==
X-Gm-Message-State: AC+VfDy825rPphNplo6zv8zzMj9DznDxpEJajKGZiDPU6m28+D0M4hbg
	MKVfUYAk9Ev42PMPK/FCQXk=
X-Google-Smtp-Source: ACHHUZ5EpQ65SR/LaXzT/XybSAMzramJefXD9F0LO3L1KAkTP0j347Sr+AXCX1XFPm90SaCzHiVC4A==
X-Received: by 2002:a05:6a00:1a53:b0:66a:6339:e8f6 with SMTP id h19-20020a056a001a5300b0066a6339e8f6mr8131229pfv.10.1687608963801;
        Sat, 24 Jun 2023 05:16:03 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p25-20020aa78619000000b0065418efa5ebsm991442pfn.155.2023.06.24.05.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 05:16:03 -0700 (PDT)
Message-ID: <c125ec63-f7ba-3fd6-c286-05854fa1a07a@gmail.com>
Date: Sat, 24 Jun 2023 19:15:36 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: kernel fault on hibernation: get_zeroed_page/swsusp_write
To: Elmar Stellnberger <estellnb@elstel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management <linux-mm@kvack.org>,
 Linux Stable <stable@vger.kernel.org>
References: <5d4959b7-61da-8ab0-6bc6-21305d37c7aa@gmail.com>
 <ZJXFgfldS6W_LCiI@mail.dotplex.com> <ZJZGE4ZxJzrhRznA@debian.me>
 <ZJbDqStCNfdpwObE@mail.dotplex.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZJbDqStCNfdpwObE@mail.dotplex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/23 17:21, Elmar Stellnberger wrote:
> Hi Bagas S., Hi all
> 
> concerns: Bug 217544 - kernel fault on hibernation: get_zeroed_page/swsusp_write 
> https://bugzilla.kernel.org/show_bug.cgi?id=217544
> 
>   Bisection does not make sense here, since I can not reproduce the
> issue. Packing the kernel binaries and symbol files was meant to invoke
> gdb directly on the kcore:
>  

Thorsten: Should this be marked as invalid/inconclusive?

> Am Sat, Jun 24, 2023 at 08:25:39AM +0700 schrieb Bagas Sanjaya:
>> On Fri, Jun 23, 2023 at 06:17:05PM +0200, Elmar Stellnberger wrote:
>> Can you attach [1] to your Bugzilla report? Also, any report on bisection?
> 
> Pardon, what is [1]?
> 

Your kcore dump.

-- 
An old man doll... just what I always wanted! - Clara

