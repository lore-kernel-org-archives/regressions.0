Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CFE18B0F
	for <regressions@lists.linux.dev>; Fri, 29 May 2026 20:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085062; cv=none; b=X7bUC2tl1tcBJYgVWIKx39mDSLLKcGdrHfUcXr5okd3JRF7w0HVMqURd73EyTus++0OD/j++LpRIezSmVHHvsbu/+bEmFTd89/1FRC2wMBKm+17c0KUHdmKLokzImoq0AQw+3PYyhrBl2j1XiDzEWbTB1qtZfr9GZ13qxbzLc+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085062; c=relaxed/simple;
	bh=19te2L4R7X9KgHW/okJn55tkovMnD2HKiqsXZmxnaUg=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=DQWZR4AYP7d9K1MJK7NNAI5LflL1VkkFHt9Fw78PF6cchq2xft4KT8JocmDGT1s7P66SeMsfW5s4vGLdzviUIPq9KJkMyLqKxZ3j2SCV8ITDLu2P9wakO8GpyL4CTXbJZupHa3di6dgeLmaV9W/8UQA/8NaLloGvdhrqMia4pWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LGVzRaTn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LGVzRaTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780085060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKdte5oW96Gd0xHHGygvAJsrAnMBrUSbmKf7IApKNk0=;
	b=LGVzRaTnTyIIMxm3o+7JoqKdRQuM/d02o0ZT9BxLgorEBpDWkqanWS7Y86qg3z0qhu45qH
	uNfWOXeG1RWIEQ4rwTExkMxZe4oAln6GcMK5ozOs0APwNbOJKgdnFB2ER9tECCg032pRu0
	Lc67z7wr9VI5B/gCkerqMSdlP54tl8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-ahDKO-j6Nj-JckrA8oCzvg-1; Fri, 29 May 2026 16:04:18 -0400
X-MC-Unique: ahDKO-j6Nj-JckrA8oCzvg-1
X-Mimecast-MFC-AGG-ID: ahDKO-j6Nj-JckrA8oCzvg_1780085057
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49043386b3fso72611255e9.3
        for <regressions@lists.linux.dev>; Fri, 29 May 2026 13:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780085057; x=1780689857;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKdte5oW96Gd0xHHGygvAJsrAnMBrUSbmKf7IApKNk0=;
        b=KR8KRcCSZXQ240eEVaBMO8wprmF9MpF61Uv9NWh6HX/ZYZ2DsrxFq83KjjdoiYDWTD
         nORKkL4wRn7hHxQ/5l4st+DVGadXZ1kMaReW81iSwbCEBZqHOapXBZbvd2Qdx0BwkTLM
         C3EKnv8N+mEQYjxU5pnHgEXRJ8b6Ay44DioB/tVu3Ua4JY9s0aAsb+oJpH/19Ajk4tGs
         6TpKMH5pRdx/BI5IAGz358O3PD867CHlXEoF0Em8vmRKLRGRGYVQ5zNjDJtQ9DBpmIny
         GJxFqeKgVLLSrqBE0Bitwhx0tyCPZi+V9c5dll4IP1obOc+Hy80jUIlXvb1xSQlxM6J7
         iiDA==
X-Forwarded-Encrypted: i=1; AFNElJ+uXR+dXW1bQ7jIiVQYpIxHDEgsjZc4uw2Hca9azu2TWw+HCA3VRDKM3ib1GT6WxWszV9ZFZcwnSgYUoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyDQTu5xItB+SqvUkm3JwDl0n9Zmj691thbs6VWVZgSfCgK8im
	p8tPK0eoZt0i2OjzB3CkQS3g1T+Sq0EDhorB0YdowgKfXtCkQ9opzp1lB1QhUDBMiCd2m+cMsWp
	176vOGC67KOHn8OBSvNlh67MXJmWcE0puvpyNJs1ufI3/MHw2BcQvVBTlQEOwVf+0
