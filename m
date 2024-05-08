Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76992393
	for <regressions@lists.linux.dev>; Wed,  8 May 2024 23:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715210491; cv=none; b=TfcNOf9KFHbUy/9OwTURYoLPAVCS1ex/QimHl2hws1Z/kzFlfL1btkO4L7wl6zaobveUrwc/by+XCbB2X3+ts/9NAiTkoMMLYAfvwVs0xUgBID5+4hpqjNIL4x+1b2v7cM7v06rZkjhhK4JwlQztI6v0g6/YlTayssujeE7RjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715210491; c=relaxed/simple;
	bh=dVOYypf5FR+YlfU5kE+ClnSd5b6FPh8VKEP2Mzk/9xs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ST+nIRQJZqTFHGEHWDxGnuNLrkSMdPtYCX4o+uoZxsOyzs5i9H/EyIA0nxLtTcLSHwgpaOU106gUOqClNDaukoXqUBOh4q0aP/bccj4Se25bhw5o7aRvUZgVuXKeXdQNnsnYFhdxRqtnYr0GIq9McUj7s2OaRJreLmGsyfCD3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjvdHGCS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjvdHGCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715210488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dVOYypf5FR+YlfU5kE+ClnSd5b6FPh8VKEP2Mzk/9xs=;
	b=IjvdHGCS2If60Lo8MjznBlgbF1iSrKWlFn2KEsgggasknHSvCKocaPo/QhoX8PU8AZ41Ns
	mmsEF0GOmbgSZ63ojL4Yj/Hml9huPL5XGsnmJ0MXe5yax+bxIEeXpCjZ51dQyn4+OV0hTQ
	OQ3BOZr9kvfEuRArHcnFUlxX45x01tc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-bxE0_0ZUN-2FBW9AujrrBw-1; Wed, 08 May 2024 19:21:27 -0400
X-MC-Unique: bxE0_0ZUN-2FBW9AujrrBw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6993edda019so3589216d6.3
        for <regressions@lists.linux.dev>; Wed, 08 May 2024 16:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715210486; x=1715815286;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVOYypf5FR+YlfU5kE+ClnSd5b6FPh8VKEP2Mzk/9xs=;
        b=aXfT0jxGPibDZP8FQCKGahn28p4sRYD4+d55uDruPXicN6mitqEATa6euQiFuceJgg
         bwVCxAll920T/IEXtwJAkUOU+1G0mMO490HDjo/Y4mwJRQb/ouhmUYmQ26NUSjeHIiK5
         a7wwn0mFX8YNEt3o3+mohs3gVoa9wNAqja5hgl6hKkFoVfqUPOvXdN8hOHYtDU1ySwAK
         MD9BtPsNdFgv8wVQDrWAoZiZV2WCiuvVr2+P3F38hJh/DfTkVp2OY9cyV/3oAbVvqvnN
         6HA7bSjxb1vromI8H7R4LbDcERNnAROUnXnL23w6IcjCmQWqClgYVJkInbu+pC5HsSql
         GCYg==
X-Forwarded-Encrypted: i=1; AJvYcCVEt+bdyl/fS7b/t6lTE9uM5dKlMF0EuXNzAS8Fm8NmSySNYfg7D+Z0FzM/6WAWBAqUiVf9mexAx/aMtUmlBbnX9/IoLkXeYy+I0XA=
X-Gm-Message-State: AOJu0YzfNF+2d1PD0XEysPyB/Dt+0t+fKSx6wyNaJkPH/txv/v+P3R6R
	3MSA2wtpQy1LRcBe/mjQegJNUQvhemPoct7oBAqc+bmZAonSS+EUNXYPjpYuMbBggB3qQs58jQY
	nCfCypmTGIODMtGSYEwupIHUaS/x2fKKrQvd/DhiCpDvM8yjNLJU70hSA0ItV
X-Received: by 2002:ad4:5cce:0:b0:6a0:b4fd:d0a0 with SMTP id 6a1803df08f44-6a151433040mr47888046d6.6.1715210486705;
        Wed, 08 May 2024 16:21:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqGAoBt4qsg0Jz6aVRvN3hoL/hszZ/cIpBe42amCMPIhyFcmhD3C84W8ALulBzC9caIOAkdA==
X-Received: by 2002:ad4:5cce:0:b0:6a0:b4fd:d0a0 with SMTP id 6a1803df08f44-6a151433040mr47887936d6.6.1715210486386;
        Wed, 08 May 2024 16:21:26 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300:ded4:e2aa:1dec:4d9? ([2600:4040:5c6c:a300:ded4:e2aa:1dec:4d9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1d92c2sm801816d6.128.2024.05.08.16.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 16:21:25 -0700 (PDT)
Message-ID: <d2c6f335a6eb5892b0d894d5df4a6e713fa013b5.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Wed, 08 May 2024 19:21:06 -0400
In-Reply-To: <ea927dad269cc21de1d0baf3d6c9f66ee025b862.camel@redhat.com>
References: <3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com>
	 <20240418082703.GCZiDZVyra7qOQbyqn@fat_crate.local>
	 <fd040809d95b3e12b2fdc78a2409e187716bc66f.camel@redhat.com>
	 <87plumxz4x.ffs@tglx>
	 <abbb7d7ca781f6c664e4c5b1dffc19394ac79691.camel@redhat.com>
	 <87le59vw1y.ffs@tglx>
	 <3a0afe545747e5314a9cb6bbaa9ce90b259ddfac.camel@redhat.com>
	 <87edautcmz.ffs@tglx>
	 <3b1d16e357c1f9badeef405366492f05af26c085.camel@redhat.com>
	 <878r11t8zu.ffs@tglx> <016902d9-3858-4c65-b3ec-f7a5103af63c@amd.com>
	 <51d0dff8-2888-463c-95ab-71b491f12a8f@leemhuis.info> <877cg4ppd5.ffs@tglx>
	 <ea927dad269cc21de1d0baf3d6c9f66ee025b862.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok - so re the serial port comment (which I missed the first time I
read your message, oops!): I can totally get a serial console on this
machine, I happen to already have a serial port hooked up to the
motherboard. I'm not sure where my USB to RS232 adapter to connect to
it on my laptop is though, so I put in an order for a new one and it
should arrive tomorrow.

Regarding the test results - I tried possible_cpus all the way up to 17
and nothing got the machine to boot. However, possible_cpus=3D8
intremap=3Doff did get the machine to boot successfully

On Wed, 2024-05-08 at 17:02 -0400, Lyude Paul wrote:
> Yes sorry - I was out of work for a bit but I'm back now and can get
> you the info today - thanks for the patience =E2=99=A5
>=20
> On Wed, 2024-05-08 at 12:30 +0200, Thomas Gleixner wrote:
> > On Wed, May 08 2024 at 10:38, Linux regression tracking (Thorsten
> > Leemhuis) wrote:
> > > H! Lyude, Thomas, what's the status here? From here it looks like
> > > we
> > > were close to a fix, but then it turned out to be a bad fix --
> > > and
> > > afterwards nothing much seems to have happened. Did it fall
> > > through
> > > the
> > > cracks, or was this already fixed and I just missed that?
> >=20
> > I'm waiting for more data still.
> >=20
> > Thanks,
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

