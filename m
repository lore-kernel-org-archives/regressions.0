Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A36199FC6
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249130; cv=none; b=BYQYi1T7+Gt2acT9iqF5ruK923OtiLtM6mK3rCGtW3n7AhQclxUx3yFHOwonZPwCYytIA2di2zvtjJl1sdrmJfHhZ7zHTduvJKvdinjFUkhGq7oOez6IiBwDQo3SHHAG2Musiu0xZesoMIqOpaTlpH1OdI0Ji7Ak4+k9JlAQIlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249130; c=relaxed/simple;
	bh=3qQFyXAWi9BA6zTGMeLTr7gI4YHzoN6OU5PpClQonHM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=j6XUomFtXT7KTFr7RvslwT/38m+DaKwaOSi7hXPYwNAGJmjA+IJeIAzSlaI5k/069CXEbI4qnQCbV9uqc9oWF7I1s58WtosCMpA3c0GHIu8Xb3nonBtlDaQMUQA1FikbZrO2nUagFgqC8lH/sIQM6rpW3e3gvp61C6OsetqOdk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxLWajfK; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxLWajfK"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6bf6beda0c0so38788506d6.1
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724249127; x=1724853927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fN4YJkNsiA5cBzIHKP1gu1fWJlmOWyJm4B0nMxoX820=;
        b=JxLWajfKvCs4wl35XiF4HckF+lX6wmVaUAvNKMjIYxvXSpu5V2VWVv4FazkJ5mimD5
         xja46kvHEGFyt4C8o4Wdrde4ZME3Ag4XNlc9fKIp9q6ovT1NPawfliKhHewaa8DGDTnP
         r00Duj6Pt5Lyosbc0XqnocP3Z6/C7DU2N07ijCiGQipsahUVXO8VC75Jl36LrBDDUu46
         R0z8Iebvnf3E00TtB/dKQeKsXJm6cEwraKwWym9tYXfcj5Tw1wbIeQdAB0m8vhIjIV+2
         KNof0whQEpqK1NMQvA8Mio6oCkTv5flp0Og93sbl/bDX34CfOPuixzLU5/K0xykLgmJP
         JYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724249127; x=1724853927;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fN4YJkNsiA5cBzIHKP1gu1fWJlmOWyJm4B0nMxoX820=;
        b=LTuh8FoT6Ecv1a+WSWHqe+bUS2xqGkbXcGkB0Ue2zAItO+e9ic2QELbbMcNvat4eET
         cFdpMKRioCUhITeKEqRszurMY8JSVWu4rAOmYG+A83tGD0y8TUBxEb2GGTe213Nj7ztS
         wdXRBrW8tE1dxwh+yqko2wyf43nC+yqbaAvNBmrUhpfBHtojjxrg/U2ZBDIeVw3A1LTo
         2xmsfSrMTQbDJzDKFWKQgCIAs9benVDh0LAruUO8lXLLWesfrZsB/FVoShUscaWPdjVi
         jHg9gXAppu6PX4mCZFhYysHVjyV1RQ87Ab0Rt5pJpJm3kSKvqH8bKAU13in8F0O3XkZC
         j3Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVLxJOBCcRoBaRCHh6p3L5+7iywZZocHvqnw/pJJCd7wsJGPfMLYnRXDI9DMxicWkP+ogKuTOvUgEko0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNJrk/Kgrq3lb82T63KvnKW53bunF4KiFz99/GAxKnwpotJHBm
	lqSluwG1/xdXv0wqemfrso43lU3NJbAVZlJeAHVOhGe4FkTlR5Sz
X-Google-Smtp-Source: AGHT+IEFETWqaRrGa4osaJCinLoV2tBEtUd7FpTCWAuWzdefV/2detzXaXFZ//Bm1Pdul4NYn2NnRQ==
X-Received: by 2002:a05:6214:5a0a:b0:6bf:940d:286f with SMTP id 6a1803df08f44-6c155e1f98fmr32497436d6.50.1724249127257;
        Wed, 21 Aug 2024 07:05:27 -0700 (PDT)
