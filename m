Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E8A54
	for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 08:13:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ca13so14598443ejb.9
        for <regressions@lists.linux.dev>; Tue, 23 Aug 2022 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=M2VC3T3i8SI6ISvyTjIYNrIDwSYB0SPwFcKC30GUfDM=;
        b=YhnTBXKsX1sutRE3jqRO9H6Pjc1ZGKYwM6o16Q0HFOdstfdMOz52ZyhELuCQJXRG36
         zhmsnRPt5OkaQBKmjswJIygbaUEYQfs5ITpnbmXlta8HzIMzCM5ofAonMP0eWDOuo/dS
         +Rdh140kzsHwOpdzshLKhiTpaVIWcDxpncvtaY8fcWjxK/W+dbyvunc1qRpd+s0M3QME
         n0Bmg63HsdKktJ6CvRLGxpiXhXz4I1s/EP64HmMismIM9r2zLw7T3nR4gq22B0+JIB/I
         s9M/zgtKzwbvOY5obJkZjPkjN1v9+5tlUkl0QmaAFM0w1vSGg0xj1KyEZG4fpvS6Fda/
         wlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=M2VC3T3i8SI6ISvyTjIYNrIDwSYB0SPwFcKC30GUfDM=;
        b=iWWC10hcCq50aG8BP6C9YpSADH9siaI9fNvtIy+NJFko0TLCW9gFS9/Ed+83paNBqu
         LGKw+HNnXaoZ+oZiSW+NnoU8DS+HS7IAymjYt/BIGfG1xr7VE4ayAqCpho57sRIuFo/v
         0cZW6VAIRBEzeXBQoG1TGDmlLLX83DvpemJg134Oy7lwzzw0KuKfpkea1Sl+oxP9mWj5
         skXEwrh5irRPEcb6/V2XQO4z9miGLnt9IaSQVOfL1mXBfpb1xp6vzZAzT3H94AXVMPyR
         eDYcR+rdi4L3E+XYnBZNr9INLK9kWPuBweiot7a1F1+E7szvmq8hrTf5MH4/xLC/6iHb
         fuqg==
X-Gm-Message-State: ACgBeo2dU9A83ISfrSHHOsYEUQ9s/7HjaUBd1RX78GzlissTr3GsKP8y
	LWWm34ZMkABjPGuSsxzw/p43B9eutNlXytOQnv5GOQ==
X-Google-Smtp-Source: AA6agR6adncEGL6epJiFBvb7FvvzRHDp7dN9532v8AKMOIlxyCEYv+l415yM/3YSXIcselx7YV94occ/T/pXa7FdGTA=
X-Received: by 2002:a17:907:2c48:b0:73c:931e:5175 with SMTP id
 hf8-20020a1709072c4800b0073c931e5175mr13431983ejc.44.1661242379105; Tue, 23
 Aug 2022 01:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuecPu-n-ujLsv7vL8RjEJA-6rOZjc363+p1oo6v-FKKQ@mail.gmail.com>
 <CAGETcx_EpQx-QRtCbbcEDpLHSnNeYysNEnmTOQL4+vb4zzvk4Q@mail.gmail.com>
In-Reply-To: <CAGETcx_EpQx-QRtCbbcEDpLHSnNeYysNEnmTOQL4+vb4zzvk4Q@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Aug 2022 13:42:47 +0530
Message-ID: <CA+G9fYvsqiMPqeo+Yqx4WQEEhXbWqKFbRdKTnP9a1FxQGRroUA@mail.gmail.com>
Subject: Re: Unable to handle kernel NULL pointer dereference at virtual
 address 0000000000000008
To: Saravana Kannan <saravanak@google.com>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Wang Kefeng <wangkefeng.wang@huawei.com>, 
	Rob Herring <robh@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Saravana,

On Tue, 23 Aug 2022 at 02:09, Saravana Kannan <saravanak@google.com> wrote:
>
> On Mon, Aug 22, 2022 at 7:00 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > The arm64 Qualcomm db410c device boot failed intermittently on
> > Linux next-20220822 and Linux mainline 6.0.0-rc1.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > [    0.000000] Linux version 6.0.0-rc1 (tuxmake@tuxmake)
> > (aarch64-linux-gnu-gcc (Debian 11.3.0-3) 11.3.0, GNU ld (GNU Binutils
> > for Debian) 2.38.90.20220713) #1 SMP PREEMPT @1661110347
> > [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> > <trim>
> > [    3.609382] Loading compiled-in X.509 certificates
> > [    3.702306] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000000000000008
> > [    3.702380] Mem abort info:

<trim>

> > [    3.771199] pc : pl011_probe+0x30/0x154
> > [    3.778480] l8: Bringing 0uV into 1750000-1750000uV
> > [    3.783073] lr : amba_probe+0x11c/0x1b0

<trim>

>
> Hi Naresh,
>
> Thanks for the report!
>
> These two patches together should fix the issue:
> https://lore.kernel.org/lkml/20220818172852.3548-1-isaacmanjarres@google.com/
> https://lore.kernel.org/lkml/20220817184026.3468620-1-isaacmanjarres@google.com/

Reported-by and Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by and Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


> Can you give them a shot please?

I have applied the above two patches on Linus master branch and built
and boot tested on db410c the boot is successful now [1].

> Also, in general, it'd be nice if you could report issues in the
> original thread of the patch causing issues. It would make it easier
> to keep track of all the issues.

When I bisect and confirm bad commits then I will reply to that thread.

[1] https://lkft.validation.linaro.org/scheduler/job/5423144#L2005

- Naresh
