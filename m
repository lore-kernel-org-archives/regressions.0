Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5761C5F23
	for <regressions@lists.linux.dev>; Wed,  9 Apr 2025 17:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218877; cv=none; b=MoUQeeV0t9JOtOSH8v1TaN/nc9p/YvGYuimfiMS1vIS7Ksj/8L8NaqGZhjBJAdRLq0RhJdAqhYwa8UG+oPHoD2T1nB0iUD5Us/d7DrfWKVy2xQ9pBaqwfcAP7/h+U/mFGlp+hnjwduO+UdGeHT3wMKiD3UX4ViXmq7el9XCAALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218877; c=relaxed/simple;
	bh=2yCH11+QS6uXp6BOH0cT74jcB7dPGpLEP/wtuGCkuZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWdQRNwY7/9d9PgfMDnKnKMLIGIVQ3+yfvdMfH/h0NumZC/nUlAe3rqjMR4Ta/0QOH5NbEGPp6OcBC11oZST3qy0RgswXJOuVMpVYZs1XGcZT2UUMJdXk3QpNosht1+lQeiDpt1CCjbT3tAmD5TjKQTAiVO77W9jDPkyU99eb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSJfhD6j; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSJfhD6j"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aca99fc253bso235455866b.0
        for <regressions@lists.linux.dev>; Wed, 09 Apr 2025 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218873; x=1744823673; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4jn7E2mOey7c52PMiFK2mN0C3Pf6nDc9jBX5P7DR0w=;
        b=OSJfhD6jOe25YgNKT5HnLTuiTxKEnVYCbuYucUJlc5ETMCi6uwz8HYr4QCHYjTjUFh
         bIK+MAwNa/29CPjYCxPyzze/yxPjzTDDze8pe2s10HtSCjVCBFRvoYErgO9cjNLF/hLy
         7xvTjXw05fexmMrL/WCsLytzSpB5zk14s+V0zQzlnM5O4hNfCQFnlB/h79gyUEBPAhZH
         MvP2meZV31cjdHlFOcogneHQEXeOLgaNuDrdJh4AMDDMRCY0YlXDgk/fdZx0q/qzv2u1
         g0X3Y4RQWK4hVe3e7shGS1JLbeSPa4PXxVgrj5sazETqDeQWKFtVGx08r22EZwOCocin
         s9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218873; x=1744823673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4jn7E2mOey7c52PMiFK2mN0C3Pf6nDc9jBX5P7DR0w=;
        b=UIZyfW/CYASNNL7IUcuK6CDj2259glRepajgNJ0BN4YvsttFrWGLAnVCzfFZABrrgF
         jLUsiINYvFTmflSTh7Jibe3VO8CIdt73fzWh+EJnJI/IiTpm9TaODO/9zrDtN1McUpQm
         TCx1/hYKdvUybiL+y9NQw9BzF2A2MYZxo3zfN3YptSeScCCTkOm8zWL1Z0csHUdzX+Zl
         JOXW68ZZpGyBQiBJqviXrPZS92TIMSr1i5izWEJPBd5ygXB8gSt4xaI2A1JKyWhC9vtk
         Q58kxMRznZSAOYu+UDWMYHv5fxcdgI+lk+ZLXrAcSrs5n1REEPdx2Oq8SHIcqtgIfeED
         4dlw==
X-Forwarded-Encrypted: i=1; AJvYcCWESHug/L/eEYSy8KHwcMZo+SGH0dsbslH70sIHQjctP7HFVQJtqjYjWm9PCE0japCn5hrfmM7T49FXSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9/GMLlnqaDrK8DNm9iYYjIHHiVUrXczrF0rWzIgXO7DqtW50t
	ln6sPoE8p4cQwM4Xy6507BlEAy/hDlpB1faYZe5uPA5ACNtjOMwz
