Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872728FFCB
	for <regressions@lists.linux.dev>; Sat, 16 Aug 2025 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755340599; cv=none; b=NmNWAOTeENNDnYp8Mvtnbs5gE4z/z2htE5WK4+CMfOv1CT6u8OnSCejW1Rrb60/i7prbpv53D9210A66n9DGB4/Z9mJm5bVIAlOEiVHGw52Xekn2hWZ4nGpJBQNcDnEeY25cGbNCylJhcocgauYbNvqP4g8oh9hod8wKmvBaADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755340599; c=relaxed/simple;
	bh=EYfRYy1z92ajS4ke1U1qfeBzLYzlyxCzubIJ3/OY6bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Q2i8/Yys3+nA4UwZArHhak4pw6RQknpBrDqMkDid+SoJuJn3/fIk77nwEYm+awLVGwr5jpr7Q29HpQ5yFElGzEBcdQp0moKsAgL2sNff3ZtWEm2EosIlYinInLbWs6l5repKR865M14IKeckO8lhe5KWtMmDXSbGc6FHUMyyIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T2NbXTdk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T2NbXTdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755340592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8kpb4zYqo4EMmVx2Xny+4AO4zuhFI4D+a2JoLHbhIs=;
	b=T2NbXTdkFudVHEbx73hSEAGwVetJIZ4xTRw/YPnaJ2Hjho5kux4ERQdMGwV/eaK4I/XlJp
	FJ5+hjaU9iMXAHwblMxQL3hiaRbgfT43VaHwrJ12h6soEHx+PhUvZU0LBIKMn0ho5BHMVp
	uOtwHrjnyyh70H04URsfj4vdSgMoKa0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-qfozsv95PY6jcGddvpMl5w-1; Sat, 16 Aug 2025 06:36:22 -0400
X-MC-Unique: qfozsv95PY6jcGddvpMl5w-1
X-Mimecast-MFC-AGG-ID: qfozsv95PY6jcGddvpMl5w_1755340582
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b916fd2cf3so1379366f8f.0
        for <regressions@lists.linux.dev>; Sat, 16 Aug 2025 03:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340581; x=1755945381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8kpb4zYqo4EMmVx2Xny+4AO4zuhFI4D+a2JoLHbhIs=;
        b=IuxgTvYjHFv5sKYxFGpTw1EA3lk8x/k1xI0d9wZq4dk1BLNC0lNkMA/5rKFP6eQxvF
         G5otcOUPLgAFbnhhHMSQnPxsKFu4/FGhQNCirAT1wzYy3JeGoQGGelGHRVmYD00y9mef
         PjFWon/S2WyXDb7j0Z68X+l3FixS7lAzOktpQxw/zE5rFkiWJtp1hFPd2hdvH9zwndMo
         3+5+DuYnsWCaskS+/7IemM2SujW7NHs4ZweVrcvUxbsceYxcXbnrn6l/0EcgY/zxJj0L
         7SLtimBryBhH7Q85PsTawxx1zQ3E/fA1cHKYiNd9WMj8NoYXkyS+vh2jbj2rv/oKE8uR
         0i5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXH18oQr2WOYv+OwnSRudN5+3zE9mAPSZxXjANSxv20aditB/PsrRwYmvMwhfeaPsdUzVT/qILAOm5wSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYmOPqNaIhzhNzpxDCFfOul1u82bh7sK2pCIrL3Pcozwt/Osak
	UQEaZfhrQgftg0YsuP5VqppLWzEoaKIYAEd2qpf+geDY5CcUFfe7kjDQHtDv3asiDQLacpWCUBk
	ck8NFAu63CPY6ZPNi6l0wKXgTWJEctNbqpxB6/iWXSEWbTkXSVRV1ssBM+tQrbffc
X-Gm-Gg: ASbGncsXAzeZJelhLrQK2lYM0+Ca7TJx44zvC5ZCuBXowuWcsBJPnCcTwKd7wysi0B6
	dGIy4BcD2s/EP7HeprUwMxR4eXndxYQMKKqA25Ynsj+4HonXszl6aohLJ3z1LgvTCCmSSD0b8bm
	KcaJxBUA2x1lftugS2RqhewqV6UcsjOfl0rBYdv6H+G7dMfnvjJ6wf6FnZz0JW+9ORLMf9lrIV7
	JTsnzgA5JuSQVX2rl/Pjrylaa1PW/CzX3PdsCFTvkwLonXpvheaLTE84XOti2430f52Ayzb2Yas
	2IuCuPDliojl958Z4Nm/qrRyysHXNS4PHoQ=
