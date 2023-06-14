Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3A101EC
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 15:50:34 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9745c5fed21so122146066b.3
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 08:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686757833; x=1689349833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBxZ/WkHsxnx/bLYGuhyu1gVFSm0iBsy0Y9Dj3gZZw4=;
        b=NEaVAZvsmUxO5089H1ZV0XkgUolP0OeUJ4yvT+uqt3lDvKdWHzsVagJ6JpPRppZRf+
         9/TuIH7iTZTbYvw3XLJCgOWdqrxAKBnRgQibU664SEwtw+quua+8xwG5uGHtEm2nyVam
         QeBxpigArSxO1Fx4y7XImJ+/lPpma3h/KWypc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686757833; x=1689349833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBxZ/WkHsxnx/bLYGuhyu1gVFSm0iBsy0Y9Dj3gZZw4=;
        b=ONXWyR2WfjjeYfJHK1zd/JvaomrNLGGXFxk97riInotV34oUTPmoWnAvgDtG2A1Jjz
         OXz+Poy2W3fepKHMB3Xk7sMwMfujnF1LyHfgzelTlYgJwDtyEpvo0KfzY++IFA4cxVQb
         SofLkRlTx/lBGhnxjL18qsBDdL92asc+wS6DtiBNiCPt4zcei5z0MaXhjR012xKnH56t
         8iL/S0IFMmjqOIqubykzaA70O6cviGqgkJpAf+dJv62a7pa1kzuEHbhFSpqOQA6Reuss
         47eym+uyWD79IEAFmsNIGl5puw0t1/apWKMXCfBW2shAtakZ5NzkVaTKycO+ngO4N+GW
         T0fA==
X-Gm-Message-State: AC+VfDz//DTebliproavdzX1JRkUQj0IFJqgb80RFpWQs9NHuTXiZP3f
	IeREzveDpZxiKMH6issLlkPGtYI/b5nQmNyTgK6HyHe9
X-Google-Smtp-Source: ACHHUZ5qp1u0knvXOWsvtP5pScLzAHaDLlTk/RE3gy4VzWgCQ85rMDVIcI7IWINMC0tAr0njJySxYw==
X-Received: by 2002:a17:906:da87:b0:974:1c91:a752 with SMTP id xh7-20020a170906da8700b009741c91a752mr15611027ejb.5.1686757832861;
        Wed, 14 Jun 2023 08:50:32 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id k7-20020a17090627c700b00977da9d4ef9sm8346735ejc.18.2023.06.14.08.50.29
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 08:50:30 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f7e4953107so106375e9.1
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 08:50:29 -0700 (PDT)
X-Received: by 2002:a05:600c:5207:b0:3f1:9a3d:4f7f with SMTP id
 fb7-20020a05600c520700b003f19a3d4f7fmr153672wmb.1.1686757828661; Wed, 14 Jun
 2023 08:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
 <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk> <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
 <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com>
 <bb5c828a-b8c5-40a0-9b67-44e73abcbef0@sirena.org.uk> <CAD=FV=UXOse+yRUmZBUOkfpWXPRKBw2R-+BVzPGcuwwFV_VqQw@mail.gmail.com>
 <84110995-a99b-8b5a-cd34-8430866eb9b1@leemhuis.info>
In-Reply-To: <84110995-a99b-8b5a-cd34-8430866eb9b1@leemhuis.info>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 08:50:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com>
Message-ID: <CAD=FV=V-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Amit Pundir <amit.pundir@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 14, 2023 at 8:37=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 07.06.23 15:47, Doug Anderson wrote:
> >
> > On Wed, Jun 7, 2023 at 6:18=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
> >>
> >> On Tue, Jun 06, 2023 at 04:29:29PM -0700, Doug Anderson wrote:
> >>
> >>> 2. Try adding some delays to some of the regulators with
> >>> "regulator-enable-ramp-delay" and/or "regulator-settling-time-us".
> >>> Without a scope, it'll be tricky to figure out exactly which
> >>> regulators might need delays, but you could at least confirm if the
> >>> "overkill" approach of having all the regulators have some delay
> >>> helps... I guess you could also try putting a big delay for "ldo26".
> >>> If that works, you could try moving it up (again using a bisect style
> >>> approach) to see where the delay matters?
> >>
> >> This is information which should be in the datasheets for the part.
> >
> > I was thinking more of something board-specific, not part specific. In
> > theory with RPMH this is also all supposed to be abstracted out into
> > the firmware code that sets up RPMH which magically takes care of
> > things like this, but it certainly could be wrong.
>
> /me waves friendly
>
> That afaics was the last mail in this thread about a regression caused
> by ad44ac082fd ("regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use
> PROBE_FORCE_SYNCHRONOUS"") from Doug; Amit's attempt to patch it (
> https://lore.kernel.org/lkml/20230602161246.1855448-1-amit.pundir@linaro.=
org/
> ) also wasn't welcomed. Just like his earlier revert attempt
> (https://lore.kernel.org/lkml/20230515145323.1693044-1-amit.pundir@linaro=
.org/
> ).
>
> Does this mean this regression won't be addressed before 6.4 is
> released? Or was there some progress and I just missed it? What should I
> tell Linus in my next report?

Of the two proposals made (the revert vs. the reordering of the dts),
the reordering of the dts seems better. It only affects the one buggy
board (rather than preventing us to move to async probe for everyone)
and it also has a chance of actually fixing something (changing the
order that regulators probe in rpmh-regulator might legitimately work
around the problem). That being said, just like the revert the dts
reordering is still just papering over the problem and is fragile /
not guaranteed to work forever.

-Doug
