Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD21F3ABDA5
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320936; cv=none; b=UO2FDPOeNU6yyTPFbEJdbk9NAlrcrEUat5WxOjlymAvD6flD1UjMbYVSG91DuE2pkkrOqV1P1J81mSHSAEidJW3+K/UReogLeInGhkFQCX7Nx3XllPS2Lr6t74Ps1wfwmzbkSv6kiFxAMDLTjAljlTaM5NJFUHS/5GPAFmB8+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320936; c=relaxed/simple;
	bh=lp/ptwOz8oBpXlR0XAK87MgxzNA2RgBiY99KrvD5giU=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=fktUs44hHVR7uFfpf5kDTG/d7jXIqfvT1jyqPTRmKmoieysIl6POz21GXMy741dMbN6cOLEJmXYMOllLuauuBdRKCh/GGHWSWJXvUlIACVtdQz+QYb2DdWsxSemPe6CiAhFVaIbgc7g91ri+/DLSzpihzgNlr1tNR/Pajtdysx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MiJ1Z8tQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MiJ1Z8tQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780320934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nW2y5EELGA92Nmgu/h+V2tbcAAK8XuFhP0KJ13qmAlI=;
	b=MiJ1Z8tQZE4Dst/7Kku1LrOAa86eWKYrUZCBshMzlQ+I9J1ihl2QYVAZMqMWONZzlA4qmm
	C8u/pz/GERjdke/Bj6GEFklbGrqXl3JllVfX0e16TwUYSpMm9kev3QecFNihP1EYTSyEcO
	+1hlDCWIobLWQDYNB6R+B7HjhYt1GsA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-ZUzhXLwvP-6zDkODh0VcfQ-1; Mon, 01 Jun 2026 09:35:30 -0400
X-MC-Unique: ZUzhXLwvP-6zDkODh0VcfQ-1
X-Mimecast-MFC-AGG-ID: ZUzhXLwvP-6zDkODh0VcfQ_1780320929
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45ef55779d1so1587913f8f.0
        for <regressions@lists.linux.dev>; Mon, 01 Jun 2026 06:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320929; x=1780925729;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nW2y5EELGA92Nmgu/h+V2tbcAAK8XuFhP0KJ13qmAlI=;
        b=W1Spux/9QTDSy7nCCd/Uiq8tpL8M9XhiF26lqmwEOPD9OXSgVKiQM53jUzvGkww9sZ
         k8Mlm9FoA2rTerhE5gFZy9LVZUAjypxZgwh+8gR/rfYg/PJjaYKSdaSmaNrN0tImMRgh
         UhKNk4roD+iw5OGGE6BHQMDk6CfU0U9e4w+bo7hyv9UJQkswVklHBvO71/djsS404xZg
         Rrws1r1MJNY4sIzYZLN6VJEED3Sh6VXlkB+dgK6rmtV81iQ4eRR211d125oWFyhV35Rw
         1X+lWUT6prJOriHB4/lI4Jp6VkeDJ5zNZIlVSGWAY8wkqs4FXhVikTuKmRRN7JNFFghk
         Hucg==
X-Forwarded-Encrypted: i=1; AFNElJ/M1usqdT+4ExOlDUQyw3UAd6dUk7CC+BkLlHl6QMr9HW/L+2/V/8OLj49enKUz3ALhKT6CKAhBiccYhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxInu2lGDhEs+mHVHWFlrZmU/5C8pG2Fxf5QaExnOxWJRo+2Ym
	sj+UDM/Ke7eaY6Eh2G1OXISs3lf+gzvIKmTR0a/Lsz5A+gDSD7tcWtupohhaA+VS8ZhGanOUpKx
	JrVGGF1xnbP8GeeCyat+olHIcsalM9aFypB+mWSsTNG8eK8Osq6zTbmpbbZ5vU/8V
