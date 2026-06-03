Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60766390C8C
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 06:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469638; cv=none; b=Y/1uJrCMk4hnNsAvXDKolUBbi/XUsAobQIjkxrPcLwwjl+dMUv2Sdn/psfdT0WEFg22htgkixILWmaQl/DDi2gQoWS4HkYuKKsEM+N6xhIw4nNNiMjACew1CTMpEawkmR2fBNQTVATNiGuW3MjU2iMdvRzZijbr6R6oP9GdTbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469638; c=relaxed/simple;
	bh=YtoExcp1vKCmmemHMTzqZLSo4dfGSjDVY5YroZRwHyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPsDm44bEkuY6UR+U0L85tuad3Ih3CK4M7JcClZVupvYO1T1wHTa1liy6Kw92N3ExyS+H7+TB7aIvLDKsZurTpKybUMvKHul2AzBoJ8kGuaESROrQn5xvcAI4OREg0nWaE9ErbruY1SnWUS97k8/NtQrRtTeFdEKwbuGSjIGNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZMW5th7Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZMW5th7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780469636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtoExcp1vKCmmemHMTzqZLSo4dfGSjDVY5YroZRwHyE=;
	b=ZMW5th7Z4/P1TRqixHWVZq0fzgK7RoFS4Z158RJEtMXlVYRcIs/vHQHKbUH3x4spmkfUx7
	M+E7rKdc4GIIiRKijvaefvCfdU3w7MFe3ccbrrLSsMbToGQf2F5RC/bEHqW+LAL6DkkBsQ
	6y914PNtzko/Ca0w2yOCGzvpzGV3FLw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-2iomgDcyPdaLUHi0Tel2wQ-1; Wed, 03 Jun 2026 02:53:53 -0400
X-MC-Unique: 2iomgDcyPdaLUHi0Tel2wQ-1
X-Mimecast-MFC-AGG-ID: 2iomgDcyPdaLUHi0Tel2wQ_1780469632
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3966afc5d18so14628341fa.3
        for <regressions@lists.linux.dev>; Tue, 02 Jun 2026 23:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469632; x=1781074432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtoExcp1vKCmmemHMTzqZLSo4dfGSjDVY5YroZRwHyE=;
        b=e/HIRMmFQdr3ju+TkR4zVr5WppTYsI6nqQrWlOqE7cVRKncHpqk713+fidYCNa4doX
         TaqwfIO8gRswHaeBUTsOvk/mzXuTe3DNSjYVRXSHKqMaorOhlvNjNKe6mNI6wBgwSZQ6
         HVFYplkTHzBYhEOMPHX/1BR/PiA5zQMBHRJJGpdJYNupCVVgLl3ewlqPSHyBthDPAjJY
         nL6fqacQeNGohHup4sO7BWJRJoQLT3jTLOUrq3LABDT7SG8knQDizAxG2Nz9uQESZ/2A
         advw/lylS5QSzwN752LWzWHPUlrIzfFjFXjgInd8v5QwkRFiQPpXiKeilumCJ1gw8wEf
         CCGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wlQFM/A5BU71+fBglJPpL0NMeGiTKC7cetuP7TMdqCvR0YK6s/M75flg+1jGECVcolO7QmZA/XsrU2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YypF7TMrrtZP782g5E7uG3PGCMZ/zRcfo4Me38O1+YEDajvXcYU
	iv4Z2RsTnkrXh8tT+jPRKv5Tqo/vIEYTXWEAazTtgY+Y7FPnYGkDhjEjjl9XHt7IVskbGPKvmAx
	L2rOCVgP1G4uHacPP5SkKBX2ohnmptE721CXC32WmgHLJHKqu4+EiiEDhTqy/0DrzfKolnSQ16j
	51hOKof6tDyST2uxpy2BQVSS5+m4yHtOub6MNxcjU=
