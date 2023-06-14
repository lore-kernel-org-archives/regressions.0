Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29964101DD
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 19:44:34 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f76a223ca5so1210453e87.3
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686771872; x=1689363872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqKOuOVAaHAwexq58/iM1zHwSap285S9u8+TVdomW4o=;
        b=AtUf/w9gYSW3nHlODTyEEUAz1PRdwjyM3KNMBtTaMVoJYKxhvqXMOmCkAGeEjT+m0M
         cwPanOW1HXi5sJSGIgZrFKpxQmHvvxLQmVlGVclZbF28dSd6fegzP37ECDEv+nwnAhTN
         sxg8NDFpH354nnqmCJe/ZnG5OHeXF/n1gbFdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686771872; x=1689363872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqKOuOVAaHAwexq58/iM1zHwSap285S9u8+TVdomW4o=;
        b=gsqLc2yokyEZzXnqD0Zm5ijE3vvV02HfNjuBhhxsHWgS/6wTLFrk/V+jAKNFMxvQgE
         zQ2z5RUXAR/TyPDtCq7caTtt9vmh/0Jv0RE8flziC1Cke/LZfrAkZrm6jflW5M1CppSh
         ufvuh9snghvN72wpxF3ex0WpEQ9wBwR3onOck0n8fLMAeRoxqE3yWUaauwxznOsM7yfM
         Q0BUFvc8B7jnedV5ntK+EoLnDPfPNCmFzBODhcXD1YVK9xqEussRBfIzMuoKtJCuXLWB
         vIrZD3+iuFUIow/9dj7qRVamySukrhgGwXwbgmOklHfDpecGVtTczpJghD1zbs0XtmRr
         i7uw==
X-Gm-Message-State: AC+VfDye9xRwtKJoESNMma8mtQjms16M+5cfVppB5IGgrQhGO1TIUV60
	2LRbxBzkW/nyaTn9EKp0NNfYDptXZKEDBp5J5Dl+iWqu
X-Google-Smtp-Source: ACHHUZ5E0dcoRZyXZ5H335RMsyfvCMizKHcNOKh3CyKV5SmU2PyCXIL9N/BhzCjQ+dQKfaUw0cOHqQ==
X-Received: by 2002:a19:5619:0:b0:4f1:4d66:ac96 with SMTP id k25-20020a195619000000b004f14d66ac96mr8469935lfb.19.1686771871912;
        Wed, 14 Jun 2023 12:44:31 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090668c900b0098242730348sm2290950ejr.72.2023.06.14.12.44.28
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 12:44:29 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-513ea2990b8so2297a12.0
        for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 12:44:28 -0700 (PDT)
X-Received: by 2002:a50:d09c:0:b0:51a:1f15:9ddc with SMTP id
 v28-20020a50d09c000000b0051a1f159ddcmr13160edd.6.1686771868354; Wed, 14 Jun
 2023 12:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
In-Reply-To: <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 12:44:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xt2KYGY15+f+nHxkzKnwhHzw1A7=o+5kgCDWvHDv0DNg@mail.gmail.com>
Message-ID: <CAD=FV=Xt2KYGY15+f+nHxkzKnwhHzw1A7=o+5kgCDWvHDv0DNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Amit Pundir <amit.pundir@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 14, 2023 at 11:47=E2=80=AFAM Krzysztof Kozlowski
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
> >> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGr=
LZsw5edb-NtRJRw@mail.gmail.com/
> >
> > ...is a report about a regression. One that we could still solve before
> > 6.4 is out. One I'll likely will point Linus to, unless a fix comes int=
o
> > sight.
> >
> > When I noticed the reluctant replies to this patch I earlier today aske=
d
> > in the thread with the report what the plan forward was:
> > https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1=
hUX9DUMkkxdg@mail.gmail.com/
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
> > Papering over obviously is not good, but has anyone a better idea to fi=
x
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

The worry I have about the revert here is that it will never be able
to be undone and that doesn't seem great long term. I'm all for a
temporary revert to fix a problem while the root cause is understood,
but in this case I have a hard time believing that we'll make more
progress towards a root cause once the revert lands. All the
investigation we've done so far seems to indicate that the revert only
fixes the problem by luck...

I completely agree that moving the nodes in the DTS is a hack and just
hides the problem. However, it also at least limits the workaround to
the one board showing the problem and doesn't mean we're stuck with
synchronous probe for rpmh-regulator for all eternity because nobody
can understand this timing issue on db845c.

-Doug
