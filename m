Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024592E8B81
	for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151427; cv=pass; b=c1n42bQWkVZQuTVAEYajc5R9IpRO+Pil/rmvwVxGTv+Sx887cJS87A+cZyPq4VBpbpVw91DdkuCnjfMPuHJiLgSksVe3P6c5anUABlFOk4Um29ECl+FmLCadG4iap/PgYiDqbTQsy+jMD72MU/WqRzPCnTpKDPOvsC1ywlk6Kcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151427; c=relaxed/simple;
	bh=cyILk8t7InVIOJNZ3XmJnPZ58qdD6YBPdOMJgkFAPVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYnEUvTpnN2Ob8nl6mlSdtogHf0tb9VgjkX4K9az8BbEBTtbMsjp1Fk1bvKgx4pjg/6z283bQ5r95BWPpheuHbb9REV7cmsYIP3IJcW5FcHyK0zOORiH19dVgyJnVrnxvO7UUsa7hRceU1WlpHRJICcaMMW5yCN0fLRjAoX+zeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktY+ZlMH; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktY+ZlMH"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so3713172a12.3
        for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 00:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776151425; cv=none;
        d=google.com; s=arc-20240605;
        b=hzh7ZPM5gl3bZ0ixdEwTHia+/e3GDpk7IwBmF0dQAOE4uI2UiJ1CNQlDMrb8o5pex3
         cxdOm2o4DIFOm01jtOYezT7rqypKd0JgiIITZCRem7FfSBlT06wJvgNHfIfBgONzZSaa
         GELWdW5EiuXXc7tLaQeOjH8PgTYlpZ44L29XdjTsELxFTERTUdxBHABcRT47L8hqyppH
         qfOH75eDJooxz8vkWC1ULPp/mSKINKKHTw0NEXCww2+W1483lUlsNikpA0dsbwkyV7ge
         9cG7i6nQNqSBb9Q99hoh+UQaZ86+Sdgnbv/uqizjcSXQu1yKHKrNrHnBIrGSRHhpmA+N
         WaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNMQ3xS5M00U6S5Ye1ZFAEQmJL8P2236+qc+vTRch98=;
        fh=wvFJ5/h2AUGYAvoZiycceOvOQfcgOV+589TEsCyoJAk=;
        b=IkjQp9IMZ/wi053lp78qiaA2FbGq61XnoBvt7tlD5tY6l9YDZWYbvxYhW47f5GGrjI
         gBpIZ/ppRfL1EiBw1e6spEwAn2Yl4zB+fYvEsR+XaLrUgsQckyV4v8ansdEhDe0w+7ad
         +WNq3Ir9aN27f2xKhwRR59p6NYB+FpaibIyNl0aGycTt4JFPo9As2wtparZAykvpCX4A
         ASANkIarU1++gPUarPuTiB4PANLxWQkDXyioFXjnQqWUmzOp4KZ+aMdIoLfL2FOiTyH5
         4G5tIFLYWVmDf3uWMdgbeIAEuZ3Trm6DAoAdWro6cOtitTgpevz6Gh1mZjDX+QyO73HQ
         4oqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776151425; x=1776756225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNMQ3xS5M00U6S5Ye1ZFAEQmJL8P2236+qc+vTRch98=;
        b=ktY+ZlMH1QoJ7+RZIh3LYhab3YZqGa0JFOQD5zwsOtcf/OWpAfCzv7jMEx7mLuva3O
         OZDwL03NPorVSIbrKXr957mHQvOBOrP6s838okXoLUzQ8abEEoq6U5gSZ+IebETA6JNB
         0tZhmy63K+xLJtBZS4x55g/lLehVVUaBo9RAVxYo+1s1UtAWvqSnK02hyWYg432vCdDe
         Y6X5+JiBQdX0Ifro11/+54U8Bw+NcbSod4QGJgBTljvEi+qnPskDPguwDCvMUTuXgKWa
         OPooZunswz3I4LZ9QohkY391h+cCfTb4QkzccP3zg9KZKrRYi5iZh4m/sed7uLBNC3UI
         w1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776151425; x=1776756225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNMQ3xS5M00U6S5Ye1ZFAEQmJL8P2236+qc+vTRch98=;
        b=PnWUKwhN/PQdP80MIELoRCAOejJP/xlpReBJxwsJ24+jdkMvoQJOiIZUrVGCXzCLn8
         QA0GkF/a96KtoQm8Y6D+oxZerCfIhbqLTpDqgO0iDge85+SLg/xcg+O5EsR/VIhAEbq1
         sqMkQ26lWZPCy7/p/cKBDpdvYJLYzPPYCucjbLGJhSmfBsGeY9BVKJZ/4I5sT0anMufM
         xCHPj/q4EFr+SnaCJWacx/XK2wjlvuEtsc0I6EduQ4jdqw4gfnukR1ovRD87WJMijkhW
         b78LBwJr7IdyKXAbo4ZslsGvEKgLwD6EgmQJ7/ReDcRDhiTw0j32OTLHDVxNqcnL9lkW
         Y4wQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NzrRp3Hbr5i+PPvumzWwOgHpyYz4Lg/wXeVAwd9k4RyHLEWdczNHfK3zUVuK9frqpPRs2t7KhYtk7Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1UM0fv7rhsVszLxHRlf7AitpRCf5tmD4HKPcM4Exq0x/OHw9i
	7La0kVPdPWRun2N4nETcDSWCO+pce0+9uum4BQTOgBn7FxKyW7qz4PcvvIrADmMGH300VJ13a4E
	tdsM03FYE1hE9S9SltjmO9DZLbfEhKOI=
