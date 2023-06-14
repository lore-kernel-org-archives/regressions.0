Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D42CA7
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 19:08:50 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1a5229df1f2so5175754fac.3
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686769730; x=1689361730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErPDVCSBpPJlYZGqC1SD/e+jlrE1qnWfALaiFCF/cEk=;
        b=jmbi/A02sAgtAEjnexDwofutI7SYsNKZb9DJ0918C84hfbYX6Kv2CnynHp7r9XGnlN
         Cp8ZWWLwUdRTJFukEXwkeDOBMoNk3CTaEhN7ljsU9elXqeq1Z3RUSKYBM6GZo/WiI8KT
         oPOMyym6zWHkxmTB3MQ07oxWD7PeJrvq0kvWw8aGJL8XSPf+dk5f+gFT67il+bzXfAN2
         6dyi2TlnIq0Le4Z+DiAPf+P/T4s3RoflN+csQzJAHSNigY1Vh+g2sdvQ9cTB2g73o86y
         dEVSMHa3qXDAuMKstEcmSUZb/SA6tSztZN0LSg42YapskHGdFXw2quO5rHkKRaWjd8nV
         v5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686769730; x=1689361730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErPDVCSBpPJlYZGqC1SD/e+jlrE1qnWfALaiFCF/cEk=;
        b=RpLa3QkXZQtTWZne9RlLSjVpzOo1XoHLh2ZTY21I6pGPrMnvLqQD7KznJOeSYJksHK
         BUXPz4zx5FviD8XWkWaI0Lc1ZiJH/1Jbi88sCjHdBdyM+VUM4f1LqscquYAO82vAl421
         IpCHmXFurse34FNU+5JdFsn6EgA/JOMJFNPzo9+ilpZObDjLb0M312SFN9m7IwZh5c+g
         g4jQLjnBUVe3UXMJ58psGfFcFazUcSMKtXsWaIRVdzaf7DUwWI3+bf1A/SVdekm1tGuY
         VGf+nXFDbG1JJt/6soEcEjzWYhZLzNn6/LABiG4L5LMAXNzTD91RACyozBzAlBo0zt8c
         LsoQ==
X-Gm-Message-State: AC+VfDwwJsG0+3OOWCeXeAI8XnCK1FSIHAQEPulgXirbs4MR8487RMJR
	wY41aytEejtoGtLbbMaT/klLDq87YXpydLPPHXSzTg==
X-Google-Smtp-Source: ACHHUZ7Jlx1MnAmIR2pE8OVZOOzZ43InmF1UHvxki4FXW/lgM0L0ew4VCWjHbEtlNlYpJ3qLkwuOtXyLLHY4KD09mf4=
X-Received: by 2002:a05:6870:8447:b0:19a:ce25:6d06 with SMTP id
 n7-20020a056870844700b0019ace256d06mr10445359oak.56.1686769729782; Wed, 14
 Jun 2023 12:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
In-Reply-To: <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 15 Jun 2023 00:38:13 +0530
Message-ID: <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
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

On Thu, 15 Jun 2023 at 00:17, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/06/2023 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 02.06.23 18:12, Amit Pundir wrote:
> >> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> >> list to workaround a boot regression uncovered by the upstream
> >> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> >> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
> >>
> >> Without this fix DB845c fail to boot at times because one of the
> >> lvs1 or lvs2 regulators fail to turn ON in time.
> >
> > /me waves friendly
> >
> > FWIW, as it's not obvious: this...
> >
> >> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
> >
> > ...is a report about a regression. One that we could still solve before
> > 6.4 is out. One I'll likely will point Linus to, unless a fix comes into
> > sight.
> >
> > When I noticed the reluctant replies to this patch I earlier today asked
> > in the thread with the report what the plan forward was:
> > https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com/
> >
> > Dough there replied:
> >
> > ```
> > Of the two proposals made (the revert vs. the reordering of the dts),
> > the reordering of the dts seems better. It only affects the one buggy
> > board (rather than preventing us to move to async probe for everyone)
> > and it also has a chance of actually fixing something (changing the
> > order that regulators probe in rpmh-regulator might legitimately work
> > around the problem). That being said, just like the revert the dts
> > reordering is still just papering over the problem and is fragile /
> > not guaranteed to work forever.
> > ```
> >
> > Papering over obviously is not good, but has anyone a better idea to fix
> > this? Or is "not fixing" for some reason an viable option here?
> >
>
> I understand there is a regression, although kernel is not mainline
> (hash df7443a96851 is unknown) and the only solutions were papering the
> problem. Reverting commit is a temporary workaround. Moving nodes in DTS
> is not acceptable because it hides actual problem and only solves this
> one particular observed problem, while actual issue is still there. It
> would be nice to be able to reproduce it on real mainline with normal
> operating system (not AOSP) - with ramdiks/without/whatever. So far no
> one did it, right?

No, I did not try non-AOSP system yet. I'll try it tomorrow, if that
helps. With mainline hash.

Regards,
Amit Pundir
