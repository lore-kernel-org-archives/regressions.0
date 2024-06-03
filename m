Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF0135A6C
	for <regressions@lists.linux.dev>; Mon,  3 Jun 2024 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717431772; cv=none; b=jTTX2gsTloR8o28zpJ6P+1UaOy/SFF2Yd3dC7+aYgKLzFqYYMkj5rJp6Dppgat8FHqde2bW5En9SXIaotF+FWXPdavwgprtGecmdplIml1Co/k3UzVoJgd3k2ED2MHxIvvjF8/BBJB+I2ably7SnwAvDujnyMNLqUHCMogqAVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717431772; c=relaxed/simple;
	bh=/OvWAYH0P6ogYo10xALQ7QIqAZoR01AAJjOIOUVXozM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QP91f9XiePwR/uWC8WuaDrMvXwH7M4eFZ6LM5jbtcAZCmKFvyK2/PzInVKwtiRWupnexg8DsBX4uuJVRQBF0Qp9a8lnfb9aAP3rf1ywKxg1r9aHoep78+tFT9RbHCp0ATPCQMLFl3Bcb12gDBtEwoksYPjI0SIsZfp0I48/dFts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IL9pjSB4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IL9pjSB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717431769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OvWAYH0P6ogYo10xALQ7QIqAZoR01AAJjOIOUVXozM=;
	b=IL9pjSB4wpALKRZsTWaDqTqgu8FpPXT/BC2duO4O9S1qaz3y34YqRbWYuhbMi9K1x0R+ma
	9jTq2+2RvH8ZR3Wh5qEPWQCJCLLvja+D0M98y2CVN7/6iuFWzm6ZuX5M59DMdJ5DCF0HKB
	23eYuAL3mgmoQZ5jgM8+DrrYRaA40uA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-snrUf7oDNoSz9mxLD9VS0Q-1; Mon, 03 Jun 2024 12:22:48 -0400
X-MC-Unique: snrUf7oDNoSz9mxLD9VS0Q-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3d1c6f66e13so4239023b6e.2
        for <regressions@lists.linux.dev>; Mon, 03 Jun 2024 09:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717431767; x=1718036567;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OvWAYH0P6ogYo10xALQ7QIqAZoR01AAJjOIOUVXozM=;
        b=Bv9gYhqnvkU8m8oujjXSQ/5MqTRwENLf1VZcczoKmrrZsscw13CaSZShO77rAErhTP
         wOlgsZbvYg1zypYYUiEkgLTjOsHn6WNkMJWJsOHSQtldD0EUXU3IRpZd7Ezm48aU8+8z
         YBedlyT4Y0mMizrr/mWnqtq1D3uWSsxKa8LKcGRIf+59eo5BdqzP3/9EQyLmVvbgiMVF
         EsOZaG2poc9MGVRFfLEBMpHNC1z6iXfE5JT2JMWgfp+WE3w+0fS96NBy3LQQcb8L1DZF
         iVctybUoHny3nEYOyBkOdIf3laD/Myad7l44Q7ph/fDFq4o790YyX3FMUJgwjgeQvn6f
         UTLw==
X-Forwarded-Encrypted: i=1; AJvYcCVNsfPYG9v2+MgGbbEEjtb3HX9PIWtvDYyDLgfz179XthC52bcv8T/3BV0eDL6NckMuAHkVgfXCqEWWMvoBbpVe8qSdTuNfvFH43Z0=
X-Gm-Message-State: AOJu0YxLIcud5jnwO03aLPJKZ9kf018plAM7nj+adsXwIq4TI0gnyt94
	mqksoPQGsftbG893gp8217Tc88pv7WYyF8eZpmY1SpQwqY6MQPQ3t5n6JgSEKHecQwQng3a2mty
	QXHpTMuXeX4Vr5BJQI75MOg41cATV4PRmsBHpX77zXpx4U7kqFJuAVIOLDc9y
X-Received: by 2002:aca:2403:0:b0:3ca:babd:76b3 with SMTP id 5614622812f47-3d1e3480ad6mr8825713b6e.12.1717431767327;
        Mon, 03 Jun 2024 09:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkujB40JEGLJSPMS+fMp8vyiKXzC2SKC+YUf1vVWP9Xydkf1K8gO5okq9R6izLX6WhDGmLmw==
X-Received: by 2002:aca:2403:0:b0:3ca:babd:76b3 with SMTP id 5614622812f47-3d1e3480ad6mr8825619b6e.12.1717431765478;
        Mon, 03 Jun 2024 09:22:45 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c4c:a000:270f:2a70:881d:60b9? ([2600:4040:5c4c:a000:270f:2a70:881d:60b9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a750441sm32138096d6.71.2024.06.03.09.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 09:22:44 -0700 (PDT)
Message-ID: <0533e9a6d05b10a00c760142cf268cfd5db0d52f.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Mon, 03 Jun 2024 12:22:25 -0400
In-Reply-To: <87ttiha77b.ffs@tglx>
References: <3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com>
	 <abbb7d7ca781f6c664e4c5b1dffc19394ac79691.camel@redhat.com>
	 <87le59vw1y.ffs@tglx>
	 <3a0afe545747e5314a9cb6bbaa9ce90b259ddfac.camel@redhat.com>
	 <87edautcmz.ffs@tglx>
	 <3b1d16e357c1f9badeef405366492f05af26c085.camel@redhat.com>
	 <878r11t8zu.ffs@tglx> <016902d9-3858-4c65-b3ec-f7a5103af63c@amd.com>
	 <51d0dff8-2888-463c-95ab-71b491f12a8f@leemhuis.info> <877cg4ppd5.ffs@tglx>
	 <ea927dad269cc21de1d0baf3d6c9f66ee025b862.camel@redhat.com>
	 <d2c6f335a6eb5892b0d894d5df4a6e713fa013b5.camel@redhat.com>
	 <87jzjxn6s5.ffs@tglx>
	 <d3fe5278e7cd5af6c62b470b281b547b67e3959a.camel@redhat.com>
	 <97bd95480a8b9951edc9ee2d2648d1b9c574e3b0.camel@redhat.com>
	 <87bk58n6le.ffs@tglx>
	 <2fd6009d21d606d13f0c472dbaa754a21f3105d9.camel@redhat.com>
	 <87wmntkhak.ffs@tglx>
	 <d4496b4ed8a8a7bb34cf12e4cce65a6ad6705bc0.camel@redhat.com>
	 <874japh4ww.ffs@tglx> <87sey8g5z6.ffs@tglx> <87ttiha77b.ffs@tglx>
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

Ah whoops! Sorry I totally missed this question, thank you for poking
again
I'm not sure it is but I will double check tomorrow and let you know.

On Wed, 2024-05-29 at 00:43 +0200, Thomas Gleixner wrote:
> Lyude!
>=20
> On Thu, May 23 2024 at 12:47, Thomas Gleixner wrote:
> > Something I wanted to ask before. Is the BIOS of that machine up to
> > date?
>=20
> Any update on this? I really don't want to add magic workarounds if
> there is a BIOS update which fixes it.
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