X-Gm-Gg: ASbGncv5uJf6cN8vhAc9O5E79atAak/a7dZAxoR6PkAPD+7RNmlA26tHbh07+8OxBgt
	tNaLpfo/krPQ1apGDC+k7mmQUKSX7uClaJLrPn+XiNYo1UWk+mtKTRpnLG6/hrJZEJgBKCxvENb
	Z53OtqtT+6WepDTmh749ZeELQEeDbXvFjcPo5i9LqZMhS3NPJK/OeH3j9j0h4dx0VATfuYc17u9
	wxdAM+TGLPp+fiHx1InG7aRxMO1+/+pSu4gJ4lm54Cs7L6yeU0xuMQ51rltlYC51pwEy6hzGhK9
	1lwcKZ/MRIPZhzmILPmslRFlHcZMABpt/dKaKTn+VFSkBK//4Dc0LQr/Q0ETjF+vV7HIzzba+g=
	=
X-Google-Smtp-Source: AGHT+IFVIwUn9gnSu5wpLhhWkHk63r3TT3qIYaq3NQxQez4llYrua2mut70dsHOl+ApdX+lUsRLs0g==
X-Received: by 2002:a17:907:97d4:b0:ac3:121e:f2cb with SMTP id a640c23a62f3a-aca9d5dd4femr299108766b.1.1744218872489;
        Wed, 09 Apr 2025 10:14:32 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce732dsm124991466b.171.2025.04.09.10.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:14:31 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 00A30BE2DE0; Wed, 09 Apr 2025 19:14:30 +0200 (CEST)
Date: Wed, 9 Apr 2025 19:14:30 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org, Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on
 VivoBook_ASUSLaptop TP401MARB_J401MA)
Message-ID: <Z_aq9kkdswrGZRUQ@eldamar.lan>
References: <878qojypu6.wl-tiwai@suse.de>
 <CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
 <87mscw4dst.wl-tiwai@suse.de>
 <Z_AxsuGoaVK9P3L4@eldamar.lan>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <CAJ8x=4gQQeh+yuUrBDT3P_ZkWRT+7pPujq-ZF6Fcao0V7kohFw@mail.gmail.com>
 <Z_DNcG7wp4iPh5NH@eldamar.lan>
 <CAJ8x=4hmi0Afneepe15Ef-kzVZO+uyw5Row+Cooob_QR=DpwQg@mail.gmail.com>
 <Z_E9LbOiYN5dPpSb@eldamar.lan>
 <87zfgu1klk.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfgu1klk.wl-tiwai@suse.de>

Hi,

On Sat, Apr 05, 2025 at 09:20:23PM +0200, Takashi Iwai wrote:
> On Sat, 05 Apr 2025 16:24:45 +0200,
> Salvatore Bonaccorso wrote:
> > 
> > Control: tags -1 - moreinfo
> > 
> > On Sat, Apr 05, 2025 at 09:08:38AM -0400, C.D. MacEachern wrote:
> > > Thanks, running it now, microphone levels working fine now! Testing
> > > recording and playback, working perfectly.
> > 
> > Many thanks for testing the patch and confirming the fix.
> > 
> > Takashi, assume you will monitor that 8983dc1b66c0 ("ALSA:
> > hda/realtek: Fix built-in mic on another ASUS VivoBook model") get
> > backported to all the relevant stable series? TTBOM, it won't apply
> > cleanly to 6.1.y so Greg or Sasha might not get it down to 6.1.y
> > witout explicit backport request?
> 
> As it has Fixes tag, it'll be backported usually to stable branches,
> yes.  If it's missing, just ping stable ML.

Yes right, and in meanwhile it has made the way to 6.12.y, 6.13.y and
6.14.y. I just fear it won't go as well down to 6.1.y automatically as
the change does not apply "cleanly" so might need to make a hint :)

Thanks a lot for your work, I will apply ahead the 6.1.y inclusion the
fix as well in Debian to address https://bugs.debian.org/1100928 .

Regards,
Salvatore
