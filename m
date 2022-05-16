Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C9D1376
	for <regressions@lists.linux.dev>; Mon, 16 May 2022 19:14:23 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id r27so17048386iot.1
        for <regressions@lists.linux.dev>; Mon, 16 May 2022 12:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yu8jpBcESlRO41WVtwunoeenHnb5B2EXEF8tRgSzHgE=;
        b=tqCZDZ0dx3cF6RCC1hPbCmSnLFGA3LUJA9FPT9yl/mq42q/ABuK1f4ejnoMS+6ky5L
         sZV492OnuqI4ApfBjNxD/my1zZ8AwFpREQ1L/GBEJ32+4I6LJOEjUl2OgZalqTspT+p+
         2mNM7tW92wIo49NXj9jlQ35oPO2uzhro/D/D0tz2/GPSuepEvmI3a9TXF0pwkODrPVxD
         Z9XoZjpMtFeR0EceB3XQFrrJPstyipKo6XN44acrdN7iQWOBUT6EbQ3duotSqKjd1XR3
         sSGEgWF7gL//m1iuVAY1+gkUbrNLBBX8g9luU4HxxMQUlozNuKRnPvzYT56wXGLm7anM
         QWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yu8jpBcESlRO41WVtwunoeenHnb5B2EXEF8tRgSzHgE=;
        b=VTQWYbSTbxI+aj/S1txdCapWsz6JrcwbHKpPoYQvFFCJPzZzlUlsf9CE+K8+DCuLJn
         o3ywZqa4EtW5olHXI38e3liECq67NMF3aec5mz+bgRY0HCetAinWCPgfKE4/ZHUwHyhP
         rEh/KtZYXzxNKr0duGAm2Twk1HZ3hmO7M9kqiSjANDYho7rsw6051VhGwnCXuRzBsRa7
         clCW1b7YQxc1YkTUN2CStEnUanrK/35iL4nBeO7PCAGolv1dvZO/KTyWjWsa8GZeB1Xm
         eMW3CrL7nXT10Loqpo8kAUfhoWvCURPhVSzt3rVhGjOyBP2XlI4xg7odpJzQGfiFzyE0
         WjPg==
X-Gm-Message-State: AOAM532h+E2CkGi72We5Lrb7NrPEncZYewBGwgYTeukgRj0wmTJ4Qggw
	8yvACflBOCbZE7CLY0ii2nP0Ew==
X-Google-Smtp-Source: ABdhPJzXFsXpsavDxnMRAYebmJL6UV04urGytrVKDDgSBJcwMy3VAVKN7/BgDEhXPwIkvfb4FKH84Q==
X-Received: by 2002:a02:7a06:0:b0:32b:1b83:649a with SMTP id a6-20020a027a06000000b0032b1b83649amr9861961jac.29.1652728462508;
        Mon, 16 May 2022 12:14:22 -0700 (PDT)
Received: from [192.168.1.172] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id w24-20020a6b4a18000000b0065a47e16f41sm63007iob.19.2022.05.16.12.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 12:14:21 -0700 (PDT)
Message-ID: <143f0708-e446-9cfe-eba8-8731d52345db@kernel.dk>
Date: Mon, 16 May 2022 13:14:20 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [REGRESSION] lxc-stop hang on 5.17.x kernels
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Harding <dharding@living180.net>,
 Pavel Begunkov <asml.silence@gmail.com>
