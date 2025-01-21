Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C3B1BE852
	for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 09:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451594; cv=none; b=BCb21XlXhY9AklHZAaH+V3fQ3Y9pnqCM05hTWfHjSmK7ApjfEyBbZm/0A052LHbFl6lfPzscWFw1GCwt3dzsQFPlq3/8b+8GNjSxA1vBsGboFUKwZ0B7OGYc4pLhLsJ2MO9353MaBhdIuL7fYTiGv1yxs+munQE09LVHOd7Mnvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451594; c=relaxed/simple;
	bh=ZcMl9T7RlCjxuLKbwC1f+xswYX0vEeEEzXWmHSpA/RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u36N2U8WIckzs+5YYhMzNBEnz6Zae6SCBLT+G9aSIJPDfJIEfIowep/RVyBGqg3caFg6JJsXw2N0/Bt/dizrPi2LyIKYO87pkwbojm4CLdkutwXD2hWJMUoFsdz/ybNvfeUEi5OE/h9hbXhcze06TpW9lPEn3XnxuxMn4DigOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CgFOLCrA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CgFOLCrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737451591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcMl9T7RlCjxuLKbwC1f+xswYX0vEeEEzXWmHSpA/RQ=;
	b=CgFOLCrA+D8frHpG+D6DN1+NG6mGXuwK9j0GUn77OR9dpWKX/Qjlml5QhKuehTXLuZnsTS
	LrjvEQgdGQ/GarORehSiYNSxt6DrDyJleFXQLc3adZN7cO9MIiG6btS467DwGh32lmOlB3
	OpZKGxjDwhGG/cx0e0vyIOt1B3mpydY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-m3V6cDYVNr-mcVd_yHbDNg-1; Tue, 21 Jan 2025 04:26:30 -0500
X-MC-Unique: m3V6cDYVNr-mcVd_yHbDNg-1
X-Mimecast-MFC-AGG-ID: m3V6cDYVNr-mcVd_yHbDNg
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e580a642582so224347276.0
        for <regressions@lists.linux.dev>; Tue, 21 Jan 2025 01:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451589; x=1738056389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcMl9T7RlCjxuLKbwC1f+xswYX0vEeEEzXWmHSpA/RQ=;
        b=Di7/+ZGq1Q9sTeF0aa6OT3Lxt0YJAA0PI1x2KNoPiGVdPJT6bAY9slqxv9J6FOnVSu
         yMjqe7NpzU9dMbp3pQQ6C5ox96UpC2oH7r0j+41+5ID1SEMjq5aKrAj0QLTYNQnBGMjU
         WM8Tn94aK1Z1F+/jXHcqiLomlfsOnovl7HHCh+mGX40TVg+S8HxcVskJZyDu9vdZOUtf
         nvleRnGoe19yxAQIVE1vgozW4DWMktBo5C0Awanf3R0LQJF8QPpU+aA8jITfP/aL+eDG
         EBkngXb6owGjZgid0ptBFvdvr28QIcq5WOLPKm7ZPo5tldX6fLTXDAKQhfH8oNhC6+ja
         eybg==
X-Forwarded-Encrypted: i=1; AJvYcCUORtX+XF+DztBStEdHZx9Du5G0eFc+aLcqHDElCvbsNQQIquTITcnvw+qjOjp1Nct6FCoAJkiKatcxRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1XZVPwwAZNe3AQukneSvS0DavYWFEQlb3GNiojcSCmiPGc7gy
	o2oA7yVRz8HEsi4TSpHsi5pjGQs+uTscKNuajZoh02xEFAD9ZDjQS7IK6bQmm46MXIkRiRGv2UM
	+323LqEkmFhQejAa+/0BVO/gGqm9a7O2W9aFN93vdld5iF6m4U4QcmX+p/PWSd7cVt9Rxa4nJ6u
	KW/0YeUUywO9ZRsnOhsjMYBK5ncixOckqv72Q=
X-Gm-Gg: ASbGnctyi1OYPsMg0Jd+BrnZsml3eHLLsC+SC+q/dDsEE7fyh2Yx7hp8d5y7B9koK52
	kzq4aXlROLru+82ZzALLy2P7sFMgFrNzdTfV//pXEHC7GIAmpH+o=
X-Received: by 2002:a05:690c:6d88:b0:6ef:9017:3cc8 with SMTP id 00721157ae682-6f6eb93dd94mr132985717b3.31.1737451589602;
        Tue, 21 Jan 2025 01:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPfcV3sMJ9miaggCNDkRQsuOLJFKzmLYHRfMh84OmMxnALANbXEYiHiQp4ay5q/2m8lQnVzMY1CSPQvi2vReo=
X-Received: by 2002:a05:690c:6d88:b0:6ef:9017:3cc8 with SMTP id
 00721157ae682-6f6eb93dd94mr132985577b3.31.1737451589172; Tue, 21 Jan 2025
 01:26:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
In-Reply-To: <CACW2H-7QEMKA+LUAzFJ+srmRCzSuLk2G7shWt0SGR9SfmxwOjA@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 21 Jan 2025 10:26:17 +0100
X-Gm-Features: AbW1kva06TUn80yX_7OVZOe0yUvWm_8e1UQkb-uvcAJGduBS1LrlbXRwFdyFD3Q
Message-ID: <CAGxU2F4_59X-Fj7vRCoDqM394699uxqLQZ5yCuH+jXUYcYO81g@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.10.1
 and kernel 6.6.70
To: Simon Kaegi <simon.kaegi@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Martin KaFai Lau <kafai@fb.com>, Kuniyuki Iwashima <kuniyu@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JvvjDePfDmHhJ-k4ZJO1zvIon9u5iQv2xBF5QMdWjMc_1737451589
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Simon,

On Tue, 21 Jan 2025 at 05:53, Simon Kaegi <simon.kaegi@gmail.com> wrote:
>
> #regzbot introduced v6.6.69..v6.6.70
> #regzbot introduced: ad91a2dacbf8c26a446658cdd55e8324dfeff1e7
>
> We hit this regression when updating our guest vm kernel from 6.6.69
> to 6.6.70 -- bisecting, this problem was introduced in
> ad91a2dacbf8c26a446658cdd55e8324dfeff1e7 -- net: restrict SO_REUSEPORT
> to inet sockets
>
> We're getting a timeout when trying to connect to the vsocket in the
> guest VM when launching a kata containers 3.10.1 agent which
> unsurprisingly ... uses a vsocket to communicate back to the host.
>
> We updated this commit and added an additional sk_is_vsock check and
> recompiled and this works correctly for us.
> - if (valbool && !sk_is_inet(sk))
> + if (valbool && !(sk_is_inet(sk) || sk_is_vsock(sk)))
>
> My understanding is limited here so I've added Stefano as he is likely
> to better understand what makes sense here.

Thanks for adding me, do you have a reproducer here?

AFAIK in AF_VSOCK we never supported SO_REUSEPORT, so it seems strange to me.

I understand that the patch you refer to actually changes the behavior
of setsockopt(..., SO_REUSEPORT, ...) on an AF_VSOCK socket, where it
used to return successfully before that change, but now returns an
error, but subsequent binds should have still failed even without this
patch.

Do you actually use the SO_REUSEPORT feature on AF_VSOCK?

If so, I need to better understand if the core socket does anything,
but as I recall AF_VSOCK allocates ports internally, so I don't think
multiple binds on the same port have ever been supported.

Thanks,
Stefano

