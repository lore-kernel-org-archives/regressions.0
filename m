Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61548489873
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505745; cv=pass; b=e7vElWkGIdh/gjjokPGfCDTmNKuo1XrthwDjlHyDYVkLai2i79GcnjN6JQHiot2gj6ICEKiipbOKJX84uY2+fxNdi1SfvA94qNai4HpHwvol+IVQ25Sod133jhjPseMnTzTy+SQO0CBXDtg3APSOHxelup5T3tZU1TbV5PUor8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505745; c=relaxed/simple;
	bh=+5Dx6O+22FOct7QvrPmHj/hYfyUYOlW+JktxcsApXa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtVgT1B3HT6kOK7yC0nQGEbM6muaaNjXTu2PTD9QI78Yq5Ac7f+mS8TCNJ7/k12RxlOcsD1yotAt1JG8Sp1CVvgvpw04qKVIyqMrk0oC+cOgDvY2R9R+fV1k+23Oyi9V7JF0/+IV6bBM0XRKwurNRVXm/oojQTPxWx2ZXNT2zmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTua7f3x; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTua7f3x"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d049069377so4442835ad.0
        for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 06:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785505744; cv=none;
        d=google.com; s=arc-20260327;
        b=X5/fbQByaoX7hmypJY6muo02Xhp3KawlbuxkXXzwJUvPUdJuWzQB5YPy7Nh3utF1vD
         QBXdxhPsqGNqKONZKqdTmNyxVLeYQ+aBm8JN862BLRFIzhpSVqSDluJs1lLpwboK9szt
         /4wKtoa08cR++rZcrKa9Uc63h+fEFMFbbMjWLnDDR4oRWMqSIhlgF6jygLiq9ULmcwOp
         LonHMB8YIkoVtSmQbGBADg4Joew1OoS57SUWN1QyswJzx9NoidIzyy1ASyTpixH04KsE
         BHYJebya4PKFK+EMWNZ9BDb5MSb7VhPrNYRt8LucXhk1M+sksqM1wdPxvAvpr3eyT2I9
         BI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IEgDxMWh9uDWWULdXcAAQHKrPjbSwPSpzBVVp3o/wCM=;
        fh=Vmr5WoMbOoAvpXJOLR43E9HzVu+jYJqxGLDrsjJjUbs=;
        b=Y8DbVZkYptVpqQuRniYhpOcqSG25GgwOt/xhSvklifZXVu1jkRq2YwC9s1N5kclcsE
         0pADuFBAaXHYwnldpSlpja2yuW8a6LiN1PQ+0A1OyDZhEWU8+FzmTxvtlyOihXxKW9LV
         hU8xVL66+UD5vv6fuhsiqLxXF5qOZ3J6R/De6wy/HLnkWkmEuFgu5AcddWvkyTShrSSi
         H4C1jF87TTzAbKDy6bjDA98c7fblw5o7b3F9wY7g5BnDixg/G24Vzq/6qj8f6wjrwh12
         jZryinRrz7a0L74gmGdshnCrU84PcIA0FllnVlSJl4HBCkip2npPhO5pEbTCACzDzdPJ
         5c8Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785505744; x=1786110544; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEgDxMWh9uDWWULdXcAAQHKrPjbSwPSpzBVVp3o/wCM=;
        b=rTua7f3xTZ/aKfa3WJ+QelxL+iDluz8uYNn7ByrrRMAYvhQaBarsVe1TrE6sQpgdmr
         ieyWPixAnokkU3nTViGKm8pjPii3HVMpYTXqTiI9Sg/cMfyAPH2lQWbegmtyM3vmoJXk
         YWt2agFqWSezSb0tJlMSopI+k0Vz8ijWHoLaYPls/dpiZ/dEc6ZmAV2kTBhlAaYaMDju
         Vipg1eU3rG/xZwW6gIJI6fjLGh7hFHGHHySfFpF4xCP0QXySK3NuLatjLrUBHHodz9El
         VjPsqqZw2en8UNgzRlH+knrw6rRMJyFA5nDKGcq+YJEU+FOnk0tvmJthhGFtwWYo3J/0
         /Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505744; x=1786110544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IEgDxMWh9uDWWULdXcAAQHKrPjbSwPSpzBVVp3o/wCM=;
        b=B1e/m4LhZ7RzWBbQzP1bHYXtha6ssSPNlh6HELhn9d3uG/xjgf3OU7fYRQxcTBzHTs
         +9irLkDiNVDxPXFietz0Z1l4hHXDVTlopzwt3fV+Rdj56v2S6SngX6q+cqQdQNgAspOx
         VKdOORrbXmGpjXkQcBXuDn4rBZ2FkG/H1lrM1OgLNDH6I/5SdKOug4hHaRDkOngaBG33
         tBQoTVA2c98e45EbDU1Vo+9E/BJ80WjvoGWwBc1pjPIumCd5wdZlOM7qrcumf8ZTi2V+
         umFdJQq+8FrS4IreNIGScmb3aXfzQaR43vJqNMndeP+71tDx8b6xj3FieBOk6JnE04wa
         kz4Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro+4PUmIPPPrlAl4J06R+v0DZGQ/iUgZ7iIBb3Rj/0rsNPaYfAp6escs+9RJBhXpXWdoN6gVoPbNUj7eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVlxL+fFMSbq1Wb0FRZ8pLVhi2fyqWBFfr0IFUo6egCdjQQHID
	RG1uJadm7R/h16q3lFXSuCYsRg7mPa1NckDBn8SRfRMyN53Ed+AxY79Sf9auWxHULS+OIaEFXXv
	V9EUrAgGrla2Yh8qiUTeTJDcGL8IG2ak=
