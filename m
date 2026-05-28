Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83620421F1B
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 16:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984095; cv=none; b=dg4CabvdgcDnFBewxqtqGcAj9rj4rQySHLqvAXW/8k9KqQzx+dNrjab3T/d/tuPT8+n4+SDE2JOgCHti+0fCkddj+eJfFy5A2Tis3isE63/OuCJdLCI5R2yrl0AaShkvpdDYvA4LG7yVkRgB4QRdwbwhFiLqabBDWNvyHJkPCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984095; c=relaxed/simple;
	bh=/UWIrCDt0JHQs55xLO8CjfD0M54dmvXpB7PRriNg6Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XaUasHJc5oE0Lro7eXPhedva0Tc1jAtQ/JUwXUBPGSamrigz95G4i8bJEyo4UIgu4EPPvJYUzjyXl7rovDfaRu4SgCd/e2kK5m93/AlFybikL6K6nYeXgukhb9/IxF/EOO/JsUx+9CNdk0FPNeAdy9SQZdu18CKau13l5mfn4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BLst1YZD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BLst1YZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779984093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cao5gERt16FVWVNp7KK/pfGkUyLMcAKURayz3il4e7o=;
	b=BLst1YZDbtgGN/ok2f2lBiAwsS6SfM5Awb9N5UYoqH0m2HlRM8bIzasri/uRH3DUo6r3z+
	a4xn9+qJm1NHxTQXvsLsTfxAGh/fbuN12HIKUPKeitH70J6Fz5ROJ/+D9Hd0eawusrheHt
	sryOaob5s5EmAM67Zi5m205EPTcH/4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-ZL7aNmoGNLG1nW4ibixgzg-1; Thu, 28 May 2026 12:01:31 -0400
X-MC-Unique: ZL7aNmoGNLG1nW4ibixgzg-1
X-Mimecast-MFC-AGG-ID: ZL7aNmoGNLG1nW4ibixgzg_1779984091
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4903d9a0e45so3225365e9.3
        for <regressions@lists.linux.dev>; Thu, 28 May 2026 09:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984090; x=1780588890;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cao5gERt16FVWVNp7KK/pfGkUyLMcAKURayz3il4e7o=;
        b=G31BkmOJbLAt5eMOaMJ2wgPHUrxWNMQYZH9FWmXwcglX6umf4NfiLr87FvtpziP4PE
         jmWOf6esxE6zQ46G1lvOxeP3obBg2gF0vnEvyoCYcFyEeKC8anNePF1K8fwrnt1KQy2y
         7yn1T4FKyPT9QYEsyIdP2upbdNI92VAWQGmX5SRql3tJAZVmgPxYNUhI+wPcQOOQzN4g
         WGnMJMouPLMFNLKpN+/+1vVVB/HfXc2W8BJZHurOY6iuJHEbewcjz1taD9LMjiVST6A/
         ucfmnnyvY6ntH1gyilSkEi15TKn48iI9JIZmjrPBvWck+iTyQEVOLq0h9XMf1aF6CR5M
         krCw==
X-Forwarded-Encrypted: i=1; AFNElJ99jGXxCEUd5e5tBR1tYRPZ0xfM23Bu/n715KixmzoxIrLhxXwehRAfJqbs+obnBTGd39ZlosHnCxEwuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzADYceNcnclqvi59zlfnvih7o+amIK6TxKcb9LoHzpo1s9M+Vv
	h3UPeZ9PVj1wQ+THW9JieJ85Pt2uWsLZ+e7gl93qfLacJ1BqGXM+Jw7AAu4HYgPVcqEixS8nZ35
	o45Lny4K6ddgdFzuXxOV4dSjOqz1gj7rO5U+YaPLXq6odgmz9Pm9MNkQ0wKAJHKU=
X-Gm-Gg: Acq92OE9bgqv+ecZDI9GVRYCsEZ8YMMMcyp8NXqUYgsWrViOaM1rcAYVW3Ulctgww0w
	9M8f7U/S5JmOqoj369eX81O60u616ZndUPciNe35/frIO2MeIutkKzymSEg2qlXyZCNZsuMXP9Q
	5h/iC7ETYH7a8y+tkeUPzJDngIZkBUeQgEPsm9UPhc56uvgxzaTY/5kDO71bgCq76pFAbko90Wg
	vY3eULxonW1f5Y3lY6zvmhKJXY6SoeCvpw6djdD7KfGQrppdcJ7x7vpDv1nP797yjDmhG0T3Ol5
	j4dYcFjZHpRhYvX3Za/H1akm+ah6PgaVHgsoZ767Gqrn/KhuOGwMi98DkUHRSJEJ13iu3nhZRbZ
	PaG1zETfV65b+2stWcsBt2A==
X-Received: by 2002:a5d:5f56:0:b0:44c:e7f6:3a5c with SMTP id ffacd0b85a97d-45ee51f1528mr2934776f8f.0.1779984090435;
        Thu, 28 May 2026 09:01:30 -0700 (PDT)
X-Received: by 2002:a5d:5f56:0:b0:44c:e7f6:3a5c with SMTP id ffacd0b85a97d-45ee51f1528mr2934730f8f.0.1779984089798;
        Thu, 28 May 2026 09:01:29 -0700 (PDT)
Received: from tp ([2a02:29e1:404:f800:9fbc:ecd8:5c1a:509c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b2bbfsm14995087f8f.32.2026.05.28.09.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:01:29 -0700 (PDT)
Date: Thu, 28 May 2026 18:01:27 +0200
From: Beniamino Galvani <bgalvani@redhat.com>
To: =?iso-8859-1?B?zfFpZ28=?= Huguet <ihuguet@redhat.com>
Cc: Stefano Brivio <sbrivio@redhat.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Yumei Huang <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <ahhm1-XfnsWyIWDV@tp>
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
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACT4oue2EMM9Kfsm9Jii2rG9ooi=D37PK=8886cpLuBkwhrOxw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NIZcYv-C0OxjxZMki8NgrS-2UsDevIxuRCOKx8Ac1ew_1779984091
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 28, 2026 at 05:24:28PM +0200, Íñigo Huguet wrote:
> On Thu, May 28, 2026 at 4:53 PM Stefano Brivio <sbrivio@redhat.com> wrote:
> > I think what's considered UAPI in this case isn't so clear-cut. I guess
> > it would have been pretty hard for anybody not familiar with
> > NetworkManager's codebase to imagine that an application would rely on
> > IPv6 addresses (and only IPv6) to be returned in the reverse order.
> 
> IMHO it's not because an application would rely on the order. It's
> because the order matters, as the first one is considered the primary.
> This is not NetworkManager specific. Or I am mistaken? I'm speaking by
> memory

Yes, exactly. If you do:

 ip addr add dev X 3fff::1/64
 ip addr dev dev X 3fff::2/64

then the old kernel chooses the address that was added last as source
address for outgoing communications. With the new kernel it chooses
the address that was added first.

I think that any script or network management tool that cares about
the source address selection is impacted. Indeed, the commit had
effects on one of the selftests, which had to be modified to change
the order of iproute2 invocations.
 
> > > If the fix must be in NetworkManager, we only need to parse them in
> > > non-reverse order like IPv4, I guess.
> >
> > But that would then require some form of detection, and, at least
> > according to Fernando, isn't the most robust option anyway, as ideally
> > NetworkManager shouldn't rely on the order at all.
> 
> True

Correct, if the new behavior is considered better, there should be a
way to detect which order must be used. Otherwise userspace tools
won't be able to maintain the same behavior with different kernels.

Beniamino