X-Received: by 2002:a05:6000:4310:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3ba5093b77dmr7934610f8f.26.1755340581485;
        Sat, 16 Aug 2025 03:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhOaIvnCh51kO1M3yudZ1Zco2KV8bF2xaTDUF4+BRWU8NLMhH+ezyI4LNzBjTWj+A0q+/Xgw==
X-Received: by 2002:a05:6000:4310:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3ba5093b77dmr7934596f8f.26.1755340581068;
        Sat, 16 Aug 2025 03:36:21 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73cf:b700:6c5c:d9e7:553f:9f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64d307cfsm5181464f8f.18.2025.08.16.03.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:36:20 -0700 (PDT)
Date: Sat, 16 Aug 2025 06:36:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alyssa Ross <hi@alyssa.is>
Cc: SamiUddinsami.md.ko@gmail.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sami Uddin <sami.md.ko@gmail.com>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] virtio: reject shm region if length is zero
Message-ID: <20250816063522-mutt-send-email-mst@kernel.org>
References: <20250511222153.2332-1-sami.md.ko@gmail.com>
 <kgasjsq2s4pshravsinycfihdfjhdts5iz2fox42aejs4xqhce@frurksambnk3>
 <87y0rkie9l.fsf@alyssa.is>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87y0rkie9l.fsf@alyssa.is>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWVmkyTQ9tYYGSEY8u42mWmZfHDo4sGwDThaNIInBHQ_1755340582
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 15, 2025 at 09:19:34PM +0200, Alyssa Ross wrote:
> Alyssa Ross <hi@alyssa.is> writes:
> 
> > On Mon, May 12, 2025 at 07:51:53AM +0930, SamiUddinsami.md.ko@gmail.com wrote:
> >> From: Sami Uddin <sami.md.ko@gmail.com>
> >>
> >> Prevent usage of shared memory regions where the length is zero,
> >> as such configurations are not valid and may lead to unexpected behavior.
> >>
> >> Signed-off-by: Sami Uddin <sami.md.ko@gmail.com>
> >> ---
> >> v3:
> >> - Use idiomatic 'if (!region->len)' as suggested by reviewer
> >> v2:
> >> - Fixed coding style issue: added space after 'if' statement
> >>
> >>  include/linux/virtio_config.h | 2 ++
> >>  1 file changed, 2 insertions(+)
> >
> > Hi, I'm sorry to be the bearer of bad news, but since this patch my VM
> > no longer works.  The system is running wayland-proxy-virtwl[1] inside
> > a crosvm[2] VM, using crosvm's virtio-gpu device to do cross-domain
> > Wayland forwarding.
> >
> > Since this change, wayland-proxy-virtwl crashes with the following log
> > message:
> >
> > 	wl-proxy [WARNING]: Error handling client: Unix.Unix_error(Unix.EINVAL, "DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB", "")
> >
> > I'm pretty confused by what this change was supposed to do in the first
> > place…  Looking at how virtio_get_shm_region() is used in
> > virtio_gpu_init(), it's called with a pointer to zeroed memory, and then
> > the get_shm_region() implementation is supposed to write to the region,
> > without ever reading from it as far as I can tell.  Why is the initial
> > value of an out parameter being checked at all?  How does this prevent
> > using zero-length shared memory regions?
> >
> > [1]: https://crosvm.dev/
> > [2]: https://github.com/talex5/wayland-proxy-virtwl
> >
> > #regzbot introduced: 206cc44588f72b49ad4d7e21a7472ab2a72a83df
> 
> Okay, just found that it's already been reverted:
> https://lore.kernel.org/all/20250808072533-mutt-send-email-mst@kernel.org/
> 
> Still, I'm confused how this was supposed to fix anything…
> 
> #regzbot fix: Revert "virtio: reject shm region if length is zero"



Are you asking why was the patch applied in the 1st place?
It seemed like an invalid behaviour to me, and I thought it's
not too late to block it so we don't need to support it
down the road.

-- 
MST