X-Gm-Gg: AR+sD13owqsqTLz/IbOfAQ2QuMxnzbdmlpRHJ5deqtJr1xnPRExItgdYe66cZDacQne
	4pD41fs9WVBvi/Wwx1n4CfdvyRiXp7dbw9a2nuKxZ08/q1npwcj1ntfwg2iVDxGIzMjdgMjGlQ3
	hUYuIBMsC9462YrjqYcM41MP6+TVb1iStVjsMPeFA2y76oANdxVeP9xDtr2fKLjgifoBXrAzJOl
	iDnCad8r/CMG7MvGIg7EIxiVQUCqR7ogA3f0gPWVsgQCSNPnrFgQySpK2zash8npKBPqPUGzVEQ
	AWf/D70pj84CD0q74KDL920hDOWLJPjyIeIJxtShUNN93fFBjm56JNLeazlg5reV16oE+WwUbLr
	/XbH7eyKdYYt0Zw6KHkNAWZ8h9lB8On7XkToKT7iSKrVVzhbfqBupIsHLIu4BbkUCUWpd52vdw/
	sKBtiz0BCoromYUgBmF3C44roRdNxdqn9JnRLB7bjB
X-Received: by 2002:a17:903:1aa3:b0:2ca:106c:7122 with SMTP id
 d9443c01a7336-2d05219f5bemr1193585ad.9.1785505743504; Fri, 31 Jul 2026
 06:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731122826.737703-1-spasswolf@web.de> <ae141e31-dcc0-46a0-9f3c-6bf7089722b0@leemhuis.info>
In-Reply-To: <ae141e31-dcc0-46a0-9f3c-6bf7089722b0@leemhuis.info>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Fri, 31 Jul 2026 15:48:50 +0200
X-Gm-Features: AUfX_myN8on3SUdI8jMlZxUbEjpGjEbT6xoeXpoJPKe3im_O65fK3BFIAtWSHtk
Message-ID: <CADo9pHi=w2OM__hqCNu4H-HCMER61Hiw76QrxG7B16ZnBsQp7Q@mail.gmail.com>
Subject: Re: rust compile failure in next-20260730
To: Thorsten Leemhuis <linux@leemhuis.info>, spasswolf@web.de, 
	Luna Jernberg <droidbittin@gmail.com>
Cc: Harry Yoo <harry@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Noticed this too

Den fre 31 juli 2026 kl 15:21 skrev Thorsten Leemhuis <linux@leemhuis.info>:
>
> On 7/31/26 14:28, Bert Karwatzki wrote:
> > With next-20260730 building a kernel with CONFIG_RUST=y fails with
> > the following error:
>
> Ran into this, too. Fixing this is discussed in this thread:
> https://lore.kernel.org/all/20260731075644.20215-1-ojeda@kernel.org/
>
> >  RUSTC L rust/kernel.o
> > error[E0308]: mismatched types
> >      --> rust/kernel/sync/poll.rs:175:44
> >       |
> >   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
> >       |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
> >       |                  |
> >       |                  arguments to this function are incorrect
> >       |
> >       = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
> >                  found raw pointer `*mut bindings::callback_head`
> > note: function defined here
> >      --> /mnt/data/linux-forest/linux-next/rust/bindings/bindings_generated.rs:73708:12
> >       |
> > 73708 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
> >       |            ^^^^^^^^^^^^^^^
> >
> > error: aborting due to 1 previous error
> >
> > For more information about this error, try `rustc --explain E0308`.
> > make[5]: *** [rust/Makefile:781: rust/kernel.o] Fehler 1
> > make[4]: *** [Makefile:1420: prepare] Fehler 2
> > make[3]: *** [debian/rules:80: build-arch] Fehler 2
> >
> > Reverting the following commits:
> > ef32a74f8f6a ("mm/slab: introduce kfree_rcu_nolock()")
> > bdd0cc9f0ffc ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
> >
> > make the compilation work again.
> >
> > Bert Karwatzki
>
>
