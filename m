Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790A7EDA
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 06:56:47 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99bdcade7fbso62477166b.1
        for <regressions@lists.linux.dev>; Wed, 06 Sep 2023 23:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694069805; x=1694674605; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukwWb4lAr/3M8hE9KXN4tPWduEYh1NIPGybMurdhdDs=;
        b=N23GMVeGcoE9GlFq+ziiqN4AVa4Fu03ju/D3101XQ+Do+02IX7FnZQzqJRtTHILhvV
         Pvj2fnaULn4kcmnPB7ahZZfkgX16x5B7CmkwJkZ3QB8SKTlFMHDiOE6cxHmUJYBCDIDI
         4Hz/Yb1C5o5vjpbS7LXS8TvQbJNDFp5UtGgPrF8LDzs/k0HsV0fE+YmjI89ZwyAXgqyQ
         GHIR/kSMHhmfRcwIzYovezFSTtyg7rx0an7lXI6+TevthmDW1VCYhsUdpAFtPcV+VC5l
         lk8SXXbSg+MJabBmT4zI5Bm8l31Xo1XtGRhPnd62O8mm1MDxvkJ0LsUAtw0ZVJ5F4tma
         T4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694069805; x=1694674605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukwWb4lAr/3M8hE9KXN4tPWduEYh1NIPGybMurdhdDs=;
        b=ahsxja88Dau6QEV2CfDX2t+2dgELXFLIxDe019SWqQnpsVB5Lpt2CrDJ6ThMiLpkom
         UoBzH8CX0XfqeRynispscV6zepy0Yqw77XLnouZQmCz4GDRPH7Z5x61UZrQL8j4Js0tV
         gQqpmzuPg5+EM/UciHxOnZhXH+LoEtpJ9OqL5mUrPUJXgMSpNQtKXeinqgDbeTDcH4Og
         pLj8J7cY9rjQEjIK+vfVEC4/nA5F8cl4JqXhkJOoX0lpYLlikwobwSw2xfOWrMmpw6Vh
         eq7KP6RHNYLHGcBnyTbdOvOscSpbUOaII/iVs9/nf5euGOYOhkUDpWZyy+UmOjl5RR5X
         Q3Cw==
X-Gm-Message-State: AOJu0YyYrWXRe3aYgNymy4QUeD4n/0YCFPCsNkxgVgbZ0dCB8p2IT3f6
	XiKf2VQU7UP/GleFcNo+JJQ=
X-Google-Smtp-Source: AGHT+IHzD3+7U/HMiG0HNnmS8wQfLyYxkOxPsIA17E+zzuw8hfcSZKf9zcGA32rVbqmD7IIsU/pYUQ==
X-Received: by 2002:a17:907:2cec:b0:9a2:292d:ea60 with SMTP id hz12-20020a1709072cec00b009a2292dea60mr4229274ejc.40.1694069805206;
        Wed, 06 Sep 2023 23:56:45 -0700 (PDT)
Received: from [192.168.10.127] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id qw14-20020a170906fcae00b0099b7276235esm10092169ejb.93.2023.09.06.23.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 23:56:44 -0700 (PDT)
Message-ID: <51c98bc8-b9df-4cd8-adf8-55c1f2790b08@gmail.com>
Date: Thu, 7 Sep 2023 08:56:42 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with AX88179A: can't manually set MAC address anymore
Content-Language: en-US, it-IT
To: Andrew Lunn <andrew@lunn.ch>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, netdev@vger.kernel.org,
 Linux Kernel Mailing list <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Oliver Neukum <oliver@neukum.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <54cb50af-b8e7-397b-ff7e-f6933b01a4b9@gmail.com>
 <ZPcfsd_QcJwQq0dK@debian.me> <6315027e-d1ab-4dec-acf2-0a77bb948807@gmail.com>
 <ZPfZQsLKG9LKGR1G@debian.me> <075308b2-7768-40b2-9c00-a5a14df62678@gmail.com>
 <d6777bc1-46ad-4ad9-a7e3-655dbe4f6317@lunn.ch>
From: Sergio Callegari <sergio.callegari@gmail.com>
In-Reply-To: <d6777bc1-46ad-4ad9-a7e3-655dbe4f6317@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

For the time being having AX88179A error out on attempts to set an 
hardware address would possibly be useful, though.

Sergio

On 06/09/2023 14:31, Andrew Lunn wrote:
>> So if the in-tree driver could be fixed to correctly support the manual
>> configuration of the hardware (MAC) address as it used to be that would be
>> the best. I hope that Andrew Lunn's hypothesis is correct, and that cdc_ncm
>> can be extended to work with AX88179A even when a manual MAC addr is
>> configured.
> I think it can, but it looks like it needs a different
> implementation. The CDC NCM standard is publicly available. It
> documents an optional call to set the MAC address, and there appears
> to be a capability bit to indicate if its implemented in a specific
> device. Ideally if the bit is not set -EOPNOTSUPP should be returned
> when trying to set the MAC address, otherwise make the call to let the
> hardware know of the new MAC address.
>
> Sorry, i don't have the time or the hardware to actually implement
> this. But i can review patches and help with processes.
>
>        Andrew
>
> 	
