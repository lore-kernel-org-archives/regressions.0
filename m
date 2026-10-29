Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292933;
	b=Vtf0qhWPJAUN41eeZaoV9e/dCNJEihs9nNotJYp8MfbHxoQKHq3qX07fhb/Y9G4FsCqL
	 pGtzcWulzuSq1E6C8rT1zhMevZNJp9ycUZy0TU3fquXd9YSDiq+bDzxdUyn9ax5kQynDH
	 HmJl58uEr4B+2N8xI5/xvVVeRNzSNZij3oQH4hU9oEyXcJSNmRROeJ+4p+jitPIpvH7MT
	 tIjyxYJuHHQe1vCk6AUULS76mswXD3QdYd8UaC5QCfHQdGZFq9eSuD96IDvHQMKldH4cl
	 WpnsBwhMJBTz/KE4dnrW1xpq+E4ppXCOjASGnn/pjgN6rZ0f0WF3rF0iDYHmfFfeuUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292933;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Received:From:In-Reply-To:References:MIME-Version:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
	b=eE35VztdHFNVB8SxKll9P5+b7elEC3JS4x+7521FFc83v7d5lguHNfdyl6ne78Sl1OtG
	 oE2pPihbeVEjqs3gy8L21N+OhdGEUZ+8u+wOv8W/J+CPUXHoQoJAI18L42/s55D/06kGj
	 1Ym/VbaTe/G06/re6EszWgxoO43IgFXAAVqoBYhg4AFlPc0dhrHVl2/O7AOwCm0HQ4H90
	 /rbzhoRXPZdFPAT2JqWMpvucUW4jWTHa27gWTpu07z6wl41bDa/Bcumx5IFLWHwB7ppqq
	 kpVl/5k4u9zTy7Le+jbQabUh2zMEVnYWDlJyWNNMxjnaQBlQvV3jdaf10Yi3be+W7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RhlV2mA2;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C35606A31F
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 16:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RhlV2mA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793292931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
	b=RhlV2mA2079QE8KGFWHDWxyHgvTa1V7KLCMFbGfYjQLmoqrFLrDf6peIwYAp1I8z+dCkbM
	DVBfVI8E/JVazf33ezs84DVdIjzJKcY0AwZ9VukHGHxaJhR0rWb0+s00jGtvBlr+F2XirC
	XvmmUlheQvgshdurmcCGyEHgeJiFpTk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-OvmuktXCN0ypPnyfDMVYoQ-1; Thu, 29 Oct 2026 12:55:30 -0400
X-MC-Unique: OvmuktXCN0ypPnyfDMVYoQ-1
X-Mimecast-MFC-AGG-ID: OvmuktXCN0ypPnyfDMVYoQ_1793292929
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so555984385a.1
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 09:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292929; x=1793897729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TXB64NJFF4WXwJ9sa1LPJLwRXbNGHs0rY5npnlz1t+E=;
        b=IoVQthqZ+hXBXxtv0KAnk+LQyZ75rePvmjSB2mH28P1X+K3W7eTmXXZNL1QpJEuRPu
         YctZuSXNFnxx8+gu/nPDSoqK5lg7woUiYhrQPCKkQ1MOT+WuyYvO7HQ8BnxIK6wljMMk
         xPkPoFX8gFkg1fdiVt4AR4jyJwkeFv5SfIp9g3CeiVi4bPzF4J70BBtrqCObJFWEsnYb
         f41ccfC/OBRKSXlT6l4zJFO2cg4hxHdcbQTwYspnVGbZWGibAsrSX7vS3yefMGV5RRek
         vBQ4E0hSEA7r0QRuX91+Ebs2WwVivI4eYUzSr8JPvTMYTMTaE52VXoFibgVNFqwqxe0y
         7NuA==
X-Forwarded-Encrypted: i=1; AKwUvBzMk+PHxJ99Vpa//SO6S8XxNeOWD1qQwZNjHQkFmE+UudQc4lDFNbXWu9oi2Dnm2MY8TrArcgvkZDpIFw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0huPMghUqgiNxgNFA7xVAQ+hKn21x5PoO/hHR4IdoKxmJh0Bc
	cIHQS/1njL0e6pUxiM1wFi6yZC4ZbtzVGPC33egbT2x5IeggsY2iL3UO7F0MbNMjGSMJFyVQKmo
	Mh344RDJaPFgtpi9E61byPrS+4mTkro4IeqtflPpnTk+LiQoNhMNOUo3iT8JFm/NGre3yo1Rviq
	HcB8K/reV0NVSOPUJnkA8v2OkvjD54mlfpinADLqQ=
