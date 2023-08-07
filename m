Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C7C8C0;
	Mon,  7 Aug 2023 08:29:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so25687405e9.3;
        Mon, 07 Aug 2023 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691396955; x=1692001755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xedCfYnu7czqa8+w0BoRZkS95VJKbfhAvT84gadWBaQ=;
        b=KJ2v+8P5T7FADtAwsbOhuzi61mzvR1n4HyST8IoTE14WUadiVYAj8bcixUS70lVDuJ
         uoi/Oy+5mVguqk53vI8lECmjIRCpiMs2FmaAmKQ/Ollou3HB9AWtOKEiO6to+JyIkOXf
         sp5CmXaypEnAaZAxllmkXcAICXQ3z2ms38lRaWNpTw1W1Lqn6KNPtWBlA0c9OvILior9
         URNEn7R85E6iwLNizheIzMJ7Yq79nN+oVjNBaaPeKGKdrPoRsgOcsFQAXRp3LFkYBx/b
         f+E04UShl8WS7sgpjiSQkESxMCukp8S0nnY8f9OwpXIDQHxxfs0OZihj+mjUvCjBi1cb
         6m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691396955; x=1692001755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xedCfYnu7czqa8+w0BoRZkS95VJKbfhAvT84gadWBaQ=;
        b=S3bUVWOmJDkRPQKtecS7VuQfksKKvmFDEQ6vGYFAKo7kJ7iXzuchQ6CHRVcId9PIKT
         o4wVsotVD6FYGv/zE6V279/5PVvVAe8YB/8WZDyQ3r3xr/UXCiSaUQ1w48EoapHv2t1Y
         lqZp9HQjlI/Wd1gBS0lXFtpy8QuW0RPh12q1W8Bnq8NeP8UW1QLcUmllobGGWbERZevg
         5itg1BTzupnRAILrV/htjtNJDiukQu35nDYVBMJEhUZrzKa/PVmY7lddcJRS8UCRR5DN
         bqdcLx2NDuN9BGRfmI+CqEkmdRuYXJSyc/898523VIryqfGyk3hQaMggQdsi0PNxsRX2
         W1NQ==
X-Gm-Message-State: AOJu0YyiYsj4J7tHOu9jt8BPRJTH0UEU9EtgKiP+YSVcGuOSxMxDHbGA
	kCUb+SMbMn2rSxsqNNIPnqo=
X-Google-Smtp-Source: AGHT+IGZc6ZOK0l/SXR4eXxv2Uq9owLaIVHisIsoNGlxGTL2VSplKSwRiG+i8/bMfg3xyYMR8pNl+w==
X-Received: by 2002:a05:600c:2286:b0:3fa:8c68:4aba with SMTP id 6-20020a05600c228600b003fa8c684abamr6396840wmf.25.1691396955320;
        Mon, 07 Aug 2023 01:29:15 -0700 (PDT)
Received: from [192.168.0.118] (88-113-27-52.elisa-laajakaista.fi. [88.113.27.52])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003fe15ac0934sm20884809wmq.1.2023.08.07.01.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 01:29:14 -0700 (PDT)
Message-ID: <b3f9b848-be97-8ce8-9f6c-b9abcb0086f5@gmail.com>
Date: Mon, 7 Aug 2023 11:29:13 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Kernel regression tracking/reporting initiatives and KCIDB
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 kernelci@lists.linux.dev, gregkh@linuxfoundation.org,
 regressions@lists.linux.dev
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Shreeya Patel <shreeya.patel@collabora.com>
References: <874jljhtmj.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <ed9a0b64-b7e7-7735-85f7-d688a3b8e89e@leemhuis.info>
From: Nikolai Kondrashov <spbnick@gmail.com>
In-Reply-To: <ed9a0b64-b7e7-7735-85f7-d688a3b8e89e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thorsten,

On 8/2/23 11:07, Thorsten Leemhuis wrote:
 > On 01.08.23 13:47, Ricardo Cañuelo wrote:
 >> So far, we’ve been using the KernelCI regression data and reports as
 >> data source, we're now wondering if we could tackle the problem with a
 >> more general approach by building on top of what KCIDB already provides.
 >
 > That's more your area of expertise, but I have to wonder: doesn't that
 > mainly depend on what the people/projects want which feed their test
 > results into KCIDB? I had expected some of them might already have
 > something to stay on top of regressions found by their systems, to at
 > least ensure they notice and fix tests that broke for external reasons
 > -- e.g. a test script going sideways, faulty hardware, a network
 > miss-configuration or others things which naturally will occur in this
 > line of work.

