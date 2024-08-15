Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC61AD3F3
	for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 15:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735700; cv=none; b=uTTSRxkrErJn0NZJMCF+DYEPD75unWGScvtbObWwOKgrbY0mY5BzFULL4BrSrHG+LX+juPvA8TY8VFjy2TwmOWI5U8ZJe7SOmcVoNXkp68mR8Cvg6lrSnpTQJxNbYIctX8yrIoqKakofCLzdUTEQDs0jjYzKIRP0gUU+DTmL/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735700; c=relaxed/simple;
	bh=w6Y8keq7MC/RcB+oPriVQpHgxKv2tM3osBO16JjXgjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gduHuKpLEOQQXaIT1khqKmaLfHitJYkvKwZ37NL666uJZqvynULWwF+a8qIdYLEJEPDWCPTZyJWohd/YOZHl5OPO8+YPRNDAA3/MBIdtTnR3eKs+Zcf7sKYYF8ZezbCeoQnzNir3KPwC3N3kewqJAaqyVftdaOceAaQlrU8M5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQCOrHGv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQCOrHGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723735698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XnzeqT3NI2WawfrxS2a5Y4awkZprFbrha1qv4O7ZfPE=;
	b=dQCOrHGvSYBj2Uoz8DGSZy3N08wPxIivMYGiDol+eaADuXzA5cZDDvp9fXmV/X4aAD6NE8
	v+nZ2VkYsWGiRnIvChr9knoiSKw8TnHxzH2h3g7iCn4IhuySybGkdIhzMSK1C2ZtUADyoe
	Fchwx72gvQx1ymwix5PUOG5jM+oHHuQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-2kOYq_KaPju6CDMcjLMrQQ-1; Thu, 15 Aug 2024 11:28:17 -0400
X-MC-Unique: 2kOYq_KaPju6CDMcjLMrQQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a2d4fb1e73so814200a12.2
        for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 08:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723735695; x=1724340495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnzeqT3NI2WawfrxS2a5Y4awkZprFbrha1qv4O7ZfPE=;
        b=WllE2P5yUH2oRUxKNTndoJvTroyek2A14sqtYYf9wWwB0KjAYu1QNNKEArSDsP0rlX
         2qdf5rlSuO2yznsnsdMDGo20o2RDNvaefL60/5SntGJ8GsnAjFFeKbCxkJ0e/q3olEh7
         ZzgDCZ8rA0H1JAeEoEkUR0JIDrRMfAPJkcI4/jEbu+h+FBp3dl50ZqQZwjRcLwdUPRdk
         SOaSu6WzyXME9OKGfvsnDKZfX/5DjitTpj0F7ZiNJjiWv5lf5IQT6LKpYzIq1+zYewOA
         Vu9rq55UmYYpb2UuoUfBesAkwGU4XCGmhEOpknz8PmNQsUGqKSKhF5esadfPRj2Akqvl
         b9Iw==
X-Gm-Message-State: AOJu0Yya0VcLAs91oLFGP87YxQu6lpffHZUiHsnFl6GynwHA9zm6Me9F
	PBKeoz4iG0dYU8vGMxZi6B9EvhctwZwmQEIB9lA1ZCM3SEkc9uUDEjzgdBohJNC13dQ7diwN065
	fvUkroXvjD4qCecZy7L7kMqAwtidrdcAIGqCiw5DbNXkvHBozcLyXq0VXUYdZldR33ERIliZmaD
	1JtBW3pjFgI+c8qTJFh71HbfpRgVi0+74divnH/g==
X-Received: by 2002:a05:6402:510b:b0:57d:12c3:eca6 with SMTP id 4fb4d7f45d1cf-5bea1c7c716mr4272250a12.18.1723735695259;
        Thu, 15 Aug 2024 08:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/D7aBbTHDx3JnriGHYm8AR362yS4TnGCkKy4ZMsjbocDfbfeVNGG4wtZoRfQcR4P1Ow+x2w==
X-Received: by 2002:a05:6402:510b:b0:57d:12c3:eca6 with SMTP id 4fb4d7f45d1cf-5bea1c7c716mr4272220a12.18.1723735694455;
        Thu, 15 Aug 2024 08:28:14 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbe7f17bsm1022082a12.59.2024.08.15.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 08:28:13 -0700 (PDT)
Date: Thu, 15 Aug 2024 11:28:10 -0400
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
Message-ID: <20240815112508-mutt-send-email-mst@kernel.org>
References: <20240511031404.30903-1-xuanzhuo@linux.alibaba.com>
 <a6ec1c84-428f-41b7-9a57-183f2aeca289@leemhuis.info>
 <20240815112228-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240815112228-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 11:23:19AM -0400, Michael S. Tsirkin wrote:
> On Thu, Aug 15, 2024 at 09:14:27AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > [side note: the message I have been replying to at least when downloaded
> > from lore has two message-ids, one of them identical two a older
> > message, which is why this looks odd in the lore archives:
> > https://lore.kernel.org/all/20240511031404.30903-1-xuanzhuo@linux.alibaba.com/]
> 
> Sorry, could you clarify - which message has two message IDs?

Ouch. The one I sent had a bad message Id :(
Donnu how it happened, I guess I was mucking with it
manually and corrupted it. Really sorry.

