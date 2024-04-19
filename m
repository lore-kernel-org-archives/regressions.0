Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD0130AC4
	for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 17:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713547933; cv=none; b=feXjJqBHzvIXe75YN4mNtrXsq0r1h/mgwUlLY+5GEq8aUAw+y3ydwVaMcltoTaNbKe1MBqtSZlTOUDr4J+L7vjS5meGYxIVwBKSc1PvC1pyOXFUPEblqeyfkbwJFU1bn7FokiCI3vX1HsR8Nk3Tz40X74FJ0SAWaDQeSxDglGHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713547933; c=relaxed/simple;
	bh=zfFcqPGQgRsVMEP61jNK7VFPiewdPs5Dnfgr6LjPP+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYhBv41huTQmqoTmoCCAVtG9EaoG73yFrbneZEoKusLJ/A5YnQTaltYtutNWG03gcV1+q3TOzHqpHv+JlnQjd/h/Hu4/X58hSDHNdEPvUjHpcLa+pW+eJ+Q6Fn/7C/7ImVIpZMrb94a1s9IfkIuPJYR8jTzc3pRNVXRaBkAOYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3KIqe8CC; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3KIqe8CC"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-571e13cd856so1527a12.0
        for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 10:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713547929; x=1714152729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/7XkNtVUlPpqy9TPO+l1wE6wDN8mZN9vh6h8osNmdQ=;
        b=3KIqe8CCGWLaF68Due39H+mh4SK+W4DFLZ4u4nN9kchb3PoaRwwStdrwdzFRVGH/2f
         8YdQgKA0Qaa4zFQCVyMdBgSryMs0ArK8ygnO5MgoiroP2ED+G7s9wz43/Ic6FcvQLUSo
         3rpDrXA3Mx1lKRvkUvAp8xdnfhF5bN2jrTnFnFxMpJmc4vVCDHU9eGt+KteBk+wqImFS
         6Ji6asK8usbO12f1Nu1jzmO+4j238EtaOnUTkd+LuzQ8OsoEB/y9RikcSEhOByxV6VYT
         iM8G8rKitIpm2sX8lmAB96TixeHumxCR87d0h4DW9KWtVoPqVT3w9kiy+fJdNdXscV3/
         UlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713547930; x=1714152730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/7XkNtVUlPpqy9TPO+l1wE6wDN8mZN9vh6h8osNmdQ=;
        b=fipgMhUOegr1OJu5Prh62JVr60b7g/o/iKNQj/ek2s8u8/Fj7s/BwXQtP3LnBkpRNV
         pMKL1ElEU2yfh1P8uUaJE0F9slF7mcwYvKMMR43Dpet3mqWIzo3J0D5nqG4bkhVMp3T0
         0ITDCrXDftzbG4coI2HKBQXnWVhUKUxo08wmLQOVU8Yb5B0A0KpPm2c5jA8SMG2EvpLg
         JtxHNoRT2pcLLyrPa4SN3GFgdFlW4O/Lnufud0cFU2PD1gGcPO5Oj0BCr2TXqEwDn336
         7x+j7q3SJFDEgkFslvFpRuPE1nNPql58/WQi5hQWVj9DqM3pgoItquqqxW/I0uVkLIBP
         /2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV0OmBpSPXCewFALaVPniHdPG8mZQtrUxvMYTq3OSu/yGTTO6/U+duhA3xRNxQ7UpynuM8yYliNxiw8JYQJXw5rlMXi343VoDpeQc=
X-Gm-Message-State: AOJu0YwQn8u4xiwdbFp4zSBdnn0WISY/smWivF6nrDT8qcxskA90c+nd
	THQ4A1elZGnIMq7Dk6I0xI4p9IJl/16epMWn2OdSmggupcmIIY3+0Ws9cy3ME/QNy3VBKtAUGyT
	Qk4TkUra2i+M9eGBW+/guMOVx9AdIl/ZRCd+Q2dMIqMJ8H8OUDskC
