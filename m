Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E212D210F
	for <regressions@lists.linux.dev>; Mon, 19 Jun 2023 07:06:47 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-630038f13daso18972676d6.3
        for <regressions@lists.linux.dev>; Mon, 19 Jun 2023 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687158406; x=1689750406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcTIqLIrua8hUl7qFCty01+sqrygibJSr+cgV/uyuBw=;
        b=dhuj1G9ObbXiG8050tPrdfQogQjjGBCjgGWWCY2x530e8Ay1zXlUQ8DDxjIie1LtKc
         Jv+oXz31qvZBIu+QG41NtOlvcnswKyey1TP0JnQmAUD51XyVGUrZZ1RSlhFR/wpC5xSR
         +RtYIDqCye0KoMcoA5cvInToWee+J21nju4E8xZW5nvNVJp7isHcXS0+Ypm7J+tClf/r
         l7V20IXfwOqDmiXeHvNrPd6LHlBa0grI0peVs4d042H5ufvVK5CCnf3X/tmWUsx5FTFk
         ygdW2kEqoa/pwu9BLcf2y2MNVRCToHYtCX1wHO9jCSc8tpG3ptVVNFaYJ/cSsBftzdkd
         dfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687158406; x=1689750406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcTIqLIrua8hUl7qFCty01+sqrygibJSr+cgV/uyuBw=;
        b=ONtFZEjiuPfte8QzSsKNQaz3QqhdWjY4U5tzRrM1nE31Xbuu+ImEsyMjiWHe/+0mdX
         BKUq9qpSFWftlfkOgs1FGPDp1hgbhxzaHIbepwK26Y2Hf0rtzdMAo8R2XF2aiim32/0m
         +JXklb9FMl1WNdR5WpIbhid3IHu81mVVPYpfFP7Ti/CNvlnAfsxtULkIbM0CTWqprONG
         MrNPI3Yf6xlj/YzbFafu/vopibTf2dllOTfhQjvhWac4shfQmKsRlBEujwRnaNP0yPsL
         gYX9KQ/F2WnnWM5ve6XOphUbJnsMqUNv5VKoe3ww0Us6INeLeM67UvXlTFurGzCA7YM0
         yMqg==
X-Gm-Message-State: AC+VfDwb+QJGhRNTJ9wjpA+uwVDcV5fNoNF55Y9LJP5L6mXZOrg16lz4
	bDRyckRT2lR/FPzjtDz3Uw8hcU0gA1GldovbtOkXIA==
X-Google-Smtp-Source: ACHHUZ7ARWKm7YbwsnITsOzf+lnhod/hZznhV/zMYXwxum5FRhi4/yDyXvrkpBtio2s1NxOqSjn8qkY0L4ih+hjaw4Y=
X-Received: by 2002:a05:6214:2302:b0:628:74d6:ba89 with SMTP id
 gc2-20020a056214230200b0062874d6ba89mr9134579qvb.60.1687158406629; Mon, 19
 Jun 2023 00:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
 <CAMi1Hd0=KV7k82ARadF45nqX+Cv6zPLCxfDvOyAPeXiFd8jpVA@mail.gmail.com>
 <0ec6c988-d678-c96c-a7a2-af38e6701404@linaro.org> <CAMi1Hd33_Ccxkf9C5_QBO3tvOZcGnYh+_CKcACUtoY2qAuOzRA@mail.gmail.com>
 <12d6b687-5e5a-bd7c-ff5c-007a74753edb@linaro.org> <CAMi1Hd2H2aA6EYp5-46dWe0eu0_hAWUumoQbnk7WR0q9bhppog@mail.gmail.com>
 <fbe5138f-fe97-11ee-a14a-4bb447c0972a@linaro.org>
In-Reply-To: <fbe5138f-fe97-11ee-a14a-4bb447c0972a@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Mon, 19 Jun 2023 12:36:10 +0530
Message-ID: <CAMi1Hd2dO9WSfRQxZLhiyTjFrC_mX6ej9Q=u=Rd1XgRd5AU=jA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Mark Brown <broonie@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Jun 2023 at 12:51, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/06/2023 19:09, Amit Pundir wrote:
> > Hi,
> >
> > On Fri, 16 Jun 2023 at 13:57, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >>
> >> So you have interconnect as module - this is not a supported setup. It
> >> might work with if all the modules are loaded very early or might not.
> >> Pinctrl is another driver which should be built-in.
> >>
> >> With your defconfig I see regular issue - console and system dies
> >> because of lack of interconnects, most likely. I don't see your WARNs -
> >> I just see usual hang.
> >>
> >> See:
> >> https://lore.kernel.org/all/20221021032702.1340963-1-krzysztof.kozlowski@linaro.org/
> >>
> >> If you want them to really be modules, then you need to fix all the
> >> dependencies (SOFTDEP?), probe ordering glitches. It's not a problem of
> >> DTS. Just because something can be built as module, does not mean it
> >> will work. We don't test it, we don't work with them as modules.
> >
> > I do somewhat agree with most of your arguments but not this one. If a
> > driver doesn't work as a module then it shouldn't be allowed to build
> > as a module.
>
> Of course you are right. That's why I am pushing against blindly adding
> "tristate" by everyone working on GKI. Because such folks like to make
> them tristate, but not actually test it or work on issues later.
>
> That's exactly the case from Google and Samsung patches here:
> https://lore.kernel.org/all/ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com/
> and in previous submissions.
>
> > I took a quick look at the history of the interconnect
> > driver and it is tristate from the beginning. And not converted to a
> > modular build later-on like some of the other drivers to support GKI.
>
> OK, maybe it was never actually tested. Or maybe some versions were
> working on boards where debug serial does not have interconnect, but new
> chips just followed the pattern without testing?
> >
> >>
> >> It's kind of the same as here:
> >> https://lore.kernel.org/all/ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com/
> >>
> >> I understand that we might have here regression, if these were working
> >> as modules, but I don't think we ever really committed to it. We can as
> >> well make it non-module to solve the regression.
> >
> > Sure. But since v6.4 is around the corner, can we merge this
> > workaround for now, while a proper fix is being worked upon.
>
> DTS workaround? No. I don't agree. Once it is merged it will not be fixed.
>
> I am perfectly fine though with making the interconnect or even rpmh
> regulator bool instead of tristate.

As Doug also mentioned in one of his earlier emails, this workaround
is only limited to one particular board. If I try to change the common
interconnect and/or rpmh driver then it will need ack from other stake
holders as well and I'll most likely get more pushback from that side.

Regards,
Amit Pundir
