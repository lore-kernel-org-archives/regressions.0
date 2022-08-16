Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609006AAE
	for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 19:10:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id dc19so20646553ejb.12
        for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yzrVpPuDYTxXMkdItXzTsS/x0cvNzj9XD0M7B64fKkM=;
        b=hRVUjFvYmNjBenxN26rM1xLF3lI5JQT01UB04cU3e6k+/745Td4UiuUQ7TZ10C3voN
         siR7BMzwAUZsTJpxsypPp+ZGfQt91NHSg6/aSDd4A5Kd6mL7hB/2C5qiNVvp0kFEiqpZ
         Ts68OOg3tm882msV1Ffr4efqdWvIqV5y5DDDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yzrVpPuDYTxXMkdItXzTsS/x0cvNzj9XD0M7B64fKkM=;
        b=8Iw4hWQBX+4s/mzZpsLHYOeICIfJjiSaz8/35AhRCfh+ikscHMEBpfrXDJ1smW4lvs
         Q4EY9K2pC86UuiAglj1u1N6AZuElC2da5vP7m55GxXLuZykK6S1pTVmDSvBpJyTnzbao
         97uRK+6FVxgNvjDSieVmxhU241yRnAGFNOavR7Fa5fmaQH1XtWfGaT8bYIlLK5qVyDvg
         Qr26aKR44mIUyMPsBF9qwm5vaBE0izLduN6gGCaXcHwVH5bgqidRaJGINAx8of/LqNvv
         oj5Q8BWeSyenmZSbSStUAJ6uv0l3aZ5uEmXMS8j3JfajpUS+mUXYebW15Rs2qDfAkt7c
         CbUw==
X-Gm-Message-State: ACgBeo0TRv4lVNt/elMwYECRKHHTgnXa3bi+R2wp0oIEhqfooG/E2gVp
	GAggP+Uj8bcSRBqGxHrUVN+TwiPo7ZUEh5ZBTZg=
X-Google-Smtp-Source: AA6agR5/TjegcEqiVCQ4KkwjD+g+6LEioKh3NSvyyeBp1egVuNM8rX+JADNA1bi14N2xELFRfDK/Qg==
X-Received: by 2002:a17:906:7953:b0:732:345:ef02 with SMTP id l19-20020a170906795300b007320345ef02mr14776780ejo.24.1660677018450;
        Tue, 16 Aug 2022 12:10:18 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id jl4-20020a17090775c400b00734a9503bcasm5642223ejc.135.2022.08.16.12.10.16
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 12:10:17 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id p10so13730781wru.8
        for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 12:10:16 -0700 (PDT)
X-Received: by 2002:a05:6000:1888:b0:222:ca41:dc26 with SMTP id
 a8-20020a056000188800b00222ca41dc26mr11814187wri.442.1660677016516; Tue, 16
 Aug 2022 12:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
In-Reply-To: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 12:10:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com>
Message-ID: <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com>
Subject: Re: [next] arm64: kernel BUG at fs/inode.c:622 - Internal error: Oops
 - BUG: 0 - pc : clear_inode
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 12:00 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following kernel BUG found while booting arm64 Qcom dragonboard 410c with
> Linux next-20220816 kernel Image.

What kind of environment is this?

Havign that inode list corruption makes it smell a *bit* like the
crazy memory corruption that we saw with the google cloud instances,
but that would only happen wif you actually use VIRTIO for your
environment?

Do you see the same issue with plain v6.0-rc1?

            Linus
