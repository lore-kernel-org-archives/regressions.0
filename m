Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A41429B
	for <regressions@lists.linux.dev>; Tue, 28 May 2024 04:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716869323; cv=none; b=PXfGtD1gvFuhwL1oU06QxTSAPJLt/IFhn9v8PKLPjqE+r51hesb217vAEJwrvGwocnDOOBAV2Ubli7J69bfqQ52iUJhfHKQaXBCx8DkDhe8OlBUJ0Sm9js8WE7DgQEUDGVUkaoXoY162gn4YE86/+OFuPEcA0N7jt5jk01VKeiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716869323; c=relaxed/simple;
	bh=1zQlRYQXYa6k6CCPf33lK1Df7v5lDyubYaYJYb2isv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apZPQm/u3pi6Up5boDgtXHlcTCHRTzwf+nLBxLr8j/95fOV9LthpIZNy3yfvfqRIC4gdsVEqofRhGU35jrrrakt3Q6dJyJynoMaLrx4sqtexppch+/sVwoPap8k/OxeGdYoLugmqdeo8a5B7zqzQlrCenRjdxYm6jvKfAVG2GTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gepAeImc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gepAeImc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52965199234so410392e87.2
        for <regressions@lists.linux.dev>; Mon, 27 May 2024 21:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716869320; x=1717474120; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMyc3pRbel0bshffcEecjOn4iWU9YutUkHwlm4EbsFw=;
        b=gepAeImcMZBupQPdcKm2Gd2ZgoYOzlz7fE38q0EVWLu9lyr8uusA7yZ4FQBQzEnNk3
         MACQfErjO5s/grz/ssRTlMjcvfKO+L1hxuVNFcoQ5llWtA7E6AYvm8VBnOd9fDbvlvaG
         NFUqCUGIjYE+frZ3vq4iPPELdqwfa1u7plgb/QoBbHUQAwt/bvuv9g55HKOfs0qKRJNO
         yKYprifzqp2KpRfBdcGfaUZWZ+NLkkJRayJBUgqtVfplg+6FXWgQ6m4xpYS35j2I+acM
         e9B1Zs9Tur8dCd3E5yN368cMeZb1rHsqPjy8+UXqbF7Z4/OiAItCNsLqtpkpztacyXoB
         cD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716869320; x=1717474120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMyc3pRbel0bshffcEecjOn4iWU9YutUkHwlm4EbsFw=;
        b=D2NNAXkAzwsr7X2ZJgnGgys40rtStnSOggyma6iML/dKCitfyXjykAzSp+cJ4qntC0
         jLWia29c2M7+hlsAIQg8jHVgkqnjnyUkTnruMD4YtuxUuclz3e6eUR/KGtn6nv7kemuE
         0/CTRbuxdgHF4Nr/oBMfKwZBNnFq91N6ywrHD+R5FiZNDvx1bAaEaoSTIK5p+l1v3u8M
         YuP6PaKQ1GPTtjuAjNxpwbho9S+SU0Qrv3Cz0PYP5HHAV+EbwtA53izf6gt2oRWeNOlW
         lyBPQMwf9MEz7OB3HVF+fM20YDES5opgWiU/kNjcUsB80fOx8cjM7RyF+gipCljnLx+m
         OGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUl+ry2rYoEXjK8rYdK42mkwj/a8NklWaQuvic5n3v5esGXPQpLhzQXu1LoyhKnOFcQIbcjXaAi3Cbwz1m7oEhr5Nhwj3Cp3v4Tcsk=
X-Gm-Message-State: AOJu0YzRoz5VaKXgtvATZ9uwrGWJfnnv2Q87eu4Vfn+8yhfafWPBU+69
	xcGaDatPd2kKyjrkdBykd7ez7svrnhbn0FssHGQOhtqMev2jNrqxqV9WKPkuj1ZZslHVPF7atLS
	Xmq15NtT8vZC3L/1Ev1Q9WwfqWvs=
X-Google-Smtp-Source: AGHT+IGJiavREr3NWLKOzpRZdqUHa7q77BL+5YFsloQz18KBti8Zw39zdX1RWbJfMYba295OwGrClZrngVMi829iwIM=
X-Received: by 2002:a2e:800f:0:b0:2e9:6306:8a51 with SMTP id
 38308e7fff4ca-2e963069082mr58708411fa.52.1716869319348; Mon, 27 May 2024
 21:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE4VaREzY+a2PvQJYJbfh8DwB4OP7kucZG-e28H22xyWob1w_A@mail.gmail.com>
 <5b79732b-087c-411f-a477-9b837566673e@leemhuis.info> <20240524132008.6b6f69f6@gandalf.local.home>
 <CAE4VaRF80OhnaiqeP9STfLa5pORB31YSorgoJ92fQ8tsRovxqQ@mail.gmail.com>
 <CAE4VaRGaNJSdo474joOtKEkxkfmyJ-zsrr8asb7ojP2JexFt-A@mail.gmail.com>
 <2024052710-marsupial-debug-febd@gregkh> <20240527174424.75625921@rorschach.local.home>
In-Reply-To: <20240527174424.75625921@rorschach.local.home>
From: =?UTF-8?B?SWxra2EgTmF1bGFww6TDpA==?= <digirigawa@gmail.com>
Date: Tue, 28 May 2024 07:08:03 +0300
Message-ID: <CAE4VaRGzvMU7ZuNwHq1SE0t+Z02Aa5QO44tBH8YgvSYX5ByRwg@mail.gmail.com>
Subject: Re: Bug in Kernel 6.8.x, 6.9.x Causing Trace/Panic During Shutdown/Reboot
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried 6.10-rc1 and it still ends up to panic

--Ilkka


On Tue, May 28, 2024 at 12:44=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Mon, 27 May 2024 20:14:42 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > On Mon, May 27, 2024 at 07:40:21PM +0300, Ilkka Naulap=C3=A4=C3=A4 wrot=
e:
> > > Hi Steven,
> > >
> > > I took some time and bisected the 6.8.9 - 6.8.10 and git gave the
> > > panic inducing commit:
> > >
> > > 414fb08628143 (tracefs: Reset permissions on remount if permissions a=
re options)
> > >
> > > I reverted that commit to 6.9.2 and now it only serves the trace but
> > > the panic is gone. But I can live with it.
> >
> > Steven, should we revert that?
> >
> > Or is there some other change that we should take to resolve this?
> >
>
> Before we revert it (as it may be a bug in mainline), Ilkka, can you
> test v6.10-rc1?  If it exists there, it will let me know whether or not
> I missed something.
>
> Thanks,
>
> -- Steve
