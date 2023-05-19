Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B55663
	for <regressions@lists.linux.dev>; Fri, 19 May 2023 08:19:36 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64d15660784so1240178b3a.0
        for <regressions@lists.linux.dev>; Fri, 19 May 2023 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684484376; x=1687076376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBPTBQJcWgrD1ck85tj9B2uBPpRSLI2KXmbj8yOJQPY=;
        b=KuLJyU6hW58eytl8iY+ZnDCNBxula7ibr0UbUgsh+h4MAd0V7XUfBOrGhbcLaII8qr
         3kxz3SzkiCRc4G8LFxkJxizFOurvP6gkM38usO2exmF84H8nSxvFjq1d1sQWMoxZaIRb
         GBkkLZAdlXNo61/d8CQkKIpe5nHkEIMtDREObIz2C6kBDkxTnpWZULEp7CqnmfJeHKFf
         yFOKErP1+dS8SR+lcI27BYqHa2OO7u1Xd35bKO2b/1b8AgynxFQ/8HTKMwRiCvO8B4Mu
         FMumc45E/ewJLb1BSMn3SXTo3ogpYOcO9teEVAHzQZqp/EZu4Obv8/bPvIUO+SMyu5+m
         nTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684484376; x=1687076376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBPTBQJcWgrD1ck85tj9B2uBPpRSLI2KXmbj8yOJQPY=;
        b=Oxypes6iVat0kaYifF4U2aN3jMIUjnYYipIbgjIjrimvwgDlZfsRtCxe4hSZp2Y30K
         yHA2ypi82JFOB5jYHUQISAk0gF4XPfhbB/1JCfSvUx6P5bqsxAYMuNljRgfC+a1XtCJ1
         LBt+gP0ogVxLV9O2YYuABOrXxAA2V8wm+biD7z8/2wR0eYrrmvMCYrvUB2uinQBNmS9S
         3He0IJtcOpdGjBqP/ZwOuJKr0uTHbbZqxSHotuZjAY0VpnGHFCs2iTruKAnmnEQrVclr
         dKf45cxwhmjwBLH+fQoY30IBd7i/1Z3Kgpo9/2xYQU3YUdmDNW8Wa0JmlqsFExi3MtUa
         Fg3Q==
X-Gm-Message-State: AC+VfDzipU9Mbadm/kQ/sJjftjt3GIP2ga8nAk5+ESuBtcl78/7TEaiV
	P4PnErpytiX7Q9/lvG+fZmI=
X-Google-Smtp-Source: ACHHUZ47olpGeP4NYofUMmsojjC4HPGjCkXAQts1zGDobaEvLHQRbRVqpQO6570VKS9gBn5qKL9zhw==
X-Received: by 2002:a17:902:f813:b0:1ae:48b2:3c2b with SMTP id ix19-20020a170902f81300b001ae48b23c2bmr1794928plb.30.1684484376320;
        Fri, 19 May 2023 01:19:36 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-39.three.co.id. [116.206.28.39])
        by smtp.gmail.com with ESMTPSA id a4-20020a1709027d8400b001ab12545508sm2827353plm.67.2023.05.19.01.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 01:19:35 -0700 (PDT)
Message-ID: <68577e7d-a8ea-a3b5-4289-436a55e57f41@gmail.com>
Date: Fri, 19 May 2023 15:19:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: Persistent rt_sigreturn segfaults on KVM VMs after upgrade
 to 5.15
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux KVM <kvm@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Theodor Milkov <tm@del.bg>
References: <71288f04-546c-9af3-e29a-eb3c44e0d948@gmail.com>
 <babafe0f-3154-fb0a-346f-2bbea48a366e@gmail.com>
 <ZGY9twXBuTWpliAB@google.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZGY9twXBuTWpliAB@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/23 22:01, Sean Christopherson wrote:
> On Thu, May 18, 2023, Bagas Sanjaya wrote:
>> On 5/18/23 20:57, Bagas Sanjaya wrote:
>>> Hi,
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>
>>>> I'm experiencing sporadic but persistent segmentation faults on the KVM
>>>> VMs I manage. These faults began appearing after upgrading from Linux
>>>> Kernel 4.x to 5.15.59. I further upgraded to 5.15.91 and transitioned the
>>>> userspace from Debian 10 (buster) to Debian 11 (bullseye), yet the issues
>>>> persist. Notably, the libc has also changed in the process as seen in the
>>>> following error logs:
> 
> Was the host or guest kernel upgraded?  If the guest kernel was upgraded, it's
> unlikely, though still possible, that this is a KVM bug.
> 

The reporter [1] said that this regression occurs on guest kernel.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217457#c3

-- 
An old man doll... just what I always wanted! - Clara

