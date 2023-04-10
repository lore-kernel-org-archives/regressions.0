Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE6315AE
	for <regressions@lists.linux.dev>; Mon, 10 Apr 2023 02:03:41 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso8732076wmq.2
        for <regressions@lists.linux.dev>; Sun, 09 Apr 2023 19:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681092220;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8+HYCJGCwTXkdKfc3wbjzMmuJZ78fDXX1DXuZa8+pA=;
        b=Zn4L8Zn2SGkDhaCmjspN2hXev2E6AivTG9yp/AkqbFj/ciIiDBLGicGYRMEnGil75R
         YjKuoti73ybffs4oaLBVBVepWt0qaakppp6FBpAjBLJA34kdvSA/mZnXo52baJUgCaWM
         dBPEzy1OP8KkUOEiXkOEmnRnWPq0F9xpvhDXQKoIjXpa71HB4Ha7fXjIGwlHIiEdsqiW
         d5lQ53RL6Gzh9oTwdxxCDwpC27i4z1Tdko0XbKvqrQhbDVOhQ5aLLQ/GoP2HoeNXrsBd
         z4ajIOPl/peGLoxb48GJZNLj7vuBngGoMIRABOiCRO7sVPs/zRDoZStp0PVkFXvy2T6u
         leBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681092220;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8+HYCJGCwTXkdKfc3wbjzMmuJZ78fDXX1DXuZa8+pA=;
        b=uFUyLzvPAmoUpZ9UC5lm9+RqFDjE7x+u614rx542XJ9tIkUHTr5UeNJXclekyhxjZy
         +QApqZ5ErMBnyxp2tmLopt/cT1xAQUTCBe1FXxv7kO++vVZwmyaX0fTQibfgYQ160Ftc
         3AhVMKz4VI6Wrcfqv/Kl1DbNr96ICG1DS8eMTTMpaFCKXdACK2VbGMm6B+g1mxK+zerd
         XfxhUNoW7g+MQrBmpZOTJB3qYQk1EU0LDoOiLge9Oinm58xW+xT7l5pPpXeXUjdwDpsN
         +zkoP2sbDw4hQsHeJv1eveaE2zAClrQ7ZLmGLl8c5dKL3ekZ44gNTwCnAzcMZiepzm8X
         gp0g==
X-Gm-Message-State: AAQBX9ffGaxihW2eyzbowYz0dB76P5oOIT/58LGhHgtALK/n1FlKOVIO
	QKvgTjWzpAKgsmsxROgULSs=
X-Google-Smtp-Source: AKy350Z/6Wz/AaSZAWSycWD7855m1cvAvEDlrhAdjGi0OyoFQMG9U4z1AiTpp3NxUPX0q4Fa8tmEXQ==
X-Received: by 2002:a7b:cb4e:0:b0:3f0:7f07:e617 with SMTP id v14-20020a7bcb4e000000b003f07f07e617mr5088932wmj.8.1681092219869;
        Sun, 09 Apr 2023 19:03:39 -0700 (PDT)
Received: from [10.32.180.129] ([148.88.245.129])
        by smtp.gmail.com with ESMTPSA id f3-20020a7bc8c3000000b003ee10fb56ebsm12176018wml.9.2023.04.09.19.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 19:03:39 -0700 (PDT)
Message-ID: <6a54fa77-9a0c-8844-2eb0-b65591e97a16@gmail.com>
Date: Mon, 10 Apr 2023 03:03:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Michael Bromilow <stick.insects22@gmail.com>
Subject: Re: [6.2 regression][bisected]discard storm on idle since
 v6.1-rc8-59-g63a7cb130718 discard=async
To: Boris Burkov <boris@bur.io>, Chris Mason <clm@meta.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Sergei Trofimovich <slyich@gmail.com>, Josef Bacik <josef@toxicpanda.com>,
 Christopher Price <pricechrispy@gmail.com>, anand.jain@oracle.com,
 clm@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org
References: <CAHmG9huwQcQXvy3HS0OP9bKFxwUa3aQj9MXZCr74emn0U+efqQ@mail.gmail.com>
 <CAEzrpqeOAiYCeHCuU2O8Hg5=xMwW_Suw1sXZtQ=f0f0WWHe9aw@mail.gmail.com>
 <ZBq+ktWm2gZR/sgq@infradead.org> <20230323222606.20d10de2@nz>
 <20d85dc4-b6c2-dac1-fdc6-94e44b43692a@leemhuis.info>
 <ZCxKc5ZzP3Np71IC@infradead.org>
 <41141706-2685-1b32-8624-c895a3b219ea@meta.com> <20230404185138.GB344341@zen>
Content-Language: en-GB
In-Reply-To: <20230404185138.GB344341@zen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2023 19:51, Boris Burkov wrote:
> On Tue, Apr 04, 2023 at 02:15:38PM -0400, Chris Mason wrote:
>> So, honestly from my POV the async discard is best suited to consumer
>> devices.  Our defaults are probably wrong because no matter what you
>> choose there's a drive out there that makes it look bad.  Also, laptops
>> probably don't want the slow dribble.
> 
> Our reasonable options, as I see them:
> - back to nodiscard, rely on periodic trims from the OS.
> - leave low iops_limit, drives stay busy unexpectedly long, conclude that
>    that's OK, and communicate the tuning/measurement options better.
> - set a high iops_limit (e.g. 1000) drives will get back to idle faster.
> - change an unset iops_limit to mean truly unlimited async discard, set
>    that as the default, and anyone who cares to meter it can set an
>    iops_limit.
> 
> The regression here is in drive idle time due to modest discard getting
> metered out over minutes rather than dealt with relatively quickly. So
> I would favor the unlimited async discard mode and will send a patch to
> that effect which we can discuss.

Will power usage be taken into consideration? I only noticed this regression
myself when my laptop started to draw a constant extra ~10W from the constant
drive activity, so I imagine other laptop users would also prefer a default
which avoids this if possible. If "relatively quickly" means anything more
than a few seconds I could see that causing rather significant battery life
reductions.

- Michael
