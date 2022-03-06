Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83387E
	for <regressions@lists.linux.dev>; Sun,  6 Mar 2022 21:33:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id bu29so23251293lfb.0
        for <regressions@lists.linux.dev>; Sun, 06 Mar 2022 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I1VslL3ye1MbAoXD/93dVSkYx3rBEqLz04PvwnWO5Xc=;
        b=aP7NIVkTp8F0TQzsVHRkgravZwx4iPy0i/GXcER23Kdwa3h0g1I9y3M8zMLvIP91ma
         ObiiRLWF0p9p92E69K8HInTDYUDFmL7AEyunpOxfqnONlKhXGU6Fd6Bw+kpf40xyPLD7
         J4arYW2KdltXWYcpnA2rG4WjyBSh6aOQAuIOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I1VslL3ye1MbAoXD/93dVSkYx3rBEqLz04PvwnWO5Xc=;
        b=2ZMUk8kP3Hhq0tWplUXr5FQTXF4ik7RbjpYB5g6uOl4eStoKD5aBgR2W13FDNt+dBY
         LaAltO3cTJSsEwJogr60y9DHwEOMrcXBI4POuTO7Hfotm0gvF8mkxGxy3UAKQoMAHlKc
         atGfnAR5NviyUeAgmiKCp5FOzAF0deSdMbLQ4b7jJUNCxDTWgiZd0qP4U0guWvNL1w7L
         T+cxJwd2KsZ1VG5YoLD0kBPTGAoL6A7nkh325pwJtqMOR1P5wqgutEiBYYIIBp0c47e4
         zfv6HxAfYV36wRe7pBgxbERpi1pt6752Tz2Rde4LVgI0UeeIzwPyjINpFT/1JOLDcsrP
         7VGg==
X-Gm-Message-State: AOAM530s+E7lzAgJwJA4etBeehUvhsHlHAwF4S86XI6qb8Zphhk1i4IQ
	zRhOBLdKXrUS3FzgwWx+u4m/oUYzURgJMPIkJR8=
X-Google-Smtp-Source: ABdhPJyjkAa4HhUrG4R6uU+8yk5KL1WXdWnf8m8p+cB16RUZ0MMW4++wEGRpbFCsHK/LO8ac6IbEPA==
X-Received: by 2002:a05:6512:3f09:b0:43a:4463:56f9 with SMTP id y9-20020a0565123f0900b0043a446356f9mr5710610lfa.533.1646602400594;
        Sun, 06 Mar 2022 13:33:20 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id m8-20020a196148000000b004482fc6516csm337137lfk.178.2022.03.06.13.33.18
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 13:33:18 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id w27so23155427lfa.5
        for <regressions@lists.linux.dev>; Sun, 06 Mar 2022 13:33:18 -0800 (PST)
X-Received: by 2002:ac2:41cf:0:b0:448:1eaa:296c with SMTP id
 d15-20020ac241cf000000b004481eaa296cmr5987125lfi.52.1646602398190; Sun, 06
 Mar 2022 13:33:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <164659571791.547857.13375280613389065406@leemhuis.info>
In-Reply-To: <164659571791.547857.13375280613389065406@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Mar 2022 13:33:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYjH_GMvdnNdVOn8m81eBXVykMAZvv_nfh8v_qdyQNvA@mail.gmail.com>
Message-ID: <CAHk-=wgYjH_GMvdnNdVOn8m81eBXVykMAZvv_nfh8v_qdyQNvA@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2022-03-06]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>, Rob Herring <robh@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Jakub Kicinski <kuba@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Netdev <netdev@vger.kernel.org>, 
	Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 6, 2022 at 11:58 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> ========================================================
> current cycle (v5.16.. aka v5.17-rc), culprit identified
> ========================================================
>
> Follow-up error for the commit fixing "PCIe regression on APM Merlin (aarch64 dev platform) preventing NVME initialization"
> ---------------------------------------------------------------------------------------------------------------------------
> https://linux-regtracking.leemhuis.info/regzbot/regression/Yf2wTLjmcRj+AbDv@xps13.dannf/
> https://lore.kernel.org/stable/Yf2wTLjmcRj%2BAbDv@xps13.dannf/
>
> By dann frazier, 29 days ago; 7 activities, latest 23 days ago; poked 13 days ago.
> Introduced in c7a75d07827a (v5.17-rc1)

Hmm. The culprit may be identified, but it looks like we don't have a
fix for it, so this may be one of those "left for later" things. It
being Xgene, there's a limited number of people who care, I'm afraid.

Alternatively, maybe 6dce5aa59e0b ("PCI: xgene: Use inbound resources
for setup") should just be reverted as broken?

> ====================================================
> current cycle (v5.16.. aka v5.17-rc), unknown culprit
> ====================================================
>
>
> net: bluetooth: qualcom and intel adapters, unable to reliably connect to bluetooth devices
> -------------------------------------------------------------------------------------------
> https://linux-regtracking.leemhuis.info/regzbot/regression/CAJCQCtSeUtHCgsHXLGrSTWKmyjaQDbDNpP4rb0i+RE+L2FTXSA@mail.gmail.com/
> https://lore.kernel.org/linux-bluetooth/CAJCQCtSeUtHCgsHXLGrSTWKmyjaQDbDNpP4rb0i%2BRE%2BL2FTXSA@mail.gmail.com/
>
> By Chris Murphy, 23 days ago; 47 activities, latest 3 days ago.
> Introduced in v5.16..f1baf68e1383 (v5.16..v5.17-rc4)
>
> Fix incoming:
> * https://lore.kernel.org/regressions/1686eb5f-7484-8ec2-8564-84fe04bf6a70@leemhuis.info/

That's a recent fix, it seems to be only in the bluetooth tree right
now, and won't be in rc7. I'm hoping that I'll get it in next week's
networking dump.

Cc'ing the right people just to prod them, since we've had much too
many "Oh, I didn't even realize it was a regression" issues this time
around.

                       Linus