X-Gm-Gg: Acq92OETPP6ZJ0DtP7qDZ3Q8rWRaFBtawm3mzUXMyv8he3dmNc16Eo+Vc8aB0FUY0gE
	MBYojPubrUeTm6X2WzWDR7TmHaKxSw7L3zm6eYpAQylwRHOCPdib4YxYpevGPXT5lUwSv+Nn5j1
	iKrNiR82Z7MWh5HTIH2dglyWHP6iapC1Ke4z98Gl3amfe0t5wW9QP0xzmod/NBZZbE9ukdVcRbI
	QkIgSYKxW9FE6CB
X-Received: by 2002:a05:651c:1473:b0:394:184:f7a7 with SMTP id 38308e7fff4ca-396af0640ddmr6172171fa.6.1780469632074;
        Tue, 02 Jun 2026 23:53:52 -0700 (PDT)
X-Received: by 2002:a05:651c:1473:b0:394:184:f7a7 with SMTP id
 38308e7fff4ca-396af0640ddmr6172051fa.6.1780469631660; Tue, 02 Jun 2026
 23:53:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529112357.5079-1-fmancera@suse.de> <20260529134045.56330243@elisabeth>
 <5079261a-79e5-421b-bf6a-a511acaaeca4@kernel.org> <20260601153525.546746a8@elisabeth>
 <CACT4oueDv=KRZmJw=1N58EN7eoFz5AqbBBMP8FE4=+rQ99oFEg@mail.gmail.com> <8e9cbf0a-caff-4575-afb7-fe852df8a51a@kernel.org>
In-Reply-To: <8e9cbf0a-caff-4575-afb7-fe852df8a51a@kernel.org>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Wed, 3 Jun 2026 08:53:40 +0200
X-Gm-Features: AVHnY4Izv8ZOfaMVFpzu_XMyUekVJzqWDGlejEBqBpAhhiBHZ-XfProno9wNXz0
Message-ID: <CACT4oueJ3GsVvnWcZHgYVL-fCjpt5nOw+2=0BTmiz-9xKY4B0w@mail.gmail.com>
Subject: Re: [PATCH net v2] Revert "ipv6: preserve insertion order for
 same-scope addresses"
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Stefano Brivio <sbrivio@redhat.com>, Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org, 
	yuhuang@redhat.com, justin.iurman@gmail.com, horms@kernel.org, 
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net, 
	idosch@nvidia.com, dsahern@kernel.org, Chris Adams <linux@cmadams.net>, 
	David Gibson <david@gibson.dropbear.id.au>, Beniamino Galvani <bgalvani@redhat.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Andrew Lunn <andrew@lunn.ch>, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bIEoqNPWcLU72AjtwC3icECQUJ2lON5qNGXS1BPa9EA_1780469632
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:46=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org>=
 wrote:
> I guess it is safer not to break UAPI and not reapplying the patch,
> especially when there is no clear way to know which order is taken by
> the kernel.
>
> What about clearly stating that the default order is "random", except
> when an additional flag is set to sort them chronologically or the opposi=
te?

Stating that the order is "random" implies that someone will change
the default insertion order in the future, as the documentation says
that it's not UAPI. So they'll cause the UAPI breakage that we are
trying to avoid now. Moreover, if we consider the default order
"random" and state that userspace programs must not rely on it, why
can't we change it now?

As mentioned in the other thread by David, we have programs broken by
the original "fix" (NetworkManager), and programs that will be broken
(again) by the revert (pasta). But more importantly, I think that,
with the revert, there may be programs that are broken but they don't
know it yet. Again, see how `ip addr restore` will be broken again.
So, both solutions are bad, but doing the revert is worse, IMO.

As I'm not much involved in NetworkManager any more, only Beniamino is
who can truly speak on behalf of the NetworkManager project, but as a
former NetworkManager maintainer, I think that my proposal earlier in
this thread is the way to go:
https://lore.kernel.org/netdev/CACT4oueDv=3DKRZmJw=3D1N58EN7eoFz5AqbBBMP8FE=
4=3D+rQ99oFEg@mail.gmail.com/.

It's slightly controversial because it may be considered an UAPI
break, but on the other side it may be considered as a fix to a wrong
implementation of the UAPI, instead, as Stefano pointed out:
https://lore.kernel.org/netdev/20260528165320.15b90ded@elisabeth/

--
=C3=8D=C3=B1igo Huguet