X-Gm-Gg: AeBDiesd9A2LX16PFhyuIO69lg0MxC7eOLKliiJLYYbGuSTr/1armeYxq9Kd2MHAnNe
	GpQBPz5hnKJzNsx/DSC8kfH5OyU5eA+XCL3H4YPdlePRYh10enlOpKzffj/SKKyoAlCJDKArWcL
	IgLMifRJcZcQIaJiu9wNC70vRbKDssXF53H2AuZkzs7r3On2o0plZL1gf3Rp6MMP3oskHgpblnN
	b9HtBhwkWIVE2FXwW7sBRytpCTKYdrfGZusJiy5Ae1jtyKQZlphqvSHO8h6HWirsz9bHfmaeDt6
	UbAAsWxwU7r+alx2OJQN2YLWIu8ihdEWr02Nniat4N6N8rEr
X-Received: by 2002:a17:902:fe8b:b0:2b2:5840:80c5 with SMTP id
 d9443c01a7336-2b2d5a8a99cmr110805135ad.37.1776151425306; Tue, 14 Apr 2026
 00:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
 <87a4wgrxil.wl-tiwai@suse.de> <CAC88DfvjQvZvdvGdZ00woMymE2tUWk=2Dbqi3EzuzSHxGjEnzw@mail.gmail.com>
 <871phsrsnf.wl-tiwai@suse.de> <f59a70ca796b4d09822f514e7f25ac5c@realtek.com>
 <CAC88DftEBEEEvODGUZzkry+kgAm=SfH=PAsxwu+SABMBMRMs=Q@mail.gmail.com> <658f53ada52f4de9a0c852dd56554a2a@realtek.com>
In-Reply-To: <658f53ada52f4de9a0c852dd56554a2a@realtek.com>
From: =?UTF-8?B?SsOpcsOpbXkgQmV0aG1vbnQ=?= <jeremy.bethmont@gmail.com>
Date: Tue, 14 Apr 2026 14:23:31 +0700
X-Gm-Features: AQROBzDuOKQ-Sqh7dOPc0fOQ_0mD5HzIWXtRaG_1ih6Nu4he2z_S0UIbTfvgGRw
Message-ID: <CAC88DfvyuWeD99hhKKsHum+wpjjQrOKsdWvKVZMefjhcx3sKBw@mail.gmail.com>
Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287)
 after commit d2e01e0c5e94
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"regressions@leemhuis.info" <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kailang, Takashi,

I can confirm that applying this patch completely resolves the issue!

I compiled and tested it on my ThinkPad X1 Carbon Gen 12 (ALC287)
running kernel 6.19.11. The hardware popping noise upon PCM suspend is
entirely gone.

Thank you both for your incredible work on this. You can add my
Tested-by tag when this gets merged upstream:

Tested-by: Jeremy Bethmont <jeremy.bethmont@gmail.com>

Best regards,
Jeremy

