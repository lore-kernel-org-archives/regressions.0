Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26819F464
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723629312; cv=none; b=g7q5S23Jlz58tJNXsp7/3X2OFmO8pP+b6WPddBcwPFBJzle6Xv6uBqDm/I8v3Pjy8l+MukUFKDI2ZsynehEUEaSfJ6YCDHfc/5pC0SZmRztrdHWElS/46kBVP4eYzn4dnqKLdlSFehDPZ4KXsUXMDNrmp+IlUnaFGjQsAXEtbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723629312; c=relaxed/simple;
	bh=hzCTGEMMJ7kf4NqqEdzR97wZ6ZicVjeTlJk6P9+znlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hSSuZwi5wCSAcWCYymjwF9vLDEB7GrsKh+91ZJ5F+fvpSh7JOnTjJeeEf9flV4BGs7vS8HaweTbHngwBHu+xFp8ayltbi83qcfsPL/TsD01uNpKwUHQ6G+L35Lu5b7auFc1m+vti46XM3SzJZZ5fA/aYgUrzar2rqv4GDMHcSac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBDU8W3B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBDU8W3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723629310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TD3eIlc9AjVv5XHFM7Qv3v9oTzPd68l7T0XpauE4HO0=;
	b=IBDU8W3BQWgq4OQIdHwOcCZc/zgZE6uq47vjClW0hWImqFFbIJ6h0nEjNGajYoBtpuNX5h
	txTaEoYyxPvh8jAumO9rf6jHAjCQjkzxpP+6B/ryzosQup6J2M9v8t4of8PrIoLWnXzq33
	VErH8sDRVyGYq/k2SMpV2xGyo3lxD3U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-dlqXESf8PICrtIZJKM_yzA-1; Wed, 14 Aug 2024 05:55:08 -0400
X-MC-Unique: dlqXESf8PICrtIZJKM_yzA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7aa5885be3so478105266b.0
        for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 02:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723629305; x=1724234105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD3eIlc9AjVv5XHFM7Qv3v9oTzPd68l7T0XpauE4HO0=;
        b=J7LrVzgwqfAT+A6mCAEiTutdydO5wMi9rUyutwwFDPCi8CD+2qLdRGW9NHDd1DK/1L
         WV8gHIKBMwrUajrOvSFylEkf0VTaMcXUYjdaKDtfus6Q9FVkoHhKyYL/7R33rmyLtK7J
         NCgWRNfRnk/Miuwgyin08JtGt3cRPjjFc4/E8GRC8pY17Z87jcOBGFv558HIYLPbKqVr
         FwZ/uA3JkcfFehIPeLWjEisji3TGYXj3r4Ml7Cgui3RO0vy0eyezv6ikL8B9ClIywGWw
         iSulycFHxzBj5vZCdfYJ07YiNgDCAqZoC05uyUdZIntXKPVKXElDg7xEL5xXD9XaCv3c
         ntcg==
X-Forwarded-Encrypted: i=1; AJvYcCVfO37V+jMH8dFDeGB4UYZXeEB3zUh2x9wOzA6dwDsrtcZd1glbjxIWXfDCiLM+BjG3uUuZjeqVRkAN/rxfP4BWtr+wvcLXvJbs5a8=
X-Gm-Message-State: AOJu0YzMa8xKrYiyfdF50MeyCtC8FPz9XKjvd9N9JjISvp8nsYamfF6E
	WJLNdFFcq1LuuKrz+whUQ8aKZgCPAVLMA1/qOQzCvasj4BeaQDw+dm6+A001QIW+wlTSBdnCGd7
	zFtzxdOs5/T4qY4jHCzlG70XDcpnngnMxiTPR1S5t4YJqKumeORO1bsdWkVDs
X-Received: by 2002:a17:907:e2ca:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a8366c2f66emr148803166b.9.1723629304786;
        Wed, 14 Aug 2024 02:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVdSA4xeG6FKGN4RSrjK5lihBvWgcah1U0Kk9andCHfMqprUTfLMzNpY/SS6Z7AT8pu64aVA==
X-Received: by 2002:a17:907:e2ca:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a8366c2f66emr148799366b.9.1723629303945;
        Wed, 14 Aug 2024 02:55:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f414e127sm152304066b.150.2024.08.14.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 02:55:03 -0700 (PDT)
Date: Wed, 14 Aug 2024 05:54:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Heusel <christian@heusel.eu>
Cc: Greg KH <gregkh@linuxfoundation.org>, avladu@cloudbasesolutions.com,
	willemdebruijn.kernel@gmail.com, alexander.duyck@gmail.com,
	arefev@swemel.ru, davem@davemloft.net, edumazet@google.com,
	jasowang@redhat.com, kuba@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, stable@vger.kernel.org, willemb@google.com,
	regressions@lists.linux.dev
