Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978043E49C
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135672; cv=pass; b=B2d+WY06KhxA+SOduEdz0UD0AcOfJlu/quiwZK7L1ARqASW0e/XKOTKyuHLom8XvpZjHee6OjqIKM31ni4/qja4NSxS7DQDDfHmxjLum+4C766jO2jiZNCkliVssBAOjp1cCXBHMYqCGgRRWyees866Ugqks5Pgi5xxS3GwrjgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135672; c=relaxed/simple;
	bh=42EEnIo48m+E4ZUcaEDasfHmBleywoOljOZE8Z+sEMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDgAADLxZvKlCcLpE28vDDztXEK57fTTXzMswelmut3obnaMwJsv7zxmTYEuBxgXzfycvlVXncr/kR7pdsfj0o9zbPdLIx+1EE/KicHsmTgg+KeSQxcZ3izwrrT1UGAF7xdMelspROE0edKCz9HdII4PpDXnHNsee+nivwnG8sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhDv6nT1; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhDv6nT1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82418b0178cso6753392b3a.1
        for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 02:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773135669; cv=none;
        d=google.com; s=arc-20240605;
        b=dqiDcH2TDV+jhZb88QpQdnZeIcWPU4+DGdFnk0SVZHYJwI4+Dz7I/5pT66HHTEPBBj
         cd3AW+f4GaH/CkAlTzo4tbCvYZzFi3hUV5OqfuyuKe3lWU0psdfN1UaDQcdPw8WvqwwE
         sMqCkpDj4ul7U4DjgEKZKJZ2PV9BZ0IugQakjnfVw7nWqL1xwj8S/xnp8HV+M2KRjP5W
         wcFdUfD1kfO5y0PgG2pZLOrJqOUMXiW+jPBX9d6CJYJGSimK5H3tvbdl51wOZRlvIgy6
         Ha1VaA53lil5FDaEYwb4cdlZXXcEdA7TM8TWX7Yc+Y1Ic5rrBunr9/vkOdvBhf2Z9Qgu
         Tgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Too0WbBvqqA2xsVan1ZK/sbxWcWO3tAja3epVtAoaes=;
        fh=SqjmxUglgV46IdHEXPZpgdd0kHZ7sEHJIGvffm9IJqU=;
        b=i9T4P+tZOeW/WXlMDI1YZLa2JLNMxpXSfpcoF3ne6LHglwBKadimgnA/Ptrl+8l3TO
         MbX+Y0rqc+bavnHF/uQ6ODisqr3RotnGdvLO2h75WOhJ+dmWP5kAv71oq0vqGy/EHClI
         cvoKBc6DB+esGur40D+haRwRqnPhvI7FWW1LJ0E4vdeifZEFFXvzI2AI+1a+vC4ttL4K
         gaqIkqsaAW5pUe59ft5tlwPN4YLszscnyDYmKJ1P/1nRsk+/e3bU4M7c/GTgqec3+vB6
         vE1rnb/dU1oIVkqBz1zsBobOPZlrN9sT9ltww1WGUHexwYwJEqXFXryTOBRG1QKTNM0I
         cIug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773135669; x=1773740469; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Too0WbBvqqA2xsVan1ZK/sbxWcWO3tAja3epVtAoaes=;
        b=jhDv6nT1QQDkflrzzZUChNv4xFa+UyjrNd2H29E8AdIZJEF0Tsj+jGkv7/S0m+e66+
         rXDVWXEmVbDledwi4nr5AiFI5cWQI+erKei33gouu9oGRNIbHpVkRDPqn9aew7iu/tfh
         5A7uHr6mrPJEAP3YQ4cz/DyltDjfAqDeDjsxx8yXRyz61+UVSX/gM2gO40Zkm0z+gjLH
         RNyo48dKOW8b2BgtvQMjJAFCkkNFl78Rf3x8JQPFwFL6R5E0BEhJZbodAVMe8uVHdU78
         Lvg0f5K428gWb06XlHuW5yfGsq9C+V3oGf/QO5/BDOio2ogYFmCC7E6qN9Dz245cme5m
         7Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135669; x=1773740469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Too0WbBvqqA2xsVan1ZK/sbxWcWO3tAja3epVtAoaes=;
        b=Yz9tq8eIRoVlBRL0x3DS6fSfNYneZjCV9Ueo9SUgRnF+4RhDxsKL1mPqvyCWS255Hc
         py7r6aXiM3pRLMWr8qXep3YykMr2xyyga9HViEd/Z61FSIcL7RpC6abacJJmBlK3tyJD
         fJn8ZZLa+sB/kuCKa1UWvnC1/FyqrxBpuXo0ZcPBCFqwZiLutDnWbAAXJe4TTYRWLNRp
         Hpa7juT+HCOpCypGOYNwsngf0WFJ1ZWDWdtWHE1Tze98WojMr7Jeb0pIGGiUjOuS6+Gb
         Xaq/NnLWZA9fdPOvU8CUXwrL2pVHcjulyxBoDrNGOsd2rATrZRJ5KthJQJy9+UIbmCmH
         sZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCULbQ7CUrQyeO+FZ5MfE4CjlV0qMlwlKJjd//lX/1zy4/MJq2IEuCV36j5Bl3ZUNmuChXrLd83oeyMLaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1OscyaChTZ4TzVGKgEoIj88kR8yU01EC86Qje/BnEBGSS1cSN
	SHpjivreBQ6KowurzoIrBcqXP6LOJH8K/DuAaQliAF3y8bK/hbo8lM/rWItJSunQ5yPPZUGxn0B
	c8j/jvNYJAokt3aZdzLwceV7hRTGF9jQ=
