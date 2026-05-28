Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE331E825
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779996141; cv=none; b=GIcah7wqoUspyu3xQSZuZbjnBOa7XNyco1doh8ZkLRZo4I6OCzdOajar99R7PV+QQqhC5KJFfM8kZkhLrJLO3SG1SxRB/nkJIEF4B7PYk8p37WBA69Xi/W5P0YO4UoWVklckOpAeOOei/qBN+7U5aGYjT9WsMO7qTtIweKdOaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779996141; c=relaxed/simple;
	bh=u/Nf5wwZ1Y2ZoGMDhtOo0BSYQu4fhwGyzdJoJEWlzQg=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=tVZFJRpzdAy2NL38DbOzV3WZQls7Ifv4GAmLK7v2hEDHhvuVOQaiGt9IYzYQQ9rSVcIDueX9VUNfLmlz4qeClbLAHyMr805kqD/g1XcGnb7cc9GHnVOZkUNxAdehCUyoG3cR1lu02DlTVEHEld5LKMmhIhTDvy4ODn1Cu3MimM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bk5kGlNx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bk5kGlNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJM22Y+VfZuCTRHYr0LnFqAHk1a3xks2PK09mYhWGF0=;
	b=Bk5kGlNxW67k8kZ2fV67uPQEXdJNQeURQEO1ITa8Gpv6ZoFa8hFOl+JxchdS550+XHSOQE
	5h5qx3eNjmQ5ORFCQD7UhT1+agX2qgdItvCK3Eb2iZ9YAl1PqyZ4RxqhgljGxiTQoqOPXX
	KJRL0iKC6UWeKyB5Q/oRSfl2YBqLdS8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-jCjmYzicNnuquuBtRQMC4g-1; Thu, 28 May 2026 15:22:18 -0400
X-MC-Unique: jCjmYzicNnuquuBtRQMC4g-1
X-Mimecast-MFC-AGG-ID: jCjmYzicNnuquuBtRQMC4g_1779996137
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49058295985so36123795e9.2
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 12:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779996137; x=1780600937;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dx/6eLItiucIm4A2R0ZnASp+ymf3y4PKplbSYqHwDcA=;
        b=pBlpEEbul6xE93In0WH1hxUWvv6oQAnuLuYGDuEPxWYdjgGUzfs4quNFXzK+BLvxbe
         E3VMUBHG+IVA+4L9DFtmNckei1U1R+HLJJrrmYeiJYDxVDF+2QLN+jMSR1xT7EiyNAbS
         aAyN7D52MXejz44K4QtewH8XhLaSsJOBVLr/LkRo2e62+Xov8YciOw37KObt76b/8kgg
         BGp10QKBMGts8vQa+8nN0r+BROs08PjPiI1tcbRKiDY0D4jGV4Id1QFFkVbBf/p2JQcu
         aqq1R9KMuYPqF9Hkm3Et7m9wRCn8rPQtH/IRFqMJqVy1Ks6FWzAo5+53TKsum0iV7DH/
         oIJg==
X-Forwarded-Encrypted: i=1; AFNElJ+Qsu+J9ARs06FVSUsOBoiMgNai1RReG6lD3+19twYNMpIQ8c1evAgdUqXzR/aYw7PBluT5UV8i5fFT/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgLiB9CsTzNWjo5ZToy7WADuuiXdl/zWH5ry0r8L4/iHo8lnVK
	fG5Hdgecjl7oekhMyAmFgl+7bOEaEyFw/gQ1qZ1r93O6R0blaXr3wm+7BD31sD/7xn9FPfYnCMd
	QX+8aXVbyFAVsCJtY5r4heHWXYlzzsOdLSVnp+KNJnS6cAEJrgWhuglXDxmUWgflz
