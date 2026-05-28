Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F11C3F0C
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981890; cv=none; b=PFhPnNdsnIGS14C2/0Ci6x6IwoevTYN+p+OWKmcZgCRqchNHd8xsWmmNE/rmpxB0XNVrzKgketNxHMYXTXHEcSAyLWU0lEWKiMzZ6SSb5ZZjbRTxnWlDmD9V5+oI+3Bvu++3mfNZIw2tzO0bm2+/tYOzntAVGbYOtPdU6C3jnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981890; c=relaxed/simple;
	bh=mOD8V8VO94Vl73+R9IBAuZyeEdW5VU83FuEiKr7xxNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZz3rJPRmi3wy5HmaqVL7HoM57K8SNGfAo/WhyjHdrkcs5oVydNhAR/f+xdf/Cg2VRb5RgmFrVAAbZ1fK475mV1IxWOJBPQp0lfshaMJkc/cgbaA24gpUdgi/oNZjcJ6toUPWJHAywIQqfD10aqrx0U926k7cUuErIaVmPPZ9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SwRMCc3i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SwRMCc3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779981888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mOD8V8VO94Vl73+R9IBAuZyeEdW5VU83FuEiKr7xxNU=;
	b=SwRMCc3iOZXC5XeC8Jbs4c0f1+DDwhZzHEzM4+1zg/YFGQJSvDaE3tGPYbltCdy7JlWJyy
	7vNq0FsII5GSxe4aOzAydw8DXtBVlyjOJbYaQNvnqsWlq7kRWyFfQtkHSgIWymVHFA+E8p
	9CdAvrKDGUI55pfhG2mlKC8LERG61vA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-9T0i1ygGNwCZ6rfof0F0SA-1; Thu, 28 May 2026 11:24:44 -0400
X-MC-Unique: 9T0i1ygGNwCZ6rfof0F0SA-1
X-Mimecast-MFC-AGG-ID: 9T0i1ygGNwCZ6rfof0F0SA_1779981883
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5a87c6e101aso7670786e87.1
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 08:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981883; x=1780586683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mOD8V8VO94Vl73+R9IBAuZyeEdW5VU83FuEiKr7xxNU=;
        b=ZNvvGLV+6//5oFvzO0huA78aMuin0lEa3HZxmAYDnXnLgpI+mSkYNRjCWrooaQnqlq
         QczGE0jpsEa9uL/lHLWTl0LI4ImfVGwjnC71YvLKlVasB/2CWrKeJoe+ObsDoC81Y/gb
         Y0Zn+gn8VqwSqmCHwhihhaflEdvOdTSPZGz3+1ZxN1RmhVcutRUlvsExnfV1sUpq4eps
         eE2U6OIsU8ZGTydeiaif60A6JAnmb6dFw7ss+42yEwiP24RhOCfYKdN/DPrBe2x8vOvD
         9MgXiiRR7MtVChJ4dHpIbv7rUsxhzWcvBwHSmvid9qLOU1JeULVShpaLX6yEU7KUmEXw
         M1QA==
X-Forwarded-Encrypted: i=1; AFNElJ8JdjbX1FrIejxqQwaYhrodtuzNWF6EhaV1g6pCG60w7Wu1bohCInR1Bkl0cMEajNUUb4uZeZq8FNHTmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDktpXJ5cOZiaSMr8es/Q7kct91IGFEABhJrAP0Ho2qdtRRiRU
	LHxcJovq8qxRG6VcUSEZCwvJFr98TQ2y7woLUp3P4Q7xwSIBk7pjQmyyr/fC9F6iYfRstrwwjUZ
	5of+yso5APgfngM8Tjz0n9HAnGVO2OLyRudhu9WqovAywdUAwCnl1HNZM/JLfsqy+Tb6LkZC2vV
	LEQvWimRjAbW3/7xvWEKEUG9KSzwh5xf/aL25/UnU=