X-Gm-Gg: AYBFou0NTMkrruXgBS6n89KpkNs/XHDuu1x2q9wGjniAAhuc7EJmznfwKYUw9VYSRRY
	qsgD9/g3zrnCHLk8TPJxfKrPNtjW5pce6CjHjfVBUSQkWvrOMXvnn3qq8Hr3FF9PQ9fAI/FTFSm
	ldQOr7JqhpADzYgm3t2SFHOudwIHW7ZbqfdtaNi0L2eqRvAhvWjwQcHeY=
X-Received: by 2002:a05:620a:1a27:b0:93b:ef24:bc8c with SMTP id af79cd13be357-94408cde203mr957070285a.47.1793292929304;
        Thu, 29 Oct 2026 09:55:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a27:b0:93b:ef24:bc8c with SMTP id
 af79cd13be357-94408cde203mr957065685a.47.1793292928789; Thu, 29 Oct 2026
 09:55:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 09:55:28 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 09:55:28 -0700
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <18f0bae1-5cdb-460c-a147-33cd1fa2acdf@leemhuis.info>
References: <20260804140403.16337-1-kfastov@gmail.com> <20260804162924.0268f80a@fedora-21.home>
 <CABWhNekebS6dt=Ft+74iG4YpCq-5ZcV1EvvERNxT612VUOC9Ww@mail.gmail.com> <18f0bae1-5cdb-460c-a147-33cd1fa2acdf@leemhuis.info>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 09:55:28 -0700
X-Gm-Features: AclHuK-xgAN_fR_dbuTYNWejWEVdFE5MAwn_KoUGHzvKxdpt-_9FR1Wg7w13_Us
Message-ID: <CAAiTLFXd=LK93e=f3PE1f6y5m15yVknqqVNBei5rLz2AnSJ4pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gem-shmem: Install writable PTEs for write faults
To: Thorsten Leemhuis <regressions@leemhuis.info>, Konstantin Fastov <kfastov@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hZkB17jzjEYrBAUvDu9zjwrTaNpXQGgbPl1FPh1c-8Y_1793292929
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> [CCing Paolo and Sergio]
>
> On 8/4/26 16:57, Konstantin Fastov wrote:
>> =D0=B2=D1=82, 4 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 17:29, B=
oris Brezillon <boris.brezillon@collabora.com>:
>>> On Tue,  4 Aug 2026 17:04:03 +0300
>>> Konstantin Fastov <kfastov@gmail.com> wrote:
>>>
>>>> Since the introduction of dirty tracking, drm_gem_shmem_vm_ops has a
>>>> .pfn_mkwrite handler.  Its presence makes vma_wants_writenotify() true=
,
>>>> so vma_set_page_prot() removes the write bit from vm_page_prot of
>>>> shared mappings, and the vmf_insert_pfn() call in the fault handler no=
w
>>>> installs read-only PTEs even when serving a write fault.
>>>>
>>>> For regular CPU accesses this is transparent: the retried access fault=
s
>>>> again on the present read-only PTE, goes through wp_pfn_shared() into
>>>> .pfn_mkwrite() and the PTE is upgraded to writable.  But consumers tha=
t
>>>> resolve faults through fixup_user_fault() + follow_pfnmap_start()
>>>> perform no such retry.  In particular KVM's hva_to_pfn_remapped(),
>>>> after "successfully" handling a write fault, finds a present read-only
>>>> PTE, treats it as KVM_PFN_ERR_RO_FAULT and fails the vcpu run with
>>>> EFAULT.  Observed as AsahiLinux/linux#560: muvm/libkrun microVMs
>>>> mapping virtio-gpu blob resources die with EFAULT on first GPU access.
>>>> The traced failing sequence: [...]
>>>
>>> The same issue is being discussed here [1].
>>> [...]
>>> [1]https://lore.kernel.org/dri-devel/20260804120529.1730187-1-pbonzini@=
redhat.com/
>>
>> Thanks, I missed that series, I searched dri-devel but not the kvm list.
>> Paolo's patches 1-2 are indeed the same fix (down to the same function
>> name), so please consider my patch superseded by his series. [...]
> FWIW, it seems that series takes a while to get polished and mainlined:
> https://lore.kernel.org/all/CABgObfYgZ87%3DW%2B6E%3DN%3DWwTuyYkaoKU3hqd84=
JDTSAvT3_9dh6w@mail.gmail.com/
>
> To quote: "It ballooned a bit and getting acks from everyone involved is
> hard... Either I or Sergio will get back to it."
>
> Is that something you/AsahiLinux/the world can live with?

Asahi still ships their own kernel with downstream patches, and have
backported Paolo's series. But for the rest of the world this is pretty
bad, as it means anything that requires virtio-gpu with blob mappings
(venus, native context, etc..) is broken.

Since the proper fix is going to take a while, I think having some form
of interim solution could be a good idea.

