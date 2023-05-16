Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C4134CD9
	for <regressions@lists.linux.dev>; Tue, 16 May 2023 13:25:09 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaf2ede38fso136910045ad.2
        for <regressions@lists.linux.dev>; Tue, 16 May 2023 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684243508; x=1686835508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWi01wLtIOXbHfuhqqUADsTGGpStITYjGOsZBd8BFHI=;
        b=F46T2dm5MmhIigb7SmI+F6+F24NfgjE9C5Ci92aGV0CTfTqSzrGiLkaV2ajmCg5QJh
         aTn7AOsPYxw8tqhqbj3hZ96PeYBKF1SXgKSt5Z7wEJz+XJXSwaY6/0MgaPRwEuLfBSpi
         VXbd3Vhp+lNA/dVXIcjpKiS9ERqKPWrEXc36+EC+8AruHkHD3MDvyINZ8uXd/zHSAal6
         jpaOql4Ca4m3isbkw3+mVp8JuIzDI18jR+bDoMY1oJyAo/mL/DyPsHrTW8VzlV12u3RA
         F5e+KTdz6mtg/u2kbKYAsD8dNVaYg6xausq4crFfmmBP7ykSt62TxP96GdUww8njJ8QA
         eWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684243508; x=1686835508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWi01wLtIOXbHfuhqqUADsTGGpStITYjGOsZBd8BFHI=;
        b=K8l6bT5ZqeBjQ5Kngfy8O9gjgtjdew8qC/ShuXwWHAKzbnVpoPorHF7ZzIC/XiVYUF
         gj6IWA9M5dTvNQz3iqTPOlvLrwDXhpmtsW/FiMhnGb7FpDoIlLCUji08kZEFfxv57U78
         TAV6l+1gU64+Y8aZlI6F+tWJZYp6ofX3dpDoV4fnwDMGunyhZwQOWVWpkL8qfYBwGheX
         SP4GSVKtTycf+D5wQN/EBpW89aOZ6En7bauXDZiWEkwkKzbbBLzCWJ0q5p9QPf7gm/YH
         ldYFDmnOG+yNLE+UG9vXVmh2eXGiiB4+E8T83h6Jlq6sMlHYCahVpCEBulHyfxIfH01S
         G/Lw==
X-Gm-Message-State: AC+VfDxmnaw+M3pB46DdAW3KQPwYgi9zCj1Z3x1EeKb9+Z4Vv2n4sV6K
	Xc1KZOa5Gzeufi/cL4INQKe/PtRf4eg=
X-Google-Smtp-Source: ACHHUZ7aBAFcHczn4rLTZMgINQxwx3tkwtYj0wUopEiBuA89F88McrE0RR+vlickR6fNAfeTbsBEqw==
X-Received: by 2002:a17:903:2445:b0:1ad:c627:87de with SMTP id l5-20020a170903244500b001adc62787demr24864570pls.32.1684243508387;
        Tue, 16 May 2023 06:25:08 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-8.three.co.id. [180.214.232.8])
        by smtp.gmail.com with ESMTPSA id y18-20020a17090322d200b001a1a82fc6d3sm15453358plg.268.2023.05.16.06.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 06:25:07 -0700 (PDT)
Message-ID: <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
Date: Tue, 16 May 2023 20:24:51 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, guy.b@bluewin.ch
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/23 18:58, Thorsten Leemhuis wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> On 08.05.23 11:55, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi, Thorsten here, the Linux kernel's regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developers don't keep an eye on it, I decided to forward it by mail.
>>
>> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217412 :
> 
> TWIMC: a few other users (three or four iirc) showed up in that ticket
> and reported problems with the receiver, albeit the symptoms are not
> exactly the same for all of them, so there might be more than one problem.
> 
> I'll try to motivate the affected users to perform a bisection. But
> would be great if those with more knowledge about this code could
> briefly look into the ticket, maybe the details the users shared allows
> one of you to guess what causes this.
> 

Hmm,

You noted in the similar report [1] that developers involved here
ignore this regressions. I wonder if Linus has to be hired in
this case, and if it is the case, let's take a look and hear closely what
he will say.

Thanks.


[1]: https://lore.kernel.org/regressions/8941c5f2-3861-da68-06ca-adc68a37e53b@leemhuis.info/

-- 
An old man doll... just what I always wanted! - Clara

