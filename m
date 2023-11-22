Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EB4E630
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Cj3esaAZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32daeed7771so4150668f8f.3
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700662288; x=1701267088; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j6oC8Fs3BZRJguyt5O6618kkpqiUsB6zuCr+BFV9ojc=;
        b=Cj3esaAZA05pMTVXMaHOOkP+MRs2+WT7Uc3T/Kyxtpq13vzUwom30wANXJnbWyw5Qk
         eKe5AM677+kmSMszRkWrl4bPbeMGqF6JBqt7fN1hxoUTLDU8KzFnXdg0v500nYDxUrjr
         89snRgO0dQPlmtg94xC8dnns+W9tLGTaKlpHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700662288; x=1701267088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6oC8Fs3BZRJguyt5O6618kkpqiUsB6zuCr+BFV9ojc=;
        b=If1zEGx0PJf4Up+TIb44RvMx9OfeLOseAXfjxVuZSyqKhPP4+6Uq/TkC+f+IVLIk8H
         3TtVmd5R3oqzz5PC5WcfDS+3khVUwZAjFYv2XGiwlzw3zlBiduF/XfOn2ylzrnDyjR1p
         Q5EjefJkEgoBgFPaUnwnUX7ymjNdGBXkNeHVxQnpromM7jr/qOAVudFqVn30N9EWRNyB
         Xj8Tg2IlyeKu/I3Uq9zNRVqOgLAMJlEL/qn4KjLj9dbZOY3yRGy6+EfNe2XV6naAXLju
         suacL/5C7H23vMYUKwW8W1klASvRO4RKzlSHOWlgQkNZZvJgAucqesEUAtxrYUk1n81s
         hqEQ==
X-Gm-Message-State: AOJu0YxheRDjVzVys89KUSzMRlNNoRX8PoZZcuYmITyWuzVsuPZLuhvF
	z8WXSw97eGJwhm2RnILPOf7cjQioZLxJ2HBwHQ0=
X-Google-Smtp-Source: AGHT+IHvST9DtUHsKkmwgZf6S3xVst9F2NM1FhB0lgKbcdN9HZ4sV8auN2hvsgW/BtionlZ4Z4ov+A==
X-Received: by 2002:a05:6000:156f:b0:332:ce72:d589 with SMTP id 15-20020a056000156f00b00332ce72d589mr2511576wrz.3.1700662287943;
        Wed, 22 Nov 2023 06:11:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1718:e534:44cc:c75e? ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id az30-20020adfe19e000000b00332c36b6563sm11363831wrb.101.2023.11.22.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 06:11:27 -0800 (PST)
Message-ID: <e49abe2b336ce7534e9a7c82e21df9644f00f3a2.camel@linuxfoundation.org>
Subject: Re: 32 bit qemu regression from v6.5 tip pull [6c480f222128
 x86/alternative: Rewrite optimize_nops() some]
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>, 
	paul.gortmaker@windriver.com
Cc: bp@alien8.de, linux-kernel@vger.kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, x86@kernel.org
Date: Wed, 22 Nov 2023 14:11:26 +0000
In-Reply-To: <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info>
References: <ZUEgAAGDVqXz2Seo@windriver.com>
	 <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2023-11-11 at 12:51 +0100, Linux regression tracking (Thorsten
Leemhuis) wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>=20
> > [Re: 32 bit qemu regression from v6.5 tip pull [6c480f222128 x86/altern=
ative: Rewrite optimize_nops() some]] On 30/10/2023 (Mon 20:30) Thomas Glei=
xner wrote:
> >=20
> > > On Mon, Oct 30 2023 at 19:24, Thomas Gleixner wrote:
> >=20
> > > > Can you add "debug-alternative" to the kernel command line and log =
both
> > > > a working and the non-working kernel output. It's noisy :)
> > > >=20
> > > > Also do you have a .config and the qemu command line handy?
> > >=20
> > > Forgot to ask: Does the probkem persist with 6.6 ?
> >=20
> > My bad, should have mentioned v6.6 and linux-next is impacted. Always a
> > conflict between burying the lead and boring people with details.
>=20
> Paul, was this regression ever solved? I wonder as I could not find
> anything with a "Fixes: 6c480f222128 [...]" tag on lore and this thread
> looks stalled.

I didn't see a reply to this. I can confirm the issue is still present
and we're not aware of any fix yet.

Cheers,

Richard