On Tue, 14 Apr 2026 at 13:44, Kailang <kailang@realtek.com> wrote:
>
> Sorry!! Attached wrong file.
> Attached again.
>
> -----Original Message-----
> From: J=C3=A9r=C3=A9my Bethmont <jeremy.bethmont@gmail.com>
> Sent: Tuesday, April 14, 2026 2:37 PM
> To: Kailang <kailang@realtek.com>
> Cc: Takashi Iwai <tiwai@suse.de>; alsa-devel@alsa-project.org; regression=
s@lists.linux.dev; regressions@leemhuis.info
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
> Hi Kailang,
>
> Thank you for the patch. However, I believe you may have attached the wro=
ng file by mistake.
>
> The attached patch ("0000-x1-gen12-speaker.patch") is dated November 12, =
2024. Its commit message mentions fixing an issue with older BIOS versions.
>
> Could you please double-check?
>
> Best regards,
> Jeremy
>
> On Mon, 13 Apr 2026 at 16:16, Kailang <kailang@realtek.com> wrote:
> >
> > Hi Jeremy,
> >
> > You can test attach patch.
> >
> > BR,
> > Kailang
> >
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Tuesday, March 10, 2026 4:33 PM
> > To: J=C3=A9r=C3=A9my Bethmont <jeremy.bethmont@gmail.com>
> > Cc: Kailang <kailang@realtek.com>; alsa-devel@alsa-project.org;
> > regressions@lists.linux.dev; regressions@leemhuis.info
> > Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12
> > (ALC287) after commit d2e01e0c5e94
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not reply, click links, or open attachments unless you recognize the sende=
r and know the content is safe.
> >
> >
> >
> > On Tue, 10 Mar 2026 09:24:38 +0100,
> > J=C3=A9r=C3=A9my Bethmont wrote:
> > >
> > > Hi Takashi,
> > >
> > > Thank you for looking into this so quickly.
> > >
> > > As requested, I have attached the output of `alsa-info.sh
> > > --no-upload` from my machine.
> > >
> > > Please let me know if you have a proposed patch you would like me to
> > > test. I am happy to build it and verify if it resolves the popping
> > > on my hardware.
> >
> > I guess dropping the alc_process_coef_fw(codec, en_coefs) call at closi=
ng would fix your problem while keeping the one at open.
> > But I'm not sure about any side-effect by that.
> > Kailang, could you check this?
> >
> > BTW, when you disable runtime PM, does the pop noise still appears?
> >
> >
> > thanks,
> >
> > Takashi
> >
> > >
> > > Best regards,
> > > Jeremy
> > >
> > > On Tue, 10 Mar 2026 at 13:47, Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Tue, 10 Mar 2026 01:01:11 +0100, J=C3=A9r=C3=A9my Bethmont wrote=
:
> > > > >
> > > > > Hi Takashi, Kailang,
> > > > >
> > > > > I am reporting an audio regression introduced in kernel 6.18.13
> > > > > on the Lenovo ThinkPad X1 Carbon Gen 12 (Meteor Lake, Realtek
> > > > > ALC287 codec,
> > > > > SSID: 0x17aa231e).
> > > > >
> > > > > Since this update, the laptop emits a short, noticeable hardware
> > > > > pop/blip from the speakers exactly when an audio stream closes
> > > > > and the PCM state suspends. It happens consistently a few
> > > > > seconds after playback finishes (e.g., after a system
> > > > > notification or terminal bell).
> > > > >
> > > > > I have tracked the regression down to the following commit:
> > > > > d2e01e0c5e947da0b5005ca89efa82baeb232adc ("ALSA: hda/realtek -
> > > > > fixed speaker no sound")
> > > > >
> > > > > #regzbot introduced: d2e01e0c5e947da0b5005ca89efa82baeb232adc
> > > > >
> > > > > Root cause analysis:
> > > > > The commit modifies the `alc287_alc1318_playback_pcm_hook`
> > > > > function, adding raw COEF writes to disable/enable AMP silence
> > > > > detection on HDA_GEN_PCM_ACT_OPEN and HDA_GEN_PCM_ACT_CLOSE.
> > > > >
> > > > > Because `alc287_alc1318_playback_pcm_hook` is a shared hook used
> > > > > by multiple Lenovo ALC287/ALC1318 devices, these unconditional
> > > > > `WRITE_COEF` instructions are being sent to hardware that does
> > > > > not need the silence detection fix. On the X1 Carbon Gen 12,
> > > > > executing `alc_process_coef_fw(codec, en_coefs)` upon stream
> > > > > close triggers an immediate electrical pop. Monitoring with
> > > > > `pw-mon` confirms the hardware pop coincides perfectly with the
> > > > > monitor_FR / monitor_FL ports going idle/suspended.
> > > > >
> > > > > Proposed solution:
> > > > > Could we revert this commit, or alternatively, wrap these
> > > > > specific silence-detection COEF writes in a targeted
> > > > > `ALC287_FIXUP` quirk matched via SSID/DMI, rather than executing
> > > > > them globally in the shared playback hook?
> > > >
> > > > Could you give alsa-info.sh output?  Run the script with
> > > > --no-upload option and attach the output.
> > > >
> > > > I guess the bug might not be specific to your device but happening
> > > > in general with all matching ones.  As a workaround for such a pop
> > > > noise, we often need to reorder verbs or put some delay between ver=
bs.
> > > >
> > > >
> > > > Takashi
> > >
> > >
> > >
> > > --
> > > J=C3=A9r=C3=A9my Bethmont
> > >
>
>
>
> --
> J=C3=A9r=C3=A9my Bethmont



--=20
J=C3=A9r=C3=A9my Bethmont