X-Google-Smtp-Source: AGHT+IHfJjHNnX0DOR+Ao2TnWv+2l4N+4qaFs909XBsz90RHhq98Lx6Z9yOcs9YqTY/IBjU/tcv+u8FszCMOj0/zMXk=
X-Received: by 2002:a05:6402:1e94:b0:571:b9c7:2804 with SMTP id
 f20-20020a0564021e9400b00571b9c72804mr232037edf.5.1713547929429; Fri, 19 Apr
 2024 10:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <VI1PR01MB42407D7947B2EA448F1E04EFD10D2@VI1PR01MB4240.eurprd01.prod.exchangelabs.com>
 <CANn89iLO_xpjAacnMB2H4ozPHnNfGO9_OhB87A_3mgQEYP+81A@mail.gmail.com> <VI1PR01MB4240EBA3CE9986FC6A0A9C7DD10D2@VI1PR01MB4240.eurprd01.prod.exchangelabs.com>
In-Reply-To: <VI1PR01MB4240EBA3CE9986FC6A0A9C7DD10D2@VI1PR01MB4240.eurprd01.prod.exchangelabs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 19 Apr 2024 19:31:58 +0200
Message-ID: <CANn89iJDxA5nCTiw9SzHVfzhz2F124Z_PMEf_oJz3DGAp=UeOQ@mail.gmail.com>
Subject: Re: [REGRESSION] sk_memory_allocated counter leaking on aarch64
To: Jonathan Heathcote <jonathan.heathcote@bbc.co.uk>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 5:59=E2=80=AFPM Jonathan Heathcote
<jonathan.heathcote@bbc.co.uk> wrote:
>
> I'm very sorry but I won't be able to give this a try until Wednesday nex=
t week (I'm currently working part time) but I'll give this a go first-thin=
g. Thank you very much for your swift response!

SGTM, I rewrote the patch to remove the not needed
preempt_disable()/preempt_enable()

I will test it soon.

diff --git a/include/net/sock.h b/include/net/sock.h
index f57bfd8a2ad2deaedf3f351325ab9336ae040504..bae62604c5ffc8a3ecbe3e996b8=
7c9fb25914c0f
100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1410,32 +1410,34 @@ sk_memory_allocated(const struct sock *sk)
 #define SK_MEMORY_PCPU_RESERVE (1 << (20 - PAGE_SHIFT))
 extern int sysctl_mem_pcpu_rsv;

+static inline void sk_memory_pcpu_drain(const struct proto *proto)
+{
+       int val =3D this_cpu_xchg(*proto->per_cpu_fw_alloc, 0);
+
+       if (val)
+               atomic_long_add(val, proto->memory_allocated);
+}
+
 static inline void
 sk_memory_allocated_add(struct sock *sk, int amt)
 {
-       int local_reserve;
+       int val;

-       preempt_disable();
-       local_reserve =3D
__this_cpu_add_return(*sk->sk_prot->per_cpu_fw_alloc, amt);
-       if (local_reserve >=3D READ_ONCE(sysctl_mem_pcpu_rsv)) {
-               __this_cpu_sub(*sk->sk_prot->per_cpu_fw_alloc, local_reserv=
e);
-               atomic_long_add(local_reserve, sk->sk_prot->memory_allocate=
d);
-       }
-       preempt_enable();
+       val =3D this_cpu_add_return(*sk->sk_prot->per_cpu_fw_alloc, amt);
+
+       if (unlikely(val >=3D READ_ONCE(sysctl_mem_pcpu_rsv)))
+               sk_memory_pcpu_drain(sk->sk_prot);
 }

 static inline void
 sk_memory_allocated_sub(struct sock *sk, int amt)
 {
-       int local_reserve;
+       int val;

-       preempt_disable();
-       local_reserve =3D
__this_cpu_sub_return(*sk->sk_prot->per_cpu_fw_alloc, amt);
-       if (local_reserve <=3D -READ_ONCE(sysctl_mem_pcpu_rsv)) {
-               __this_cpu_sub(*sk->sk_prot->per_cpu_fw_alloc, local_reserv=
e);
-               atomic_long_add(local_reserve, sk->sk_prot->memory_allocate=
d);
-       }
-       preempt_enable();
+       val =3D this_cpu_sub_return(*sk->sk_prot->per_cpu_fw_alloc, amt);
+
+       if (unlikely(val <=3D -READ_ONCE(sysctl_mem_pcpu_rsv)))
+               sk_memory_pcpu_drain(sk->sk_prot);
 }

 #define SK_ALLOC_PERCPU_COUNTER_BATCH 16
