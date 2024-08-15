Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DD51AED32
	for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735404; cv=none; b=AK84XCmLqb6qQPgCCHBWVOF1hopNGwdy07PMishmQRZTbdihjLf8zJ0PDX0XwN3xxe2VJrH0nqZ4GaBOU5NCBd8ooCo3LuAqkthENHSab/1ufXhfTiyn/hRjSDsYL3imYqFNdz0az114vlbQRNbpUD0qb04IzhpjcH5NScClGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735404; c=relaxed/simple;
	bh=Z0PZF3iT3kmG4kVxpER+Pkc+8Vs70AzAJbTnaHohF+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gJfkwAK7h5VQRRGFC6WNo7m1WlvVRVb2Um9XwRUYYfcTBx2j/HamM8dMACowx39BDeaxwP2ot1JMRcpKz6jMgCtidN3n5355r2DndpcFtLFbTDfwbQufohmeHhbKz4NMdWlgtIvBu7h3aXrvss0plpelgT63LEBshUvjxEzTKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFQD0nev; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFQD0nev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723735402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0PZF3iT3kmG4kVxpER+Pkc+8Vs70AzAJbTnaHohF+Q=;
	b=eFQD0nevqfO/haJ9/Ucomfn3UuNhzfJNzpIHMP6gaeReC9MKunvTd82n7Q6rbyFvjfSjGt
	UbRXmHIsOs8rJgHMP3jfluxZ8c8tsKve0iDVN2+bG+JNm+F1SDGvi+XtRf2Wa+qBhRotq/
	G+JQckSpTu+5gCmgId2vkEZU+5babXo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-5jFEk3qNPHaA1zsSzrqBIw-1; Thu, 15 Aug 2024 11:23:21 -0400
X-MC-Unique: 5jFEk3qNPHaA1zsSzrqBIw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7aa7e86b5eso95402966b.2
        for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 08:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723735399; x=1724340199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0PZF3iT3kmG4kVxpER+Pkc+8Vs70AzAJbTnaHohF+Q=;
        b=DG4cmOYz97KQsz3dJSBgp8d2OlmFNf2DgcGq2OJ2YMgcp77Q/dI/ZVqjVYE/zhVZaO
         NaA9TOe6sItQRKa+28WnkGwGiwv8IjVu8z9MT360vICvjcCDRyCABrLGPT2WhFEImjwb
         gU4eioA/zSCNmtnKUqtrPmw+D6ey63SIUG0rTD/23I9uHlTN/S5+mc2Y55OU5tYZkBEr
         AylMzF4NcjG5a3/5cN+we8Vyk5tmIoik/5sh4T/9NhbVs8rhkpJuoQarvgc4uXUjD0+J
         VHFLod1FKqvbm3ZAixBU1f+gMZf3ty7+naPYQEvvO7QOjA4PL3uu1Pvm+swnU3b8Aa2j
         siPA==
X-Gm-Message-State: AOJu0YyT5tCZ8lBhfNqmyfzWRFSgwMIwKlL3blsD7g0RMQCls/uh5Tid
	68lJXGEEsSww4PSvLWi5J5OdBApwYv0vgmSd7bwE3tljOdPXg2LOxAGBx7OhpfxKkPxRbLKJv6R
	mjdzblE2IWKVCX5q01rW3Q25tCORXCPG+fbmm70W3VtTRTM0XhEgFf+P4EY0SzSFyd+M05s1Zmf
	SoFxaQyonblons5C8uzOLvWGVSgBOo66IOQIN5NA==
X-Received: by 2002:a17:907:f782:b0:a7a:9f0f:ab14 with SMTP id a640c23a62f3a-a8366d7786fmr467852166b.33.1723735399634;
        Thu, 15 Aug 2024 08:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmfTaj56j9tYVD0QKL1sNvdoIgl/XRqpaSrAVLu8JRyiak502h9wKyYixOsF/EtaN1gS67Hg==
X-Received: by 2002:a17:907:f782:b0:a7a:9f0f:ab14 with SMTP id a640c23a62f3a-a8366d7786fmr467848466b.33.1723735398782;
        Thu, 15 Aug 2024 08:23:18 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c65f2sm117028966b.29.2024.08.15.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 08:23:16 -0700 (PDT)
Date: Thu, 15 Aug 2024 11:23:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	virtualization@lists.linux.dev,
	Darren Kenny <darren.kenny@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH RFC 0/3] Revert "virtio_net: rx enable premapped mode by
 default"
Message-ID: <20240815112228-mutt-send-email-mst@kernel.org>
References: <20240511031404.30903-1-xuanzhuo@linux.alibaba.com>
 <a6ec1c84-428f-41b7-9a57-183f2aeca289@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a6ec1c84-428f-41b7-9a57-183f2aeca289@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 09:14:27AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> [side note: the message I have been replying to at least when downloaded
> from lore has two message-ids, one of them identical two a older
> message, which is why this looks odd in the lore archives:
> https://lore.kernel.org/all/20240511031404.30903-1-xuanzhuo@linux.alibaba.com/]

Sorry, could you clarify - which message has two message IDs?

