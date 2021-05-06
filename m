Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124070
	for <regressions@lists.linux.dev>; Thu,  6 May 2021 15:18:59 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id t4so8912487ejo.0
        for <regressions@lists.linux.dev>; Thu, 06 May 2021 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YP24ik0YFY+2RKJGevsfG1nOnOK5im66pfhuvAoWUhs=;
        b=tTFWv9t5g8z2bUpnTXSzgd4oMQ5rDcHfANsGbH2l/KJ12fZaxC562MlPcakkOelJKE
         qkQqlKZy0fmmxgU6Cmz/v28R9oxYZTUuy15uAUPkLuFgDuXwcVJjdC0Pc7evTOJdHO4w
         hdUBuqe8LhNqY1t34yN54kkLIHhukOFpaD5/xup2VIfLJ7pxwhtIyLQpJYVD8iM9a+fk
         iJFqCJ4L9R/at6eGqdFnhvBJXQP2X6OZCq7A0iU3G4II5jP3E7VGbFFS1Pbecvsblo7j
         8xqUa1ucUEf7hAd2u4jrDGdJj0s+28wwYHXg7xhSZGF2IEVP+L35prpsLf/HkG9tApWn
         0btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YP24ik0YFY+2RKJGevsfG1nOnOK5im66pfhuvAoWUhs=;
        b=rHV6Xc3M4faNf9xlHjZR7LH8IfwHsN13ltWxrQuWwacDW9DQ0qFCDM579GUM6WWFv4
         m3BSfn7dBhZTmb9CJMnBEyGmG1lZIzALK4S3q4Vlo00L9KLQCTNSEGjlROZtAsKxNlwP
         cb+lbg2aiUddIV0OhDFRyme9xqycf3L+IXFEo+W3YyQ+oOdB2chAOmbw9R4zzfhEQePP
         BARjPgNWfsSTiQLp/8rUT/lc1epx8gOxvMp74kcEssJJnZXfG2V0O5GNXEVN6wBaO0EN
         5ZNny1WUksbHQjXfwUKaBtM7reSKqm8LZvxwdEXb0dChQFS3h3kFYd87K58oVQI6dbSl
         K71w==
X-Gm-Message-State: AOAM531UIzMcD1bCapK56Fs/7n3Pgy1bIzYzyvhPjq5e7MxGwbkmYR5Z
	pqkpF6yiT/vRgrn3EYwyAjpiLyIzudkou98AoFryBA==
X-Google-Smtp-Source: ABdhPJxJRLbaNyR1550tOnih64Mj/K5bU7JfR6N4gmFUaxx/UgY/dqtwMx5DdgAPz5/iy5AzL3dAbCAC/WJxw2zyaMg=
X-Received: by 2002:a17:906:4f91:: with SMTP id o17mr4909703eju.503.1620314338343;
 Thu, 06 May 2021 08:18:58 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com>
In-Reply-To: <YJPYvsdkfx4JD4vT@atomide.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 6 May 2021 20:48:46 +0530
Message-ID: <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
To: Tony Lindgren <tony@atomide.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, regressions@lists.linux.dev, 
	Benoit Cousson <bcousson@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 May 2021 at 17:23, Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 11:00]:
> > Our bisect script pointed this as the first bad commit on linux
> > mainline master branch.
> >
> > Full test log:
> > ----------------
> > SATA detection failed log link,
> > https://lkft.validation.linaro.org/scheduler/job/2580998#L1973
> >
> > --
> > commit 98feab31ac491400f28b76a04dabd18ce21e91ba
> > Author: Tony Lindgren <tony@atomide.com>
> > Date:   Wed Mar 10 14:03:51 2021 +0200
> >
> >     ARM: OMAP2+: Drop legacy platform data for dra7 sata
>
> Thanks for the report, looks like we are now missing the sata related
> quirk flags compared to the patch above.
>
> Below is a quick patch to add the missing quirk flags that might help
> if you can give it a try.

The reported problem was solved by this patch. Thank you.
Please add reported and tested by tags.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

>
> Regards,
>
> Tony
>
> 8< --------------------------
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1459,6 +1459,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>                    SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>         SYSC_QUIRK("tptc", 0, 0, -ENODEV, -ENODEV, 0x40007c00, 0xffffffff,
>                    SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
> +       SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff,
> +                  SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>         SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff,
>                    SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>         SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff,
> @@ -1524,7 +1526,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>         SYSC_QUIRK("prcm", 0, 0, -ENODEV, -ENODEV, 0x40000400, 0xffffffff, 0),
>         SYSC_QUIRK("rfbi", 0x4832a800, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
>         SYSC_QUIRK("rfbi", 0x58002000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
> -       SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff, 0),
>         SYSC_QUIRK("scm", 0, 0, 0x10, -ENODEV, 0x40000900, 0xffffffff, 0),
>         SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4e8b0100, 0xffffffff, 0),
>         SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4f000100, 0xffffffff, 0),
> --
> 2.31.1


Tested full log,
https://lkft.validation.linaro.org/scheduler/job/2641881#L1940

- Naresh