Cc: regressions@lists.linux.dev, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christian Brauner <christian.brauner@ubuntu.com>
References: <7925e262-e0d4-6791-e43b-d37e9d693414@living180.net>
 <371c01dd-258c-e428-7428-ff390b664752@kernel.dk>
 <2436d42c-85ca-d060-6508-350c769804f1@gmail.com>
 <ad9c31e5-ee75-4df2-c16d-b1461be1901a@living180.net>
 <fb0dbd71-9733-0208-48f2-c5d22ed17510@gmail.com>
 <a204ba93-7261-5c6e-1baf-e5427e26b124@living180.net>
 <bd932b5a-9508-e58f-05f8-001503e4bd2b@gmail.com>
 <12a57dd9-4423-a13d-559b-2b1dd2fb0ef3@living180.net>
 <897dc597-fc0a-34ec-84b8-7e1c4901e0fc@leemhuis.info>
 <c2f956e2-b235-9937-d554-424ae44c68e4@living180.net>
 <41c86189-0d1f-60f0-ca8e-f80b3ccf5130@gmail.com>
 <da56fa5f-0624-413e-74a1-545993940d27@gmail.com>
 <3fc08243-f9e0-9cec-4207-883c55ccff78@living180.net>
 <13028ff4-3565-f09e-818c-19e5f95fa60f@living180.net>
 <469e5a9b-c7e0-6365-c353-d831ff1c5071@leemhuis.info>
 <eaee4ea1-8e5a-dde8-472d-44241d992037@kernel.dk>
 <1ce76b24-9185-6b2e-844e-d6a0ce42bb0f@leemhuis.info>
 <55ddaa3c-57a5-f17e-13a7-7427c5f1bb88@kernel.dk>
 <735012d3-bbda-54df-11fb-8e7b561c598d@leemhuis.info>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <735012d3-bbda-54df-11fb-8e7b561c598d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/22 1:07 PM, Thorsten Leemhuis wrote:
> 
> 
> On 16.05.22 20:39, Jens Axboe wrote:
>> On 5/16/22 12:34 PM, Thorsten Leemhuis wrote:
>>> On 16.05.22 20:22, Jens Axboe wrote:
>>>> On 5/16/22 12:17 PM, Thorsten Leemhuis wrote:
>>>>>>> Pavel, I had actually just started a draft email with the same theory
>>>>>>> (although you stated it much more clearly than I could have).  I'm
>>>>>>> working on debugging the LXC side, but I'm pretty sure the issue is
>>>>>>> due to LXC using blocking reads and getting stuck exactly as you
>>>>>>> describe.  If I can confirm this, I'll go ahead and mark this
>>>>>>> regression as invalid and file an issue with LXC. Thanks for your help
>>>>>>> and patience.
>>>>>>
>>>>>> Yes, it does appear that was the problem.  The attach POC patch against
>>>>>> LXC fixes the hang.  The kernel is working as intended.
>>>>>>
>>>>>> #regzbot invalid:  userspace programming error
>>>>>
>>>>> Hmmm, not sure if I like this. So yes, this might be a bug in LXC, but
>>>>> afaics it's a bug that was exposed by kernel change in 5.17 (correct me
>>>>> if I'm wrong!). The problem thus still qualifies as a kernel regression
>>>>> that normally needs to be fixed, as can be seen my some of the quotes
>>>>> from Linus in this file:
>>>>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html
>>>>
>>>> Sorry, but that's really BS in this particularly case. This could always
>>>> have triggered, it's the way multishot works. Will we count eg timing
>>>> changes as potential regressions, because an application relied on
>>>> something there? That does not make it ABI.
>>>>
>>>> In general I agree with Linus on this, a change in behavior breaking
>>>> something should be investigated and figured out (and reverted, if need
>>>> be). This is not that.
>>>
>>> Sorry, I have to deal with various subsystems and a lot of regressions
>>> reports. I can't know the details of each of issue and there are
>>> developers around that are not that familiar with all the practical
>>> implications of the "no regressions". That's why I was just trying to
>>> ensure that this is something safe to ignore. If you say it is, than I'm
>>> totally happy and now rest my case. :-D
>>
>> It's just a slippery slope that quickly leads to the fact that _any_
>> kernel change is a potential regressions,
> 
> I know, don't worry, that's why I'm trying to be careful. But I also had
> cases already where someone (even a proper subsystem maintainer) said
> "this is not a regression, it's a userspace bug" and it clearly was a
> kernel regression (and Linus wasn't happy when he found out). That why I

I get where you're coming from, and that is indeed what most maintainers
would say :-)

-- 
Jens Axboe

