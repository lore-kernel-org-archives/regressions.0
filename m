Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28605323C
	for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 15:09:45 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id eq13so3399974edb.11
        for <regressions@lists.linux.dev>; Sat, 18 Feb 2023 07:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgJb9gVH88PGc08H2WjK2lb5uIuxbgsWahfg6NJGgvc=;
        b=NOf7dxPFDZRhzPkx6GyGPyfikWbRviwRTkr22smpaRGvLecdj4iSZZSIA63iROUmKu
         KDMFx0ABUHjiCNq9PAEaf3ynIwc18NRBzzmfgJuqUAFwRLtQddIwzEW94TQlmjR8bTel
         Ko6twuH3hrKskeFGYt9zwMIOOTegVc6hhRj94Rewr9BJBOyjfDABZxsAtSjdQ+CLl+cB
         s00y5eiDQtESQmO8O2A2Yn+K/dIU4XHO23Br/v0RpLCrvlt0TzEiFzx3RYFj28erzzEX
         XfCukIayTfFche3Ff72u29qMT6d3unJ/UEp5laHioHdnw4GTiKXeaZ0CzmDUke3hF4vV
         rEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgJb9gVH88PGc08H2WjK2lb5uIuxbgsWahfg6NJGgvc=;
        b=1t9lzdS3wIR/3f7p+gGDnyQ1Wt8WnvrlYvdm9kSPT5hphDzD/assrAMyTKI0SKVRaO
         BO+grCtCmDz1tPx2nqbeKVSX8aZKNA8haILib+d5z+/DzGr49LLNlC9VZPw7P84F7luv
         wV6aZml6A2Dw4mOvpcoKxvwriS5UffG2Lc1+8f/s0WQ/ioo5SkvJ23noEJS+BeFJys88
         6oZyK2o+36jErOksEVt90PlIAE1W9UYjvNAV+ojyIZF1JUmCrBdb3rxZAf8kNA48Eb+t
         tcUVEanwoX+nTdUI4GoqlNLzQQsdklgdg4rDTl/j7aRSoHiYrBlsqMowvMnGK+DWqP3E
         /yiw==
X-Gm-Message-State: AO0yUKUaDOOg4VkVfg3jGrCqTKgralbvBSSwsTNSY+SkYImkoD47KtcW
	iCnAeV3AKP0XAgzAuBKmxB8SKw==
X-Google-Smtp-Source: AK7set8B7ASOT9ahO5mmjKrhEN8TOQur8B2zQbAphdp95C/MToAcBLZ2OShTFKDaR7If0BvEHlCIaw==
X-Received: by 2002:a05:6402:556:b0:4ac:b32e:b65 with SMTP id i22-20020a056402055600b004acb32e0b65mr5588099edx.3.1676732983283;
        Sat, 18 Feb 2023 07:09:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j17-20020a508a91000000b004a21c9facd5sm3685608edj.67.2023.02.18.07.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 07:09:42 -0800 (PST)
Message-ID: <78806040-5725-103f-fe55-8c6d9ced6e63@linaro.org>
Date: Sat, 18 Feb 2023 16:09:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Regression: NULL pointer dereference after NFS_V4_2_READ_PLUS
 (commit 7fd461c47)
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Anna Schumaker <Anna.Schumaker@Netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: linux-nfs@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <f591b13c-4600-e2a4-8efa-aac6ad828dd1@linaro.org>
 <65ae10cd-a086-47c6-c881-d1385d7fcf42@leemhuis.info>
 <5150343c-e13d-ed15-e59a-bc14f0db89da@leemhuis.info>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5150343c-e13d-ed15-e59a-bc14f0db89da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/02/2023 05:42, Linux regression tracking #update (Thorsten
Leemhuis) wrote:
> [TLDR: This mail in primarily relevant for Linux regression tracking. A
> change or fix related to the regression discussed in this thread was
> posted or applied, but it did not use a Link: tag to point to the
> report, as Linus and the documentation call for. Things happen, no
> worries -- but now the regression tracking bot needs to be told manually
> about the fix. See link in footer if these mails annoy you.]
> 
> On 08.01.23 09:52, Linux kernel regression tracking (#adding) wrote:
>> On 07.01.23 16:44, Krzysztof Kozlowski wrote:
>>>
>>> Bisect identified commit 7fd461c47c6c ("NFSv4.2: Change the default
>>> KConfig value for READ_PLUS") as one leading to NULL pointer exception
>>> when mounting NFS root on NFSv4 client:
>> [...]
>> Thanks for the report. To be sure the issue doesn't fall through the
>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
>> tracking bot:
>>
>> #regzbot ^introduced 7fd461c47
>> #regzbot title nfs: NULL pointer dereference since NFS_V4_2_READ_PLUS is
>> enabled by default
>> #regzbot ignore-activity
> 
> #regzbot fix: 896e090eefedeb8a715ea19938a2791c32679

I see it was posted and merged as "Revert "NFSv4.2: Change the default
KConfig value for READ_PLUS"". It's nice to give credits to people who
report bugs with "Reported-by" tag.

Best regards,
Krzysztof

