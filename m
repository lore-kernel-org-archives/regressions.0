Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C110A36
	for <regressions@lists.linux.dev>; Thu,  9 May 2024 19:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715282545; cv=none; b=YK+ZCki465dilZnd72xoEO6uUJz9hylfbwzLcGz2baT17kuy0ujjEY4WbTffY4BLphk4YcgX3l5s2Tm+puOI64H8dcaf6pxpF0841IlgG6zqu5omkAIuxMI81AbbWI5OnIa6YARqV9dg8gQkjMB2TgMvX8HFhNK906h+yN/MzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715282545; c=relaxed/simple;
	bh=uhopRzx/XhZA35l03Dn7Eg/wIJKB5A+zw2Gz642p7V0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W6ZviB4bm54N9xijBGhDSY+ZDIOkg98splHeabf2WWYND9ZULetKPCU9vIkDOxcymiLwyrcZfqm/4Vjh2VOpg2BOgAw0VrEM2SkNNb1JOXhFna+zl0Q2718PjaaoOt8G2bkNPULXnBfnJYo59lWQ79brRRROlUxwPbdpJ4jWKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLUVpGRR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLUVpGRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715282542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhopRzx/XhZA35l03Dn7Eg/wIJKB5A+zw2Gz642p7V0=;
	b=cLUVpGRR659JvGSN45vMn9PYm+NJrZT7+nEZKMKU2Srp1nORBa2VRJNB+qtb6W380FcMSn
	N8Nd8tlLKA8GmUYXi8pVhuczAWmgpSgEeJ7iCj6mePvCVfVUuoK6NfHezW+5U84jqfCA7n
	hE+rxY1IrOPHdZlq/BHfiJs5Ocfr/eY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-M4einS_KObS6dh7ffGHgBw-1; Thu, 09 May 2024 15:22:21 -0400
X-MC-Unique: M4einS_KObS6dh7ffGHgBw-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c97917b6f1so1205700b6e.2
        for <regressions@lists.linux.dev>; Thu, 09 May 2024 12:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282541; x=1715887341;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhopRzx/XhZA35l03Dn7Eg/wIJKB5A+zw2Gz642p7V0=;
        b=T3VllaXS2MxEG+aZg26MPSl8lK8NXZhsz6ROIB+AhAN4mTmTg7CSFxb5gkkw6tNT2+
         hhKwcQQ5Gy9r/jtxCbvLg5lR5WJznFhowqsQx+ol8kgFajX3HLtcgfr9/WNgYBxcjQGL
         R4R10y1l9fiv5AYHgf/diUb1i2Z/u7LEMIB3ho7uZl8u5rMubaIm9Z5fL7i4vMSx4dHc
         ZYNkVbiOjl2yMJnTrRe2msM7QnqZQyN1a5MlcEdxIsmKlQc6xrk4r3mnfbAp9ubtaqCk
         h+MZPUd0aEf1CKc+W0qJbFPcyBNmVVYn8vkB1U2TeWtkgeLYFyUxo6JjG0gX79Cqr0yj
         Wp/g==
X-Forwarded-Encrypted: i=1; AJvYcCURoZIj949DgC9erhuR8X7A/zni4lz8GqBPXmq8ezjkTbg+NsOqXjnmngclHLCiO26SV1O4B5CcOZTZD7Hi8zjic/G4MJT8yEAtPas=
X-Gm-Message-State: AOJu0Yy/zjzFSx2xGa5YjbcbvJdf8LIuk2MbckDE0PGP4PMUL7+Me+9N
	4E2+82nMF9GDkKBBo/QYSOI4X/HCxGSiFS5tkc+x+cCTd4rQyCnVP6ZPS+dNsT10vydUZFNEJ8p
	ES1AqYumo94G3X0+2+TdP2zKSrpSJj1qQGfN0wU3q4LothVg8MeX/vN+OGySP
X-Received: by 2002:a05:6808:4283:b0:3c6:943:e0ad with SMTP id 5614622812f47-3c9970d1ad3mr513020b6e.51.1715282540898;
        Thu, 09 May 2024 12:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEccDULG+OZF6F4EJARtsc9vrHVxtHz6I2M4b63CQsYPYrrGuQ3VvnMKHvMeG3kq524mAJ8NA==
X-Received: by 2002:a05:6808:4283:b0:3c6:943:e0ad with SMTP id 5614622812f47-3c9970d1ad3mr513003b6e.51.1715282540588;
        Thu, 09 May 2024 12:22:20 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c6c:a300::789])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a1689c479bsm297046d6.57.2024.05.09.12.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:22:20 -0700 (PDT)
Message-ID: <0abb541a45fd46aefb67d0a5dfd869230d8e3d95.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Thu, 09 May 2024 15:22:19 -0400
In-Reply-To: <877cg4ppd5.ffs@tglx>
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

So uh, apparently amazon decided that instead of using the shipping
address I have in their address book that is marked as "Default
Shipping Address" that it makes much more sense to sort all addresses
in the address book alphabetically, and then surprise me by sending it
to the first address in that list. which means the adapter got shipped
half way across the country and it's probably going to take me until at
least tomorrow to get a different one here, sorry :(.

Will get back to you with this info as soon as I can

On Wed, 2024-05-08 at 12:30 +0200, Thomas Gleixner wrote:
> On Wed, May 08 2024 at 10:38, Linux regression tracking (Thorsten
> Leemhuis) wrote:
> > H! Lyude, Thomas, what's the status here? From here it looks like
> > we
> > were close to a fix, but then it turned out to be a bad fix -- and
> > afterwards nothing much seems to have happened. Did it fall through
> > the
> > cracks, or was this already fixed and I just missed that?
>=20
> I'm waiting for more data still.
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