X-Gm-Gg: Acq92OEEojTan9/KOh69VpfeTnHGiSLP0codKnkr5IdT1s3JAQRbWxvT68aHK/ceA44
	qdEiw4B7wesIutyNyvpn3j5gR6Ao4CDJ77dkei0ZMegX+Do6kv1hmj3Csdpb7xQYDNbPcpE+DQp
	3r/HH8c3FY7ajW/hVs0iRpCX2g4a3tsG2wtdGw/Ac//B1r1w1bMS2qQvFI0hF+vgqGegztMMy0S
	OGrW+f1FMi011JMzNRy2LyqqN2GHTgUA+ozWmJ9CHV+CF+IQoQhZYhMvCDEH2DnaECQeBNcOyBt
	Ce8gw3Q4NWnR/hBQM4Q9X+E/2qUzefscHLvTkZd8ZUIrSoSOo74u4Ya4GqFY+5h/sX7S/KhmZtJ
	x4ryWalaC+iROMfP5ayHBOmvvz7m5yBtTGmaZ7m14HvB/hffJVZaVTN9OG+0y
X-Received: by 2002:adf:fad1:0:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-45ef6b6b608mr14976902f8f.20.1780320928612;
        Mon, 01 Jun 2026 06:35:28 -0700 (PDT)
X-Received: by 2002:adf:fad1:0:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-45ef6b6b608mr14976832f8f.20.1780320927919;
        Mon, 01 Jun 2026 06:35:27 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm24806726f8f.3.2026.06.01.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:35:27 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org,
 yuhuang@redhat.com, justin.iurman@gmail.com, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, idosch@nvidia.com, dsahern@kernel.org, Chris Adams
 <linux@cmadams.net>, David Gibson <david@gibson.dropbear.id.au>, Beniamino
 Galvani <bgalvani@redhat.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Andrew Lunn <andrew@lunn.ch>,
 ihuguet@redhat.com, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] Revert "ipv6: preserve insertion order for
 same-scope addresses"
Message-ID: <20260601153525.546746a8@elisabeth>
In-Reply-To: <5079261a-79e5-421b-bf6a-a511acaaeca4@kernel.org>
References: <20260529112357.5079-1-fmancera@suse.de>
	<20260529134045.56330243@elisabeth>
	<5079261a-79e5-421b-bf6a-a511acaaeca4@kernel.org>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 15:35:26 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TwaW0CVxzjxUtegyGWwhcN-Y0P0xigLeqvjgloxivTE_1780320929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Jun 2026 12:03:59 +1000
Matthieu Baerts <matttbe@kernel.org> wrote:

> Hi Stefano,
> 
> On 29/05/2026 21:41, Stefano Brivio wrote:
> > On Fri, 29 May 2026 13:23:57 +0200
> > Fernando Fernandez Mancera <fmancera@suse.de> wrote:
> >   
> >> Chris Adams reported that preserving insertion order for same-scope
> >> addresses is causing SSH connections to be dropped after stopping a VM
> >> while running NetworkManager.
> >>
> >> NetworkManager caches the IPv6 address configuration, when a RA arrives,
> >> it determines the list of addresses to configure and checks if the
> >> addresses are already in the right order in the kernel. If they aren't,
> >> NetworkManager removes and re-adds them to achieve the desired order.
> >>
> >> As the order changes, NetworkManager is confused and reconfigures the
> >> addresses on every update. In addition, this would also affect to cloud
> >> tooling that relies on IPv6 addresses order to identify primary and
> >> secondaries addresses.  
> > 
> > By the way, I'm still looking into this part, trying to find
> > "problematic" examples.
> > 
> > And I couldn't find any, yet, because it looks like there's always a
> > _single_ IPv6 address being used as a secondary for a primary IPv4
> > address.  
> 
> FYI, the order change also affected some specific scripts, e.g. here
> with MPTCP and packetdrill:
> 
>   https://github.com/multipath-tcp/packetdrill/commit/1b7cd4482ce8
> 
> Because the order was not "natural" before, and different from IPv4, a
> workaround was needed to keep the same order. I was happy to remove it,
> but now it looks like I need to re-apply it :)

Ouch. :) We were are also pondering about some kind of workaround like
that (https://bugs.passt.top/show_bug.cgi?id=175#c9) but fixing the
kernel looked simpler and the right thing to do... until last week.

> It would be nice to get the "natural" order back without breaking the
> userspace (or with a way to choose the order).

I was thinking that if we implement a label like NLM_F_INSERT_LAST
(David's proposal for the name), we could patch iproute2 to set it on
'ip address restore' at least, other than using it in pasta(1).

But that wouldn't be enough for your case. At the same time always
adding it for RTM_NEWADDR requests in iproute2 could break somebody
else's scripts. I guess a reasonable solution could be to add an
additional parameter for ip-address... 'insert_last'? 'last'?

-- 
Stefano