X-Gm-Gg: ATEYQzycdXp4j2u3HinqXYvX3oFa6CccjwvTq94UQro55MxMhsX51sNf04M3mj8k2qf
	zWGFjTxShnGpWiIG+EQnY5NaSX3iZhYtfzOwyi5kEWIgSfy8HaHtiFwQsxCFRJ0SdLTIWm0G/jb
	XyWSLIS4X4xXWycYgIE5Vfv+KEynwYGiRkgk2zOnO/I5+HCAB0tE4wW461OjQDsVtPTrl5joEKR
	MI/pR/i4z5B/UG0E2ZVyQSyOqcSx1gDDMQv3ew/jdMYYqsZnG060ewYNuufuYOvx7KDC3mm/i8G
	nbsG4CnRapT0ss6KDaix6G4DH5Zw/g5Pq10TLcJQ0O4EfaP+4A==
X-Received: by 2002:a05:6a00:2789:b0:823:9e5:855e with SMTP id
 d2e1a72fcca58-829a2b460c1mr12731502b3a.0.1773135668517; Tue, 10 Mar 2026
 02:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
 <87a4wgrxil.wl-tiwai@suse.de> <CAC88DfvjQvZvdvGdZ00woMymE2tUWk=2Dbqi3EzuzSHxGjEnzw@mail.gmail.com>
 <871phsrsnf.wl-tiwai@suse.de>
In-Reply-To: <871phsrsnf.wl-tiwai@suse.de>
From: =?UTF-8?B?SsOpcsOpbXkgQmV0aG1vbnQ=?= <jeremy.bethmont@gmail.com>
Date: Tue, 10 Mar 2026 16:40:56 +0700
X-Gm-Features: AaiRm53XcUwyb-5gh4G-OUgUJCFpiE_MjC72GceFp0Xp0OciyYPxLtNoIGmtRic
Message-ID: <CAC88Dfv9S+BVJAZeZ+rfyRQHB4C05mSNSHyLh+DTvUAyGOCX=g@mail.gmail.com>
Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287)
 after commit d2e01e0c5e94
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

To answer your question: no, if I disable runtime PM (or prevent the
audio server from suspending the sink), the pop noise does not appear
at all.