X-Gm-Gg: Acq92OF3/XrbWJu5MzyNNpZXB9Khfnf8d9hfEtuj0mlxFOK6l3GH1+gGIBwKr7s9N0T
	V9xiFv9TaYPButB7lAvAxWivQjVNKLFqgUpw603DHcHGI82cOZqg4pSJgq+8E0uqa2Z6jxzE6Uq
	FtKjRYcM0JX+eZ5pa1+HIq9XOKzA9kgN2V3+DFEVir7a2HNHMcR7GwDpYmJUN7Z1eUA8Nyveh7U
	1H7p8M51lLbMEPbCbgy6gxCuoRaRU6+mQ6AO4vRXUpyRf/+BFGoPkBcJYHtNkAchDbkBD4fxjzq
	yXHqaz/QgfXVS8OyxYkshHecepHcwHKFjqafapgWXnAkSzm6QiDvHA3mC6RGSkTuyu8xdLWOcRU
	FILgFeLnrSThFQEjYUNyGqQv2cAUv64bVoq6R/+Y76+NoR0zFVCwhtw/DRJIJ
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-49044ebc2d5mr519116575e9.30.1779996136513;
        Thu, 28 May 2026 12:22:16 -0700 (PDT)
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-49044ebc2d5mr519115935e9.30.1779996135923;
        Thu, 28 May 2026 12:22:15 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909bba94aasm374245e9.16.2026.05.28.12.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:22:15 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Beniamino Galvani <bgalvani@redhat.com>, =?UTF-8?B?w43DsWlnbw==?= Huguet
 <ihuguet@redhat.com>, Thorsten Leemhuis <regressions@leemhuis.info>, Jakub
 Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Yumei Huang
 <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, Justin Iurman
 <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Linux kernel regressions list
 <regressions@lists.linux.dev>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260528212213.4aa613f8@elisabeth>
In-Reply-To: <e91507d6-cbfc-447c-8236-d9b3d91f18c5@suse.de>
References: <675083b4-e015-4ff3-836c-798e0a971194@suse.de>
	<20260528073849.759da84a@elisabeth>
	<baba855a-7cc9-409e-9c20-6e50f35d255a@suse.de>
	<20260528131250.1352ab48@elisabeth>
	<b21c598b-879c-4f6a-9dc8-27e5c362803b@suse.de>
	<bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info>
	<20260528153202.14900687@elisabeth>
	<CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com>
	<20260528165320.15b90ded@elisabeth>
	<CACT4oue2EMM9Kfsm9Jii2rG9ooi=D37PK=8886cpLuBkwhrOxw@mail.gmail.com>
	<ahhm1-XfnsWyIWDV@tp>
	<20260528192143.31c9e9ea@elisabeth>
	<ed954836-742a-44c3-8c2d-65dd06c3514e@suse.de>
	<e91507d6-cbfc-447c-8236-d9b3d91f18c5@suse.de>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 28 May 2026 21:22:14 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sc9qgRF56-byr6NQthNhqUqSt4oQJSxisbuTyPsnxqI_1779996137
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 28 May 2026 20:50:48 +0200
Fernando Fernandez Mancera <fmancera@suse.de> wrote:

> On 5/28/26 8:42 PM, Fernando Fernandez Mancera wrote:
> > On 5/28/26 7:21 PM, Stefano Brivio wrote: =20
> >> On Thu, 28 May 2026 18:01:27 +0200 Beniamino Galvani
> >> <bgalvani@redhat.com> wrote:
> >> =20
> >>> On Thu, May 28, 2026 at 05:24:28PM +0200, =C3=8D=C3=B1igo Huguet wrot=
e: =20
> >>>> On Thu, May 28, 2026 at 4:53=E2=80=AFPM Stefano Brivio
> >>>> <sbrivio@redhat.com> wrote: =20
> >>>>> I think what's considered UAPI in this case isn't so clear-
> >>>>> cut. I guess it would have been pretty hard for anybody not
> >>>>> familiar with NetworkManager's codebase to imagine that an
> >>>>> application would rely on IPv6 addresses (and only IPv6) to be
> >>>>> returned in the reverse order. =20
> >>>>
> >>>> IMHO it's not because an application would rely on the order.
> >>>> It's because the order matters, as the first one is considered
> >>>> the primary. =20
> >>
> >> Yes, that's also the case, but:
> >> =20
> >>>> This is not NetworkManager specific. Or I am mistaken? I'm
> >>>> speaking by memory =20
> >>
> >> ...from what I understood of the issue at hand there's a part that's=
=20
> >> specific to NetworkManager here, because NetworkManager replaces /=20
> >> deletes the Privacy Extensions addresses, instead of different=20
> >> addresses, because it relies on that specific (reversed) order.
> >>
> >> Anyway, yes, I see your point about UAPI now.
> >> =20
> >>> Yes, exactly. If you do:
> >>>
> >>> ip addr add dev X 3fff::1/64 ip addr dev dev X 3fff::2/64
> >>>
> >>> then the old kernel chooses the address that was added last as
> >>> source address for outgoing communications. With the new kernel it
> >>> chooses the address that was added first.
> >>>
> >>> I think that any script or network management tool that cares
> >>> about the source address selection is impacted. Indeed, the commit
> >>> had effects on one of the selftests, which had to be modified to
> >>> change the order of iproute2 invocations.
> >>> =20
> >>>>>> If the fix must be in NetworkManager, we only need to parse
> >>>>>> them in non-reverse order like IPv4, I guess. =20
> >>>>>
> >>>>> But that would then require some form of detection, and, at
> >>>>> least according to Fernando, isn't the most robust option
> >>>>> anyway, as ideally NetworkManager shouldn't rely on the order
> >>>>> at all. =20
> >>>>
> >>>> True =20
> >>>
> >>> Correct, if the new behavior is considered better, there should be
> >>> a way to detect which order must be used. Otherwise userspace
> >>> tools won't be able to maintain the same behavior with different
> >>> kernels. =20
> >>
> >> My remark here is about whether NetworkManager needs to detect this
> >> at all. If it used timestamps to detect recent / older addresses, as=
=20
> >> Fernando mentioned, then you wouldn't need any detection at all,
> >> right? Or is there something else we're missing?
> >> =20
> >=20
> > Ohno. Now that Beniamino and I=C3=B1igo mentioned it, this will likely =
break
> > many other environments. In essence, many tools relies on the previous=
=20
> > ordering to identify which address is the primary one.
> >=20
> > E.g cloud tooling communicating with the metadata server via IMDS(v2) t=
o=20
> > configure IPv6 primary and secondary addresses. They are likely relying=
=20
> > on the ordering for that.

I haven't seen any tool specifically relying on insertion order for
this so far and I'm having a hard time believing this kind of tooling
wouldn't rely explicitly on home / care-of addresses or different
labels -- see RFC 5014 and RFC 6724 Section 5. (or, perhaps clearer,
the examples in section 10.1, in particular rule 4. and rule 6.

But I'll look for more convincing examples in a bit (maybe you have some
at hand?)

This is all implemented by __ipv6_dev_get_saddr() and friends, by the way.

> > So maybe we could fix whatever is wrong with NetworkManager and=20
> > temporary addresses order but I don't think this will scale for the=20
> > cloud tooling with the primary/secondary issue.
> >  =20
> >> By the way, if really needed, one could detect that with the
> >> equivalent of:
> >>
> >> ip a a ::2 dev lo && ip a a ::3 dev lo && [ $(ip -6 -j a | jq -rM '.
> >> [] .addr_info[0].local') =3D ::3 ] && echo wrong || echo right
> >>
> >> ...depending on the application, that's not necessarily practical,
> >> but so far we have no evidence of any application needing to do that
> >> at all.
> >=20
> > Plenty of tools (NetworkManager included) uses netlink so this isn't=20
> > useful for them.
> >=20
> > For now I am more in favor of the revert and to look for an alternative=
=20
> > for pasta situation (like using a flag or something). But I am not a=20
> > maintainer so it isn't my call :)

One question I started wondering about later is: should the flag affect
insertion or reporting, in case? I think we would need one for
insertion, otherwise it's not really generic / functional.

> *facepalm* I just noticed the "with the equivalent of", disregard this=20
> last part tho.

Right, yeah, having a netlink implementation makes that a bit more
convenient. :)

--=20
Stefano