Yes, some of this is already done by some CI systems submitting results to
KCIDB. Syzbot is doing a very good job deduplicating crashes they have found,
0day is looking for outcome differences, AFAIK, and CKI has its known-issue
tracking system, which handles problems of various origin.

 >> In general, CI systems tend to define regressions as a low-level concept
 >> which is rather static: a snapshot of a test result at a certain point
 >> in time. When it comes to reporting them to developers, there's much
 >> more info that could be added to them.
 >
 > I wonder if it should be s/could/should/ here, as *if I* would be
 > running CI systems I'd fear that developers sooner or later might start
 > ignoring more and more of the reports my systems sends when too many of
 > them turn out to be bogus/misleading -- which naturally will happen for
 > various reasons you outlined below yourself (broken
 > hardware/test/network/...) (and seem to happen regularly, as mentioned
 > in https://lwn.net/Articles/939538/ ).

Yes, this is a constant struggle.

 > That doesn't mean that I think each failed test should be judged by a
 > human before it's sent to the developers. Compile errors for example
 > will be helpful often right away, especially for stable-rc.

Ehhh, KCIDB gets build failures all the time (in merged code) and it takes
a while before a fix propagates across all the trees.

For example, the recent v6.5-rc5 has got 14 build failures (out of 865 builds
received):

https://kcidb.kernelci.org/d/revision/revision?orgId=1&var-git_commit_hash=52a93d39b17dc7eb98b6aa3edb93943248e03b2f&var-patchset_hash=

I suspect that someone somewhere is already working on these, or even their
fix has been merged somewhere already, but the CI just keeps failing
meanwhile.

 >> In particular, the context of it
 >> and the fact that a reported regression has a life cycle:
 >>
 >> - did this test also fail on other hardware targets or with other kernel
 >>    configurations?
 >> - is it possible that the test failed because of an infrastructure
 >>    error?
 >> - does the test fail consistently since that commit or does it show
 >>    unstable results?
 >> - does the test output show any traces of already known bugs?
 >> - has this regression been bisected and reported anywhere?
 >> - was the regression reported by anyone? If so, is there someone already
 >>    working on it?
 >>
 >> Many of these info points can be extracted from the CI results databases
 >> and processed to provide additional regression data. That’s what we’re
 >> trying to do with the Regression Tracker tool, and we think it’d be
 >> interesting to start experimenting with the data in KCIDB to see how
 >> this could be improved and what would be the right way to integrate this
 >> type of functionality.
 >
 > I (with my likely somewhat biased view due to regzbot and my work with
 > it) wonder if we have two aspects here that might be wise to keep separated:
 >
 > * tests suddenly failing in one or multiple CI systems, which might be
 > due to something going sideways in the tests or a real kernel regression
 >
 > * regressions found by individuals or CI systems where a human with some
 > knowledge about the kernel did a sanity check (and also looked for
 > duplicates) to ensure this most likely is a regression that should be
 > acted upon -- and thus is also something that definitely should not be
 > forgotten.
 >
 > Your regression tracking tool could be the former, regzbot the latter
 > (which could feed the outcome back to the CI regression tracking
 > system). But as I said, my view is obviously biased, so maybe I'm to
 > blinded to see a better solution.

I agree that a human would be trusted more most of the time, and it would be
beneficial to give the results of human review a boost. However, ultimately,
automatic error detection is also made by humans, and it doesn't get tired,
can detect harder-to-spot problems, and problems happening en-masse, as you
mention.

If we consider applying patterns defined by humans to find already-known
issues in other test results, we get a combination of the two. I think
training an AI on the manually-detected issues, and those picked by those
patterns, could help us find completely new issues, and would further blur the
line between manual and automatic issue detection. Something that I'm looking
forward to exploring.

Regardless, I think we need both, and, in general, every trick in the book to
get Linux quality control on track.

Nick
