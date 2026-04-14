Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A836E477
	for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 06:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148645; cv=pass; b=MPPFgLHXmF5U45wz4QRxvGC9Aeb0hNAh1BLxrv6GYtUY018Qq7mcJNVX6UPuLIwaafI6qR+GwYhyVzi14U0e6cBC6nA/RSdLQ06U6khve6QLnlF6douM/6Q7rxF/TRd92Ahp5ErRiT0yrmbjAu1bj17EGgjOAx/0O5+ePzlvq0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148645; c=relaxed/simple;
	bh=6AYlwuiSl7sAbEfuNHnNOQJCIWxT7DJEDSiRqwD5ROk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOwAtKyh3SPEcoIDqA6wMYX7dyKEKrpigD7kNI0ZFZMJzOkqDl8+JK8mxUXyH4jlysFebMH7bNYlIPnfaSWdTW638vWj1xs5Khm4JviydbjeJJFgFTGBhJLMBKK3uvBdGt019wI7nEaHgk90Kfc9mIJOc95igBqyQerODSmnfeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUwyh1YL; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUwyh1YL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c76b95e652bso2261099a12.3
        for <regressions@lists.linux.dev>; Mon, 13 Apr 2026 23:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776148644; cv=none;
        d=google.com; s=arc-20240605;
        b=AYZjw78Rd+eoOHLRmW0xVN/otIvmyO4KZRjEgkCdthHD2wBLY2ROCVBvADMuDx2WIj
         xTkVuh0loKSRbanKovC9HvI5GVEsnUW4JF2EsqTF9kFK54/7wVaUOmWc6u3T1znyBEAi
         xWP+wJeXehXCUf/8aPeEg8SHeQqbFwrVxZl76cS/FRdeiZupbOuZ6kLsASmtEN57kOQ6
         FwOELkUJ5z6J29wgiygl645vgQzttXo2UkP+hhCXkx3k7zLNbrzJBDKl0jm9s/VfM06x
         QPCnnIDA8nRNM9AtRxt7sNS/yLcKwPuRZbQkAERLn7Gg7HY6hDqeYHo5ntUvLmBfJ6qU
         IYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=insLynn11+1MMlEVZgdZja3tQdpQK7VuHFjY0dKWpWQ=;
        fh=8eA0T6i4qpcnfdEl790t6uqeieoGdmrYNoRZB5iToNk=;
        b=SRDQMInghzgnuHnOrPMg/XvBsaoRzk+vUDOJS/VROGzLycXepkUR0YQlvozK+OBFNQ
         h75Hg2W6eVNpqHgtNpYTtjLCmk7P9GFYGraUnf5gqfehte0o7YuG3MAzj2Mye1fXlJg8
         hBBd/sTKsldrMtlBgVlDVEtDVc61jHrzxteeyUMVR7BaexSt/SVpPI3rR0D2Px3q3DUt
         JkC/1UG3O2doeyJmreLQjz8OE+isn0om4Pp5XCWEt0TPIPAZEqOiZ1Q+02+lj+I1FIs0
         naVu+S15ZS/D9QfTqIhPuotohot88KpokszdJ8JFpKlCat+RJ02C9WmTsvA4SXD2rCVI
         sGaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776148644; x=1776753444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=insLynn11+1MMlEVZgdZja3tQdpQK7VuHFjY0dKWpWQ=;
        b=KUwyh1YLsFhtnXxV00/uWJkT/NZe4Y0klBcWyjIKeIGtfSBwrVV1y4CNSIORDpFLI5
         KPt3QtmeLr2amsK6CxGYqm4PiQp6kUOy5xpwb6mEsa6vpCMar9px+OUre00xYywpxVm9
         3FaFwsaG/yo/MafhUssUX/+JvVL+JA9B5IxHj0uc1meEoR8xGJOWlLXkL0oR4yP2Dc7V
         rfOrVYonu3m6tfe8yQf1ZpN10dAhsW4Lv6mfRGC9KAoHXwcU3jK0B30+DStbgVnxsjDB
         7J08qaZ2FeMbF7Ds1c9NZUauUugbMW4NQARpI6UtPQSx78rZtqj9TZFRNWLloObymAP6
         sCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148644; x=1776753444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=insLynn11+1MMlEVZgdZja3tQdpQK7VuHFjY0dKWpWQ=;
        b=p0i/8hOI+UoaaK3laIwrgEGewoBF+LLycy1nmi4xZH0o1BWfbeBfFLMvcdq5ZM4wv4
         BForLMxBAj0jcjiImL7Mf6QegNRbl5yVk2XQ5BwuUbkeXdZkweiLCbGb982qoMmylgmB
         BqY42fbHltujHjwOC+yJwkjZE8998rFicNo4nOGgR0wahuk4SVo3JXeZhggyKHsFjPG9
         qDTA4CUUKsxBZKpU7b2oJ4dwT/xpgZmCfGQ8hOCgAjKDYtqhlXQ6f8mDqtKqP68Tc9v2
         zknvGZoYppHLVHd6WYgnhJ6rIkVDKOixwUz6m0xiTspg63tw5gh+rlotVp3eMhBlaT7W
         EvXg==
X-Forwarded-Encrypted: i=1; AFNElJ9FQ6h1ELxx43JRmU+4DcpHGqGeDoxHyUk8f6Gu13PUxbda4r0AfpnvD3LDc4fDybxGjS1FI8nEVeg3Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF6mnp6BZeHKvM/XodhaaKe30aNVXkBRL31dTr0+YmImLf8XAC
	I+hnoBaQvu5b4Bp/k7YGBngoJp/aQMNY/L+buLwVFfMZcEh6w7ctYvSJhZMfkHIPzqUmJf4xbXW
	NSEATTsSByFiP7u8QTDtbkhGatHgLZwk=
