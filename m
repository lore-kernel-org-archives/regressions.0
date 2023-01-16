Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9E29A8
	for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 15:44:39 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso34314661pjt.0
        for <regressions@lists.linux.dev>; Mon, 16 Jan 2023 07:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ep+gu8Wzxz1XzGkyuWB0bLCmC8cV8aaLkxDrtlaBNIE=;
        b=c9zNawnK2UWJhD/sNZEYHGKiNRlWVDyJijBtFtC8agG3fvskxGdpuCfktsi/Lotk9X
         pIx7QRICwargwIAnL5DuRxsUS0SIYEuq1t07E1RKcyacojSWF3KkzwrFGAyqlMOiV1IE
         s7OkG9vlFc4Al7DdkOWL+V9RVs/rhEMiNvWZRTy8vZgKc/ZCZK3++xFtE6u4c83mtXN8
         hftxLgO3Rv1kD2AcwM7y82t3Oh+0u+dKixBRpiwSgDAjNKF2Z3lwGPeWVXj4ZpehAVnm
         HYIj23INl6+EAGxC3EeAiGIAaNeYB+lhXaKlP48JC0WPEhaOv03T7bmgUjR9MAPctPuA
         t5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ep+gu8Wzxz1XzGkyuWB0bLCmC8cV8aaLkxDrtlaBNIE=;
        b=MO8LvUI3jdQfZe1EyWZiEwUnoWn7aWw14W60/7Ys+XnuKh3yxIseO7WN2PMpZfdN31
         20W3hRHD3MdmXaOR8wPHECLZp5+NtMu3BtSBPayiElLbVEBfYFQpS11/8bnp5OYrAzn9
         tOZAAYZ4rc49h6m17JBgCvKb16pnM57irURMxc9Ca2/F8fZTesN2jZyKv8YXKEmOLYw7
         oXXx74214DnAaQm/qT0u+xYDyl5iWHzWp6UtS37V9lAgzdCoLPxfMKJU1VhKduGlxt+x
         aMp7APGvyMNkZ2eMqPhgxLWKYZtareXjAVGXSTlQ2SQgfyt09fr8Mgvy9V8kZt3J9dEc
         Br1w==
X-Gm-Message-State: AFqh2kqzc9+Itd489sIbdW52UyVOaWr59tW3lWZ06++ADnA7eZPvBzwM
	wSvWT17MskDeo2NKshX2fVBpbg==
X-Google-Smtp-Source: AMrXdXt0BZIJaIf2dPN5YJX2ElhkSG66V59emcBOnQUbzsek5vKyKYZiPt7whP8yZXNyuRHMVUbr5Q==
X-Received: by 2002:a17:902:d3c9:b0:189:b74f:46ad with SMTP id w9-20020a170902d3c900b00189b74f46admr53348plb.3.1673883879034;
        Mon, 16 Jan 2023 07:44:39 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b00172cb8b97a8sm5715112plh.5.2023.01.16.07.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 07:44:38 -0800 (PST)
Message-ID: <e921f92d-52ac-1dc7-7720-c270910c2a2d@kernel.dk>
Date: Mon, 16 Jan 2023 08:44:37 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216932_-_io=5furing_with_?=
 =?UTF-8?Q?libvirt_cause_kernel_NULL_pointer_dereference_since_6=2e1=2e5?=
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, io-uring@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, "Sergey V." <truesmb@gmail.com>
References: <74347fe1-ac68-2661-500d-b87fab6994f7@leemhuis.info>
 <c5632908-1b0f-af1f-4754-bf1d0027a6dc@kernel.dk>
 <a862915b-66f3-9ad8-77d4-4b9ce7044037@kernel.dk> <Y8VkB6Q2xqeut5N8@kroah.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Y8VkB6Q2xqeut5N8@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/16/23 7:49 AM, Greg Kroah-Hartman wrote:
> On Mon, Jan 16, 2023 at 07:13:40AM -0700, Jens Axboe wrote:
>> On 1/16/23 6:42 AM, Jens Axboe wrote:
>>> On 1/16/23 6:17?AM, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>>>> Hi, this is your Linux kernel regression tracker.
>>>>
>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216932 :
>>>
>>> Looks like:
>>>
>>> commit 6d47e0f6a535701134d950db65eb8fe1edf0b575
>>> Author: Jens Axboe <axboe@kernel.dk>
>>> Date:   Wed Jan 4 08:52:06 2023 -0700
>>>
>>>     block: don't allow splitting of a REQ_NOWAIT bio
>>>
>>> got picked up by stable, but not the required prep patch:
>>>
>>>
>>> commit 613b14884b8595e20b9fac4126bf627313827fbe
>>> Author: Jens Axboe <axboe@kernel.dk>
>>> Date:   Wed Jan 4 08:51:19 2023 -0700
>>>
>>>     block: handle bio_split_to_limits() NULL return
>>>
>>> Greg/team, can you pick the latter too? It'll pick cleanly for
>>> 6.1-stable, not sure how far back the other patch has gone yet.
>>
>> Looked back, and 5.15 has it too, but the cherry-pick won't work
>> on that kernel.
>>
>> Here's one for 5.15-stable that I verified crashes before this one,
>> and works with it. Haven't done an allmodconfig yet...
> 
> All now queued up, thanks!

Thanks Greg! This one was my fault, as it was a set of 2 patches and
I only marked 2/2 for stable. But how is that best handled? 1/2 could've
been marked stable as well, but I don't think that would have prevented
2/2 applying fine and 1/2 failing and hence not getting queued up until
I would've done a backport.

What's the recommended way to describe the dependency that you only
want 2/2 applied when 1/2 is in as well?

-- 
Jens Axboe