X-Gm-Gg: Acq92OEIGJTrYxoD2lg1/WmH99Bu2OLPyiGve8n0WJveDUGZOzr3kq5+QL3vbmpximd
	0yWdlbSKJzlRJnJNxOBF/o1I9UDfj7tKu0WpEEa03wcJ9xWx1rEYG+LJ7eGIE47GGzQZV6blarS
	lbULkHPCWkiGQ5hnJQIY2EAz6KsoULqXA+Nn0eO7XVp6FdJDAGwXw6WsX9qESMz/YKiPRl5F83f
	2BfPsj9GOc9idJ5oxSQ/Q9HpsiRTTJlYYN9jOK0y0F5G7NOf2X7xWpArIIejM+ic3ordZkyOWF8
	uTqcMH1UtJzHPt9guL9L7TLhQIIRs/XH0FBLtRwU+P3xTdoRqJ0BEIASKlcwjSUPaSn7wacA1CW
	vqembqYCZVYuEq4yJUhbEia3r0ALr1fH1sVGkapekHiKD12T6JrqW4V055uxc
X-Received: by 2002:a05:600c:e48a:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490a2939daamr11562875e9.23.1780085057326;
        Fri, 29 May 2026 13:04:17 -0700 (PDT)
X-Received: by 2002:a05:600c:e48a:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490a2939daamr11562545e9.23.1780085056875;
        Fri, 29 May 2026 13:04:16 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef358c07bsm5968003f8f.36.2026.05.29.13.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 13:04:16 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Tj <tj.iam.tj@proton.me>
Cc: =?UTF-8?B?w43DsWlnbw==?= Huguet <ihuguet@redhat.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Fernando Fernandez Mancera <fmancera@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Yumei Huang
 <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, Justin Iurman
 <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Beniamino Galvani <bgalvani@redhat.com>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260529220415.22d0be8d@elisabeth>
In-Reply-To: <ahnaz3ppxyVHl3xB@mail.iam.tj>
References: <ahnaz3ppxyVHl3xB@mail.iam.tj>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 29 May 2026 22:04:15 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uRbUdwEyhjOXDntPgSB1o7uUTJ3xeFjq2Wmb2_Sprng_1780085057
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 18:28:58 +0000
Tj <tj.iam.tj@proton.me> wrote:

> I believe I hit this on a router using Debian 13 with v7.0.* kernel this week that
> uses systemd-networkd to configure IPV6 RA and prefix delegation after
> moving from v6.19.*.
> 
> Symptom was the router could no longer reach public IPv6 addresses
> itself but forwarding was unaffected.
> 
> The ISP (Starlink) provides a /64 prefix via RA and a /56 via DHCPv6. networkd
> allocates a static suffix address from both to the WAN-side interface.
> 
> I discovered after much experimentation that instead of the usual /56
> address being the source it was choosing the /64 and failing.

Do you really mean an address configured as /56, or a /64 address that
systemd-networkd derives from a /56 delegated prefix?

Because more specific addresses / longest matching prefixes (RFC 6724
Section 5., Rule 8, implemented by ipv6_get_saddr_eval()) should anyway
be preferred as source addresses, regardless of the order of insertion
of addresses with the same scope.

I'm looking into possible assumptions made by systemd-networkd in this
case. *If* this is confirmed, I also start thinking that a revert and
exporting the correct implementation as non-default using a netlink
flag would be preferable. at this point.

> Router uses policy routing so my work-around was to add a rule so the
> /64 address is added to the WAN interface's route table.
> 
> [RoutingPolicyRule]
> To=::/0
> From=2a0d:3344:aaaa:bbbb::/64
> Priority=30100
> Table=starlink
> 
> The WAN interface config for  RA and PD is:
> 
> [IPv6AcceptRA]
> UseGateway=yes
> UseDNS=no
> UseDomains=no
> Token=static:::ff
> # when RouteTable is set a table name is explicitly required in any [Route] section without a Table= of its own
> # names defined in /etc/systemd/networkd.conf.d/51-RouteTable.conf as:  [Network] RouteTable=
> RouteTable=starlink
> 
> [DHCPv6]
> UseAddress=no
> UseDNS=no
> UseNTP=no
> UseHostname=no
> UseDomains=no
> UseDelegatedPrefix=yes
> PrefixDelegationHint=::/56
> ## asked for in RFE https://github.com/systemd/systemd/issues/31566
> ##RouteTable=starlink
> 
> [DHCPPrefixDelegation]
> Announce=false
> UplinkInterface=:self
> Assign=yes
> Token=static:::1
> SubnetId=0xff

-- 
Stefano

