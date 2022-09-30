Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365C05A7C
	for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 16:41:20 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13189cd5789so6061029fac.11
        for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 09:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vB5Cit1qlgwA4leXT66n18iypc7LDJDE0w8r4rLqzqc=;
        b=VIrCOVi4X9YFy445rGJ4l2kgquwicILGfEndEovWbO5N4Lawl7mduwunTPdmsyfX5i
         r5hd9dv7V+oaqTXGtLzEloU9J93ZTRQGQCA/kscKzZbt51fH0WDfnZwKecW2bA6TMzj8
         orAGCNF6lve9To/lY0galgrf/5siuzYULgA9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vB5Cit1qlgwA4leXT66n18iypc7LDJDE0w8r4rLqzqc=;
        b=SdpAruU/ZjqMd5zLGSFLJS/eOsX0SsQUSM93+qTVjhpE7ZDCuGbWbnW0BhnV/6Ddyx
         cjnZTIUipZid4KMttoSfmYxKyfqloxQ7V994739tzTO6F/ZpXOWtATHJWq/a5WMMDNpJ
         isSd3B111Zf1E3AAQSJv0vCqcmtX85prFrB93tyzbLD9HeMnJvuvR/GwZBdxJXQTgavT
         yR/+Sx+ncG9uER/NWD9L5RHrjpmu4ODRfvhlBe3TK0DD4tDNSmVVPA0OA7fN+yqBeR85
         HPoKEGjfRcLC0Dg5sT7YZPpO3GZZ2oYnIVogllFZ18Aas1zKVRRjUJsjBcKjw49YOrE8
         pruw==
X-Gm-Message-State: ACrzQf1pIZ3w2PvOy2XixTak0WaDFOTcWdL9K33ERC2ZwV/LmGn+AnM7
	1rrT0YZLQQMdDgmX+yx3wx5/Xc050GYJVA==
X-Google-Smtp-Source: AMsMyM4ARzakEWezEJOdqsEuTDyHZp16/hpTSmlAXHC7iiKUInLKOm8vrFoh4pKpDUnZFAVYt0xRMg==
X-Received: by 2002:a05:6870:524a:b0:131:a017:3156 with SMTP id o10-20020a056870524a00b00131a0173156mr5068075oai.243.1664556078853;
        Fri, 30 Sep 2022 09:41:18 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id s37-20020a0568302aa500b00636a8dafdc9sm673204otu.2.2022.09.30.09.41.18
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 09:41:18 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-131fd187e35so2355995fac.7
        for <regressions@lists.linux.dev>; Fri, 30 Sep 2022 09:41:18 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr5239613oad.126.1664556077774; Fri, 30
 Sep 2022 09:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d78137ce-f6d0-e8d9-9248-2ec84b502b72@leemhuis.info>
In-Reply-To: <d78137ce-f6d0-e8d9-9248-2ec84b502b72@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Sep 2022 09:41:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg233O80=VWhk+DQet=oqq7cxzwoZVFgbCmCJ_TQQ+Y7A@mail.gmail.com>
Message-ID: <CAHk-=wg233O80=VWhk+DQet=oqq7cxzwoZVFgbCmCJ_TQQ+Y7A@mail.gmail.com>
Subject: Re: Manual Linux regressions report for mainline [2022-09-30]
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 4:44 AM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Graphical issues on Lenovo Yoga 7 14ARB7 laptop since v6.0-rc1
> --------------------------------------------------------------
> https://lore.kernel.org/lkml/c1f8886a-5624-8f49-31b1-e42b6d20dcf5@augustwikerfors.se/
>
> Unlikely to hit many people afaics. A fix is posted and somewhat
> reviewed, but not yet merged by the maintainers afaics:
> https://lore.kernel.org/amd-gfx/20220928172726.128863-1-sunpeng.li@amd.com/

Actually, it's already in my tree because it came in with the drm
fixes pull this morning.

> efi_pstore and ramoops backends are unable to properly decompress dmesg
> sometimes
> -----------------------------------------------------------------------
> https://lore.kernel.org/all/20220929215515.276486-1-gpiccoli@igalia.com/
>
> Reported in the past 24 hours, includes a revert. Kees wasn't able to
> reproduce the problem. Guess developers will look into this today.

The revert also made it to me this morning, so that people can look
into it after 6.0.

The others are still open.

                   Linus