X-Gm-Gg: Acq92OHocdHuWzLNMgMZjdlTzmz8vVYXHsczIxCEHrGHfNwwqN9USmfY76/La/eNwNa
	bWX0xtDByER3Xg9kGKGkHxPw7HxSMZo7u5V6+2RT1z1mqaVfEFDwPgBnFI91XjljhosUYQKcL43
	nV3vASFVB/a1nSVPSVauAO8I1rISmsUSnXRdD2bmvVqTLwCtvlrvdczdp/KLhk/Bhwb24SA2bRT
	aw6C5LIxSbr8n7F
X-Received: by 2002:a05:6512:a8c:b0:5a8:8818:819c with SMTP id 2adb3069b0e04-5aa52de085bmr540750e87.16.1779981882590;
        Thu, 28 May 2026 08:24:42 -0700 (PDT)
X-Received: by 2002:a05:6512:a8c:b0:5a8:8818:819c with SMTP id
 2adb3069b0e04-5aa52de085bmr540720e87.16.1779981880632; Thu, 28 May 2026
 08:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521135310.GC977@cmadams.net> <20260526175743.1f2c3761@kernel.org>
 <20260527010641.GA21073@cmadams.net> <20260526183122.348e44e7@kernel.org>
 <20260527215135.GB16443@cmadams.net> <675083b4-e015-4ff3-836c-798e0a971194@suse.de>
 <20260528073849.759da84a@elisabeth> <baba855a-7cc9-409e-9c20-6e50f35d255a@suse.de>
 <20260528131250.1352ab48@elisabeth> <b21c598b-879c-4f6a-9dc8-27e5c362803b@suse.de>
 <bd669eaf-64dc-4217-bae0-4a531e473762@leemhuis.info> <20260528153202.14900687@elisabeth>
 <CACT4ouf5ZqGgb=RO8_7NovLCvYKLKL4vD70dEe6xUODT1UEcSA@mail.gmail.com> <20260528165320.15b90ded@elisabeth>
In-Reply-To: <20260528165320.15b90ded@elisabeth>
From: =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
Date: Thu, 28 May 2026 17:24:28 +0200
X-Gm-Features: AVHnY4KanMkNYucjpl0BDejBeU1pjXJHqUd5hPA1HaiCXMbtsv0cmAp2Hlko-1w
Message-ID: <CACT4oue2EMM9Kfsm9Jii2rG9ooi=D37PK=8886cpLuBkwhrOxw@mail.gmail.com>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Yumei Huang <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, 
	Justin Iurman <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Beniamino Galvani <bgalvani@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n6ZR0kaZLMaMI3zKdU03UH7O34AbJ2omO5yq0zjoGFg_1779981883
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 4:53=E2=80=AFPM Stefano Brivio <sbrivio@redhat.com>=
 wrote:
> I think what's considered UAPI in this case isn't so clear-cut. I guess
> it would have been pretty hard for anybody not familiar with
> NetworkManager's codebase to imagine that an application would rely on
> IPv6 addresses (and only IPv6) to be returned in the reverse order.

IMHO it's not because an application would rely on the order. It's
because the order matters, as the first one is considered the primary.
This is not NetworkManager specific. Or I am mistaken? I'm speaking by
memory

> Pushing this to the extreme, one could argue for example that if we
> accidentally byteswapped the last 16 bits of some IPv6 addresses, and
> NetworkManager started to work around that, that would start being
> considered established UAPI...

Fair enough. To some extent, it could be considered a long-standing
bug. You can fix bugs even if userspace programs started to workaround
them.

But, on the other side, it can be easier considered just a bad design
that, after a long time, should not be changed anymore because it's a
established UAPI.

> > If the fix must be in NetworkManager, we only need to parse them in
> > non-reverse order like IPv4, I guess.
>
> But that would then require some form of detection, and, at least
> according to Fernando, isn't the most robust option anyway, as ideally
> NetworkManager shouldn't rely on the order at all.

True

> Wait... that's how confusing it is. That's also what I thought at the
> beginning of https://bugs.passt.top/show_bug.cgi?id=3D175, but it turned
> out that insertion is actually reversed for IPv6. Dump isn't.

Uh, OK. That's even worse because even scripts using `ip addr add ...`
may think the first inserted address is the primary.

As I said, I leave for Beniamino the considerations from the
NetworkManager side.

--=20
=C3=8D=C3=B1igo Huguet

