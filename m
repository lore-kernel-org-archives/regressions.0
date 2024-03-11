Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0F4DA1A
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179057; cv=none; b=kWAottKw3yo8pv3nY8ik543n9DO5qj5/33eT1QuzkSijkH2F70I3WWLhp4CNjE9dEgWfRDyaYK2shRvLpI2AA0HvfmJZTru/E+LPdXS6dKeuMuInPw+bvAkHFokMe/BCZ7vy/PPtNsDjPQvROTtIaXk32HGtcISyqrCtXRmXYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179057; c=relaxed/simple;
	bh=dVABVYkEnzvrtDxSt88BcX8bbJ/2fnXzw4JV5D5ODLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLzVFRBDy05LGZUju1WzNVA9Y18aXTn+XiowrQLy2Q6Pg7sSdlfB0WvID9Rc7msJg0wYcVNsYAip3ySXzSWLh7TwysbHlDDK+r98K+4HBPbeFSJfDHj2rcW2/WkebSpgPPXD0GF+qoUJ1xKsziN5J9+SD7Q1JhWQbXlNEWGdk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eo71/UAT; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eo71/UAT"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-568251882d7so1065a12.0
        for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 10:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710179054; x=1710783854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6njN+Ix5AAlz5r+8JT2vb+hUlGcvA64q3xEcgqXOsgU=;
        b=eo71/UATOXcoEh148dEXPRVulIdlzHKLttK7aWy2iueFEDNWQYyVX1C7fU9dMH0wTs
         UZgSI3JhZJW9ElkcAn8hUIqKXgQNL03C1nFdHrhBMJiI3ookkJ5J6RfvX9HSYScq6a89
         HKl+xNk/d6/VThprRY1M3fIhF1j5S0RqXu3CjRWeRHL/p3BQEqrn0Q/D7b0KHsSQfTxa
         FFKso1dnTerdnT1a1RcpIG8Jh0PBeUDIAb28Hwnt3SF8/ir14wxStwITfdyEYQ1kA8PS
         tFPkvBzDBelu3OWpvHgGVNhBM0A+XfyUzshVVoFi8/9CVibLDOS8ooGabor3kDYjr2qT
         Gbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179054; x=1710783854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6njN+Ix5AAlz5r+8JT2vb+hUlGcvA64q3xEcgqXOsgU=;
        b=PU1gq9VQRAwKDL+EUsJRHs3KJclZ1q5yYiXKKCZu7clEOioP/0v++ms3IrWSF3ExsO
         sZGd2OUpgqe1tTjROE3q+0Hrcu9DOp1NM2hKNIuOOKojop48C/9Jg9oOfKn+ePixE5a2
         aKbTUHAgCktEPGuFlBW2siH6Cb9VMxjke/biJjEVMXu5KKQZDWTfoTFNoJu+w4c5u/PB
         55XrQq2K5URlraNCXsOZbWG9jmv5RGu3CKPAckfTYpfTbG42gnEs2+gnkjaXsemXJiRh
         tumLcTMto5uyLcBvqUWT450zvjCDnBMmtqi7G64ecktby9JGZ50KMBkNqYNzbqj1BcMT
         uVRA==
X-Forwarded-Encrypted: i=1; AJvYcCWudjL2gkPzcXryhxyLahbeuUol+STifw8a3XT+5qKmoUdumFHV8eoFGsheEynOvrNiva+akrPXa7GECbYqJekMRdYEgm5cmixNWZ8=
X-Gm-Message-State: AOJu0Yw+gCJx4cLfHLwcro23szdV1S0OgOEZ6+Db4iYyenSmHEiKRBaw
	/lr3NA7KuC8TS3lRhEIj5LGHSX7ja7jmmlv+KIbvQJ5DGSGc4U+tUAhg0rcTYCJnqFshbi8NZjo
	8mypNtdwynAN2yjGdbx2p3oOgoIDTdBO1PGzA
X-Google-Smtp-Source: AGHT+IEiyXoLtl8FGPR0QpQwioDmfpwtMlSqt/TB1uax5qtbflKwpR9qoDDE3tJQLCaR9qvo9iItIuvqoZmyCSDKVLQ=
X-Received: by 2002:aa7:d891:0:b0:568:569f:be4c with SMTP id
 u17-20020aa7d891000000b00568569fbe4cmr193644edq.3.1710179053955; Mon, 11 Mar
 2024 10:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240306111157.29327-1-petr@tesarici.cz> <20240311182516.1e2eebd8@meshulam.tesarici.cz>
In-Reply-To: <20240311182516.1e2eebd8@meshulam.tesarici.cz>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 11 Mar 2024 18:43:59 +0100
Message-ID: <CANn89iKQpSaF5KG5=dT_o=WBeZtCiLcN768eUdYvUew-dLbKaA@mail.gmail.com>
Subject: Re: [PATCH 1/1] u64_stats: fix u64_stats_init() for lockdep when used
 repeatedly in one file
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 6:25=E2=80=AFPM Petr Tesa=C5=99=C3=ADk <petr@tesari=
ci.cz> wrote:
>
> On Wed,  6 Mar 2024 12:11:57 +0100
> Petr Tesarik <petr@tesarici.cz> wrote:
>
> > Fix bogus lockdep warnings if multiple u64_stats_sync variables are
> > initialized in the same file.
> >
> > With CONFIG_LOCKDEP, seqcount_init() is a macro which declares:
> >
> >       static struct lock_class_key __key;
> >
> > Since u64_stats_init() is a function (albeit an inline one), all calls
> > within the same file end up using the same instance, effectively treati=
ng
> > them all as a single lock-class.
>
> What happens with this fix now?
>
> IIUC it should be reviewed by Eric, but I don't know through which tree
> it should be merged. Any plans yet?

I thought I gave a reply, but apparently not .

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
