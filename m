Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5860184B
	for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 17:06:15 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g186so6106938pgc.1
        for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MOQgXtI+BKSvQKp350OufIdxJrNapSAlu2QwriUAL0M=;
        b=Xr7brTWW1FS8zff2fqX5in7RA7W1ehGdNrTPpeehBMhGZLvChDjV5pABpRpyOvTxh2
         +hFSK4aggLX2HLQh5AXCo0EkJpeIt8smwjmG6CoKDTxULhJPTSbnQuVGcXq+uUAEgFgo
         MUO8lUwZjLjoVpzbK0Yh79o2bM1IwcP550ns91RLEY1ZhV35kAN7jMFexP/OvmsMmkO5
         E3H4q67N9BhNr3oX+ovhxHlbX/jQ59vNB1ZpRNJc2udHx0hfENEKSgW25MlKGYzGuSb8
         oTQSphWbPVCdzE70YFtOxLwdOk5vdq74xwoQT4oZEtnMDdlfdvK/OdHzv5oSoufXztIF
         GZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MOQgXtI+BKSvQKp350OufIdxJrNapSAlu2QwriUAL0M=;
        b=RUN7hCnBk9rGY27zlkQYEJbYA8fYAs982FChsmC/8vEQpCCY0/HHahdYrWwD/YPcbH
         wuyUIumrRpUpqZHV+Qb+uiPFFR+rLa0GRPPmvjISP5F77VSydeiBT298rawWpKo84rd1
         ZC1k8/cwMcIKj/Xa6dwjD5MMys0ROAYJ+n+PUPadkLglq3J+Z8VP3k4C0ZaoctFjgnfC
         xQcH4l6Q4x2HeIVaPtkP8PeSnc5trDDEd0Jy0lxSQqKNowskjhFQg3N0KvF+m9NjAUNv
         rWf3B5iilXvMX9Z6Bl6mBW8a1hAcMSXw8B5AaWaWLynCxihmLCkYElm+qzwssDA6qxlD
         oOyg==
X-Gm-Message-State: AOAM532JBeoKsZDJrkvNh1FqLXIi0lD/DexX8LncvoaL3+DE4QiqyM9k
	Yak2DPCXKAbyCYPiksqJ+/I=
X-Google-Smtp-Source: ABdhPJzZ7i5tys91503gKW2Dx5yn+4/pmdYgJ0M/Iv2UGbTxpnBMOzfRw0pPhZwC6EEadmpIF1e9UQ==
X-Received: by 2002:a05:6a00:1687:b0:518:6c6b:6a9a with SMTP id k7-20020a056a00168700b005186c6b6a9amr161951pfc.81.1655139974873;
        Mon, 13 Jun 2022 10:06:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 199-20020a6300d0000000b003f24d67d226sm5702673pga.92.2022.06.13.10.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 10:06:14 -0700 (PDT)
Message-ID: <e58125a4-f885-ae55-0441-d52ecab9a1e8@gmail.com>
Date: Mon, 13 Jun 2022 10:06:12 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] PCI: brcmstb: Revert subdevice regulator stuff
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Jim Quinlan <jim2101024@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, regressions@lists.linux.dev,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20220511203948.GA811126@bhelgaas>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220511203948.GA811126@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Bjorn,

On 5/11/22 13:39, Bjorn Helgaas wrote:
> On Wed, May 11, 2022 at 01:24:55PM -0700, Florian Fainelli wrote:
>> On 5/11/22 13:18, Bjorn Helgaas wrote:
>>> From: Bjorn Helgaas <bhelgaas@google.com>
>>>
>>> Cyril reported that 830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup()
>>> into two funcs"), which appeared in v5.17-rc1, broke booting on the
>>> Raspberry Pi Compute Module 4.  Revert 830aa6f29f07 and subsequent patches
>>> for now.
>>
>> How about we get a chance to fix this? Where, when and how was this even
>> reported?
> 
> Sorry, I forgot to cc you, that's my fault:
>    https://lore.kernel.org/r/CABhMZUWjZCwK1_qT2ghTSu2dguJBzBTpiTqKohyA72OSGMsaeg@mail.gmail.com
> 
> If you come up with a fix, I'll drop the reverts, of course.

OK, so now this patch series has landed in Linus' tree and was committed 
on May 31st and we got no notification that this patch series was applied :/

How did I notice? Because suddenly the stable auto selection started to 
email me about the 4 reverts being included which is kind of the worse 
way to know about a patch having been applied.

What is even better is that meanwhile there was already a candidate fix 
proposed on May 18th, and a v2 on May 28th, so still an alternative to 
the reverts making it to Linus' tree, or so I thought.

This utterly annoys me because:

- the history for pcie-brcmstb.c is now looking super ugly because we 
have 4 commits getting reverted and if we were to add back the original 
feature being added now what? Do we come up with reverts of reverts, or 
the modified (with the fix) original commits applied on top, are not we 
going to sign ourselves for another 13 or so round of patches before we 
all agree on the solution?

- we could have just fixed this with proper communication from the get 
go about the regression in the first place, which remains the failure in 
communicating appropriately with driver authors/maintainers

- v5.17 and v5.18 final were already broken, but who on earth uses v5.17 
or v5.18 and not their stable counter parts, so we had a chance of 
slipping in a fix in a subsequent stable, I mean, it's been broken for 2 
releases on the CM4 and it was not noticed, so what was the urgency?

- the reverts will make it to -stable being bug fixes for regressions, 
however for users like Jim and I, now we will lose a feature that we 
were relying on, thus causing a regression for *many other* platforms 
than just the CM4

I appreciate that as a maintainer you are very sensitive to regressions 
and want to be responsive and responsible but this is not leaving just a 
slightest chance to right a wrong. Can we not do that again please?

Maybe I am being overly sensitive and disgruntled today, but really this 
is the type of thing that makes me want to quit working on the Linux kernel.
-- 
Florian