The pop is completely eliminated as long as the device remains awake.
It strictly occurs at the exact moment the audio stream closes and the
device drops into a suspended state.

Best regards,
Jeremy

On Tue, 10 Mar 2026 at 15:32, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 10 Mar 2026 09:24:38 +0100,
> J=C3=A9r=C3=A9my Bethmont wrote:
> >
> > Hi Takashi,
> >
> > Thank you for looking into this so quickly.
> >
> > As requested, I have attached the output of `alsa-info.sh --no-upload`
> > from my machine.
> >
> > Please let me know if you have a proposed patch you would like me to
> > test. I am happy to build it and verify if it resolves the popping on
> > my hardware.
>
> I guess dropping the alc_process_coef_fw(codec, en_coefs) call at
> closing would fix your problem while keeping the one at open.
> But I'm not sure about any side-effect by that.
> Kailang, could you check this?
>
> BTW, when you disable runtime PM, does the pop noise still appears?
>
>
> thanks,
>
> Takashi
>
> >
> > Best regards,
> > Jeremy
> >
> > On Tue, 10 Mar 2026 at 13:47, Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Tue, 10 Mar 2026 01:01:11 +0100,
> > > J=C3=A9r=C3=A9my Bethmont wrote:
> > > >
> > > > Hi Takashi, Kailang,
> > > >
> > > > I am reporting an audio regression introduced in kernel 6.18.13 on =
the
> > > > Lenovo ThinkPad X1 Carbon Gen 12 (Meteor Lake, Realtek ALC287 codec=
,
> > > > SSID: 0x17aa231e).
> > > >
> > > > Since this update, the laptop emits a short, noticeable hardware
> > > > pop/blip from the speakers exactly when an audio stream closes and =
the
> > > > PCM state suspends. It happens consistently a few seconds after
> > > > playback finishes (e.g., after a system notification or terminal
> > > > bell).
> > > >
> > > > I have tracked the regression down to the following commit:
> > > > d2e01e0c5e947da0b5005ca89efa82baeb232adc ("ALSA: hda/realtek - fixe=
d
> > > > speaker no sound")
> > > >
> > > > #regzbot introduced: d2e01e0c5e947da0b5005ca89efa82baeb232adc
> > > >
> > > > Root cause analysis:
> > > > The commit modifies the `alc287_alc1318_playback_pcm_hook` function=
,
> > > > adding raw COEF writes to disable/enable AMP silence detection on
> > > > HDA_GEN_PCM_ACT_OPEN and HDA_GEN_PCM_ACT_CLOSE.
> > > >
> > > > Because `alc287_alc1318_playback_pcm_hook` is a shared hook used by
> > > > multiple Lenovo ALC287/ALC1318 devices, these unconditional
> > > > `WRITE_COEF` instructions are being sent to hardware that does not
> > > > need the silence detection fix. On the X1 Carbon Gen 12, executing
> > > > `alc_process_coef_fw(codec, en_coefs)` upon stream close triggers a=
n
> > > > immediate electrical pop. Monitoring with `pw-mon` confirms the
> > > > hardware pop coincides perfectly with the monitor_FR / monitor_FL
> > > > ports going idle/suspended.
> > > >
> > > > Proposed solution:
> > > > Could we revert this commit, or alternatively, wrap these specific
> > > > silence-detection COEF writes in a targeted `ALC287_FIXUP` quirk
> > > > matched via SSID/DMI, rather than executing them globally in the
> > > > shared playback hook?
> > >
> > > Could you give alsa-info.sh output?  Run the script with --no-upload
> > > option and attach the output.
> > >
> > > I guess the bug might not be specific to your device but happening in
> > > general with all matching ones.  As a workaround for such a pop noise=
,
> > > we often need to reorder verbs or put some delay between verbs.
> > >
> > >
> > > Takashi
> >
> >
> >
> > --
> > J=C3=A9r=C3=A9my Bethmont
> >



--=20
J=C3=A9r=C3=A9my Bethmont