Received: from localhost (193.132.150.34.bc.googleusercontent.com. [34.150.132.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe115absm61625666d6.38.2024.08.21.07.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:05:18 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:05:12 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Vitaly Chikunov <vt@altlinux.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Christian Heusel <christian@heusel.eu>, 
 Adrian Vladu <avladu@cloudbasesolutions.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Greg KH <gregkh@linuxfoundation.org>, 
 "alexander.duyck@gmail.com" <alexander.duyck@gmail.com>, 
 "arefev@swemel.ru" <arefev@swemel.ru>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "willemb@google.com" <willemb@google.com>, 
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Message-ID: <66c5f41884850_da1e7294d2@willemb.c.googlers.com.notmuch>
In-Reply-To: <zkpazbrdirbgp6xgrd54urzjv2b5o3gjfubj6hi673uf35aep3@hrqxcdd7vj5c>
References: <2024080703-unafraid-chastise-acf0@gregkh>
 <146d2c9f-f2c3-4891-ac48-a3e50c863530@heusel.eu>
 <2024080857-contusion-womb-aae1@gregkh>
 <60bc20c5-7512-44f7-88cb-abc540437ae1@heusel.eu>
 <0d897b58-f4b8-4814-b3f9-5dce0540c81d@heusel.eu>
 <20240814055408-mutt-send-email-mst@kernel.org>
 <c746a1d2-ba0d-40fe-8983-0bf1f7ce64a7@heusel.eu>
 <PR3PR09MB5411FC965DBCCC26AF850EA5B0872@PR3PR09MB5411.eurprd09.prod.outlook.com>
 <ad4d96b7-d033-4292-86df-91b8d7b427c4@heusel.eu>
 <66bcb6f68172f_adbf529471@willemb.c.googlers.com.notmuch>
 <zkpazbrdirbgp6xgrd54urzjv2b5o3gjfubj6hi673uf35aep3@hrqxcdd7vj5c>
Subject: Re: [PATCH net] net: drop bad gso csum_start and offset in
 virtio_net_hdr
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Vitaly Chikunov wrote:
> Willem,
> 
> On Wed, Aug 14, 2024 at 09:53:58AM GMT, Willem de Bruijn wrote:
> > Christian Heusel wrote:
> > > On 24/08/14 10:10AM, Adrian Vladu wrote:
> > > > Hello,
> > > > 
> > > > The 6.6.y branch has the patch already in the stable queue -> https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/commit/?id=3e713b73c01fac163a5c8cb0953d1e300407a773, and it should be available in the 6.6.46 upcoming minor.
> > > > 
> > > > Thanks, Adrian.
> > > 
> > > Yeah it's also queued up for 6.10, which I both missed (sorry for that!).
> > > If I'm able to properly backport the patch for 6.1 I'll send that one,
> > > but my hopes are not too high that this will work ..
> > 
> > There are two conflicts.
> > 
> > The one in include/linux/virtio_net.h is resolved by first backporting
> > commit fc8b2a6194693 ("net: more strict VIRTIO_NET_HDR_GSO_UDP_L4
> > validation")
> > 
> > We did not backport that to stable because there was some slight risk
> > that applications might be affected. This has not surfaced.
> > 
> > The conflict in net/ipv4/udp_offload.c is not so easy to address.
> > There were lots of patches between v6.1 and linus/master, with far
> > fewer of these betwee v6.1 and linux-stable/linux-6.1.y.
> 
> BTW, we successfully cherry-picked 3 suggested[1] commits over v6.1.105 in
> ALT, and there is no reported problems as of yet.
> 
>   89add40066f9 ("net: drop bad gso csum_start and offset in virtio_net_hdr")
>   fc8b2a619469 ("net: more strict VIRTIO_NET_HDR_GSO_UDP_L4 validation")
>   9840036786d9 ("gso: fix dodgy bit handling for GSO_UDP_L4")
> 
> [1] https://lore.kernel.org/all/2024081147-altitude-luminous-19d1@gregkh/

That's good to hear.

These are all fine to go to 6.1 stable.