Subject: Re: [PATCH net] net: drop bad gso csum_start and offset in
 virtio_net_hdr
Message-ID: <20240814055408-mutt-send-email-mst@kernel.org>
References: <20240726023359.879166-1-willemdebruijn.kernel@gmail.com>
 <20240805212829.527616-1-avladu@cloudbasesolutions.com>
 <2024080703-unafraid-chastise-acf0@gregkh>
 <146d2c9f-f2c3-4891-ac48-a3e50c863530@heusel.eu>
 <2024080857-contusion-womb-aae1@gregkh>
 <60bc20c5-7512-44f7-88cb-abc540437ae1@heusel.eu>
 <0d897b58-f4b8-4814-b3f9-5dce0540c81d@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0d897b58-f4b8-4814-b3f9-5dce0540c81d@heusel.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 11:46:30AM +0200, Christian Heusel wrote:
> On 24/08/08 11:52AM, Christian Heusel wrote:
> > On 24/08/08 08:38AM, Greg KH wrote:
> > > On Wed, Aug 07, 2024 at 08:34:48PM +0200, Christian Heusel wrote:
> > > > On 24/08/07 04:12PM, Greg KH wrote:
> > > > > On Mon, Aug 05, 2024 at 09:28:29PM +0000, avladu@cloudbasesolutions.com wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > This patch needs to be backported to the stable 6.1.x and 6.64.x branches, as the initial patch https://github.com/torvalds/linux/commit/e269d79c7d35aa3808b1f3c1737d63dab504ddc8 was backported a few days ago: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/include/linux/virtio_net.h?h=3Dv6.1.103&id=3D5b1997487a3f3373b0f580c8a20b56c1b64b0775
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/include/linux/virtio_net.h?h=3Dv6.6.44&id=3D90d41ebe0cd4635f6410471efc1dd71b33e894cf
> > > > > 
> > > > > Please provide a working backport, the change does not properly
> > > > > cherry-pick.
> > > > > 
> > > > > greg k-h
> > > > 
> > > > Hey Greg, hey Sasha,
> > > > 
> > > > this patch also needs backporting to the 6.6.y and 6.10.y series as the
> > > > buggy commit was backported to to all three series.
> > > 
> > > What buggy commit?
> > 
> > The issue is that commit e269d79c7d35 ("net: missing check virtio")
> > introduces a bug which is fixed by 89add40066f9 ("net: drop bad gso
> > csum_start and offset in virtio_net_hdr") which it also carries a
> > "Fixes:" tag for.
> > 
> > Therefore it would be good to also get 89add40066f9 backported.
> > 
> > > And how was this tested, it does not apply cleanly to the trees for me
> > > at all.
> > 
> > I have tested this with the procedure as described in [0]:
> > 
> >     $ git switch linux-6.10.y
> >     $ git cherry-pick -x 89add40066f9ed9abe5f7f886fe5789ff7e0c50e
> >     Auto-merging net/ipv4/udp_offload.c
> >     [linux-6.10.y fbc0d2bea065] net: drop bad gso csum_start and offset in virtio_net_hdr
> >      Author: Willem de Bruijn <willemb@google.com>
> >      Date: Mon Jul 29 16:10:12 2024 -0400
> >      3 files changed, 12 insertions(+), 11 deletions(-)
> > 
> > This also works for linux-6.6.y, but not for linux-6.1.y, as it fails
> > with a merge error there.
> > 
> > The relevant commit is confirmed to fix the issue in the relevant Githu
> > issue here[1]:
> > 
> >     @marek22k commented
> >     > They both fix the problem for me.
> > 
> > > confused,
> > 
> > Sorry for the confusion! I hope the above clears things up a little :)
> > 
> > > greg k-h
> > 
> > Cheers,
> > Christian
> > 
> > [0]: https://lore.kernel.org/all/2024060624-platinum-ladies-9214@gregkh/
> > [1]: https://github.com/tailscale/tailscale/issues/13041#issuecomment-2272326491
> 
> Since I didn't hear from anybody so far about the above issue it's a bit
> unclear on how to proceed here. I still think that I would make sense to
> go with my above suggestion about patching at least 2 out of the 3
> stable series where the patch applies cleanly.
> 
> 	~ Chris



Do what Greg said:

	Please provide a working backport, the change does not properly
	cherry-pick.

that means, post backported patches to stable, copy list.

-- 
MST