X-Gm-Gg: AeBDieuDJd0R30cwVn1cU226eS4Ch+52d4XXgGYHWI6ologV4e6Sh4Ofc0edwWs5bIH
	DPZNZbzm3+2GzFe+l+oktLrq5oxUPbHG0+TU2LFvUTPqQtecyFxBwp/RcdCD6FwPIBkwcnmhH4S
	3yRFw5MSsprpC1slLcXUaaRlRoju/2yUbyYzHljJ5wWEYXdsBvlGTuNCl+Y9vqvBKDGV3QE40Wo
	7JVd8hlo+sMwCLXaoEIfnuZCjeKc5Vi96utSQkzL35wsXokqllUjoehE9o1kQjoSeiTjhLg4153
	R+z6V5+/TsWfke+s66m70N6fpYDtIeGcfx/ubg==
X-Received: by 2002:a17:902:da82:b0:2b4:6470:75f4 with SMTP id
 d9443c01a7336-2b4647078femr47230175ad.28.1776148643730; Mon, 13 Apr 2026
 23:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
 <87a4wgrxil.wl-tiwai@suse.de> <CAC88DfvjQvZvdvGdZ00woMymE2tUWk=2Dbqi3EzuzSHxGjEnzw@mail.gmail.com>
 <871phsrsnf.wl-tiwai@suse.de> <f59a70ca796b4d09822f514e7f25ac5c@realtek.com>
In-Reply-To: <f59a70ca796b4d09822f514e7f25ac5c@realtek.com>
From: =?UTF-8?B?SsOpcsOpbXkgQmV0aG1vbnQ=?= <jeremy.bethmont@gmail.com>
Date: Tue, 14 Apr 2026 13:37:11 +0700
X-Gm-Features: AQROBzC6xEqhYrpdRvJxGXEJ7XxoE0pMXS_rqFAWmaM1oAaQaL4Fxq0dujM5SyI
Message-ID: <CAC88DftEBEEEvODGUZzkry+kgAm=SfH=PAsxwu+SABMBMRMs=Q@mail.gmail.com>
Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287)
 after commit d2e01e0c5e94
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"regressions@leemhuis.info" <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kailang,

Thank you for the patch. However, I believe you may have attached the
wrong file by mistake.

The attached patch ("0000-x1-gen12-speaker.patch") is dated November
12, 2024. Its commit message mentions fixing an issue with older BIOS
versions.

Could you please double-check?

Best regards,
Jeremy

On Mon, 13 Apr 2026 at 16:16, Kailang <kailang@realtek.com> wrote:
>
> Hi Jeremy,
>
> You can test attach patch.
>
> BR,
> Kailang
>
> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, March 10, 2026 4:33 PM
> To: J=C3=A9r=C3=A9my Bethmont <jeremy.bethmont@gmail.com>
> Cc: Kailang <kailang@realtek.com>; alsa-devel@alsa-project.org; regressio=
ns@lists.linux.dev; regressions@leemhuis.info
> Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC=
287) after commit d2e01e0c5e94
>
>
> External mail : This email originated from outside the organization. Do n=
ot reply, click links, or open attachments unless you recognize the sender =
and know the content is safe.
>
>
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
> I guess dropping the alc_process_coef_fw(codec, en_coefs) call at closing=
 would fix your problem while keeping the one at open.
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
> > > > I am reporting an audio regression introduced in kernel 6.18.13 on
> > > > the Lenovo ThinkPad X1 Carbon Gen 12 (Meteor Lake, Realtek ALC287
> > > > codec,
> > > > SSID: 0x17aa231e).
> > > >
> > > > Since this update, the laptop emits a short, noticeable hardware
> > > > pop/blip from the speakers exactly when an audio stream closes and
> > > > the PCM state suspends. It happens consistently a few seconds
> > > > after playback finishes (e.g., after a system notification or
> > > > terminal bell).
> > > >
> > > > I have tracked the regression down to the following commit:
> > > > d2e01e0c5e947da0b5005ca89efa82baeb232adc ("ALSA: hda/realtek -
> > > > fixed speaker no sound")
> > > >
> > > > #regzbot introduced: d2e01e0c5e947da0b5005ca89efa82baeb232adc
> > > >
> > > > Root cause analysis:
> > > > The commit modifies the `alc287_alc1318_playback_pcm_hook`
> > > > function, adding raw COEF writes to disable/enable AMP silence
> > > > detection on HDA_GEN_PCM_ACT_OPEN and HDA_GEN_PCM_ACT_CLOSE.
> > > >
> > > > Because `alc287_alc1318_playback_pcm_hook` is a shared hook used
> > > > by multiple Lenovo ALC287/ALC1318 devices, these unconditional
> > > > `WRITE_COEF` instructions are being sent to hardware that does not
> > > > need the silence detection fix. On the X1 Carbon Gen 12, executing
> > > > `alc_process_coef_fw(codec, en_coefs)` upon stream close triggers
> > > > an immediate electrical pop. Monitoring with `pw-mon` confirms the
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
> > > I guess the bug might not be specific to your device but happening
> > > in general with all matching ones.  As a workaround for such a pop
> > > noise, we often need to reorder verbs or put some delay between verbs=
.
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
